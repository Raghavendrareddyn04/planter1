import 'package:flutter/material.dart';
import '../services/language_service.dart';

class LocalizedText extends StatefulWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LocalizedText(
    this.textKey, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  State<LocalizedText> createState() => _LocalizedTextState();
}

class _LocalizedTextState extends State<LocalizedText> {
  final _languageService = LanguageService();

  @override
  void initState() {
    super.initState();
    _languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    _languageService.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged(String _) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _languageService.getText(widget.textKey),
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}
