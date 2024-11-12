import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/localized_text.dart';
import '../services/language_service.dart';

class ContactFormScreen extends StatefulWidget {
  const ContactFormScreen({super.key});

  @override
  _ContactFormScreenState createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _languageService = LanguageService();
  XFile? _screenshot;
  Uint8List? _screenshotBytes;
  bool _isLoading = false;

  static const String _sheetsUrl =
      'https://script.google.com/macros/s/AKfycbw0bV7hFElazNHHIcP6XKNrbUF0yk8yMP177nGlPK5hwtK-vCM0Plb_1rOtm1Gdwa5ATg/exec';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (image != null) {
        final bytes = await image.readAsBytes();
        setState(() {
          _screenshot = image;
          _screenshotBytes = bytes;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _screenshotBytes != null) {
      setState(() {
        _isLoading = true;
      });

      try {
        final base64Image = base64Encode(_screenshotBytes!);

        final formData = {
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'description': _descriptionController.text,
          'screenshot': base64Image,
          'timestamp': DateTime.now().toIso8601String(),
        };

        final response = await http.post(
          Uri.parse(_sheetsUrl),
          body: json.encode(formData),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200 || response.statusCode == 302) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: LocalizedText('form_submitted_successfully'),
            ),
          );
          Navigator.pop(context);
        } else {
          throw Exception('Failed to submit form: ${response.statusCode}');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: LocalizedText('error_submitting_form'),
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else if (_screenshotBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: LocalizedText('please_attach_screenshot'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('contact_us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: _languageService.getText('name_label'),
                  hintText: _languageService.getText('enter_name_hint'),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _languageService.getText('name_required');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: _languageService.getText('email_label'),
                  hintText: _languageService.getText('enter_email_hint'),
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _languageService.getText('email_required_');
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return _languageService.getText('email_invalid');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: _languageService.getText('phone_label'),
                  hintText: _languageService.getText('enter_phone_hint'),
                  prefixIcon: const Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _languageService.getText('phone_required_');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LocalizedText(
                        'screenshot',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (_screenshotBytes != null)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.memory(
                              _screenshotBytes!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  _screenshot = null;
                                  _screenshotBytes = null;
                                });
                              },
                            ),
                          ],
                        ),
                      Tooltip(
                        message: _languageService.getText('add_screenshot'),
                        child: ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: const Icon(Icons.add_photo_alternate),
                          label: LocalizedText(_screenshot == null
                              ? 'add_screenshot'
                              : 'change_screenshot'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: _languageService.getText('description_label'),
                  hintText: _languageService.getText('enter_description_hint'),
                  prefixIcon: const Icon(Icons.description),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return _languageService.getText('description_required_');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Tooltip(
                message: _languageService.getText('send'),
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const LocalizedText('send'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
