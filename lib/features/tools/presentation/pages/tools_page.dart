import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/tool_card.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  String _selectedCategory = AppConstants.all;

  final List<Map<String, dynamic>> _tools = [
    {
      'name': AppConstants.aiVideoGenerator,
      'category': AppConstants.video,
      'icon': Icons.videocam,
      'isTrending': true,
      'isFavorite': true,
      'image': 'https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=AI+Video',
    },
    {
      'name': AppConstants.aiImageGenerator,
      'category': AppConstants.image,
      'icon': Icons.image,
      'isTrending': true,
      'isFavorite': true,
      'image': 'https://via.placeholder.com/300x200/7C4DFF/FFFFFF?text=AI+Image',
    },
    {
      'name': AppConstants.textToSpeech,
      'category': AppConstants.text,
      'icon': Icons.text_fields,
      'isTrending': true,
      'isFavorite': false,
      'image': 'https://via.placeholder.com/300x200/118AB2/FFFFFF?text=Text+to+Speech',
    },
    {
      'name': AppConstants.aiVoiceChanger,
      'category': AppConstants.audio,
      'icon': Icons.graphic_eq,
      'isTrending': true,
      'isFavorite': false,
      'image': 'https://via.placeholder.com/300x200/FF8E53/FFFFFF?text=Voice+Changer',
    },
    {
      'name': AppConstants.aiVoiceCloner,
      'category': AppConstants.audio,
      'icon': Icons.mic,
      'isTrending': true,
      'isFavorite': false,
      'image': 'https://via.placeholder.com/300x200/9D4EDD/FFFFFF?text=Voice+Cloner',
    },
    {
      'name': AppConstants.aiClothesChanger,
      'category': AppConstants.image,
      'icon': Icons.checkroom,
      'isTrending': true,
      'isFavorite': false,
      'image': 'https://via.placeholder.com/300x200/06D6A0/FFFFFF?text=Clothes+Changer',
    },
  ];

  List<Map<String, dynamic>> get _filteredTools {
    if (_selectedCategory == AppConstants.all) {
      return _tools;
    }
    return _tools
        .where((tool) => tool['category'] == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.scatter_plot, color: AppTheme.primaryPurple),
            const SizedBox(width: 8),
            const Text(AppConstants.appName),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildCategoryTabs(),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredTools.length,
              itemBuilder: (context, index) {
                return ToolCard(tool: _filteredTools[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = [
      {'name': AppConstants.all, 'icon': Icons.apps},
      {'name': AppConstants.image, 'icon': Icons.image},
      {'name': AppConstants.video, 'icon': Icons.videocam},
      {'name': AppConstants.text, 'icon': Icons.text_fields},
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category['name'];

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilterChip(
              selected: isSelected,
              label: Row(
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: 18,
                    color: isSelected ? Colors.white : AppTheme.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(category['name'] as String),
                ],
              ),
              backgroundColor: AppTheme.cardBackground,
              selectedColor: AppTheme.primaryPurple,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category['name'] as String;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
