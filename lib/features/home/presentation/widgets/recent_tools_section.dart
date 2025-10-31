import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class RecentToolsSection extends StatelessWidget {
  final bool isFavorites;

  const RecentToolsSection({super.key, this.isFavorites = false});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {
        'name': AppConstants.aiImageGenerator,
        'description':
            'Produce stunning AI-generated images and artwork to visualize your ideas.',
        'icon': Icons.image,
      },
      {
        'name': AppConstants.aiVideoGenerator,
        'description':
            'Create engaging videos in seconds using AI-powered video generation.',
        'icon': Icons.videocam,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        final tool = tools[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.gradientStart, AppTheme.gradientEnd],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                tool['icon'] as IconData,
                color: Colors.white,
              ),
            ),
            title: Text(
              tool['name'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              tool['description'] as String,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        );
      },
    );
  }
}
