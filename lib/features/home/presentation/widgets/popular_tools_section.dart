import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class PopularToolsSection extends StatelessWidget {
  const PopularToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'name': AppConstants.aiImageGenerator, 'icon': Icons.image, 'color': Colors.blue},
      {'name': AppConstants.aiVideoGenerator, 'icon': Icons.videocam, 'color': Colors.orange},
      {'name': AppConstants.aiMusicGenerator, 'icon': Icons.music_note, 'color': Colors.pink},
      {'name': AppConstants.aiVoiceCloner, 'icon': Icons.mic, 'color': Colors.purple},
      {'name': AppConstants.aiIconGenerator, 'icon': Icons.star, 'color': Colors.amber},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstants.popularTools,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppConstants.seeAll,
                  style: TextStyle(color: AppTheme.primaryPurple),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: tools.length,
            itemBuilder: (context, index) {
              final tool = tools[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            (tool['color'] as Color).withOpacity(0.7),
                            tool['color'] as Color,
                          ],
                        ),
                      ),
                      child: Icon(
                        tool['icon'] as IconData,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 70,
                      child: Text(
                        tool['name'] as String,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
