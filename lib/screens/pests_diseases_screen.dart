import 'package:flutter/material.dart';
import '../widgets/localized_text.dart';

class PestsDiseasesScreen extends StatefulWidget {
  const PestsDiseasesScreen({super.key});

  @override
  _PestAndDiseasesPageState createState() => _PestAndDiseasesPageState();
}

class _PestAndDiseasesPageState extends State<PestsDiseasesScreen> {
  bool _showMoreSeedling = false;
  bool _showMoreVegetative = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('pests_diseases_title'),
        backgroundColor: const Color(0xFFFFF3E0),
      ),
      body: Container(
        color: const Color(0xFFFFF3E0),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildStageSection('seedling_stage', Colors.teal, [
              _buildDiseaseCard(
                'damping_off',
                'fungi_type',
                Colors.green[50]!,
                'assets/images/damping_off.jpg',
                'damping_off_desc',
              ),
              _buildDiseaseCard(
                'bacterial_black_spot',
                'bacteria_type',
                Colors.green[100]!,
                'assets/images/bacterial_black_spot.jpg',
                'bacterial_black_spot_desc',
              ),
              if (_showMoreSeedling) ...[
                _buildDiseaseCard(
                  'aphids',
                  'insect_type',
                  Colors.green[50]!,
                  'assets/images/aphids.jpg',
                  'aphids_desc',
                ),
                _buildDiseaseCard(
                  'black_citrus_aphid',
                  'insect_type',
                  Colors.green[100]!,
                  'assets/images/black_citrus_aphid.jpg',
                  'black_citrus_aphid_desc',
                ),
              ],
            ], () {
              setState(() {
                _showMoreSeedling = !_showMoreSeedling;
              });
            }, _showMoreSeedling),
            _buildStageSection('vegetative_stage', Colors.indigo, [
              _buildDiseaseCard(
                'phoma_blight',
                'fungi_type',
                Colors.blue[50]!,
                'assets/images/phoma_blight.jpg',
                'phoma_blight_desc',
              ),
              _buildDiseaseCard(
                'pineapple_disease',
                'fungi_type',
                Colors.blue[100]!,
                'assets/images/pineapple_disease.jpg',
                'pineapple_disease_desc',
              ),
              if (_showMoreVegetative) ...[
                _buildDiseaseCard(
                  'sooty_mold',
                  'fungi_type',
                  Colors.blue[50]!,
                  'assets/images/sooty_mold.jpg',
                  'sooty_mold_desc',
                ),
                _buildDiseaseCard(
                  'anthracnose',
                  'fungi_type',
                  Colors.blue[100]!,
                  'assets/images/anthracnose.jpg',
                  'anthracnose_desc',
                ),
              ],
            ], () {
              setState(() {
                _showMoreVegetative = !_showMoreVegetative;
              });
            }, _showMoreVegetative),
          ],
        ),
      ),
    );
  }

  Widget _buildStageSection(String stageKey, Color color, List<Widget> diseases,
      VoidCallback onSeeMore, bool showMore) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LocalizedText(
          stageKey,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: diseases,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onSeeMore,
          child: LocalizedText(showMore ? 'see_less' : 'see_more'),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildDiseaseCard(String nameKey, String typeKey, Color color,
      String imagePath, String descriptionKey) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
            const SizedBox(height: 8),
            LocalizedText(
              nameKey,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            LocalizedText(
              typeKey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            LocalizedText(
              descriptionKey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}