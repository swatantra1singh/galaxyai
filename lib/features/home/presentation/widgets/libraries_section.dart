import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class LibrariesSection extends StatelessWidget {
  const LibrariesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final libraries = [
      {
        'name': AppConstants.imageLibrary,
        'icon': Icons.image,
        'gradientStart': const Color(0xFF7C4DFF),
        'gradientEnd': const Color(0xFF9D4EDD),
      },
      {
        'name': AppConstants.videoLibrary,
        'icon': Icons.videocam,
        'gradientStart': const Color(0xFFFF6B6B),
        'gradientEnd': const Color(0xFFFF8E53),
      },
      {
        'name': AppConstants.audioLibrary,
        'icon': Icons.audiotrack,
        'gradientStart': const Color(0xFF06D6A0),
        'gradientEnd': const Color(0xFF118AB2),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppConstants.libraries,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: libraries.length,
            itemBuilder: (context, index) {
              final library = libraries[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        library['gradientStart'] as Color,
                        library['gradientEnd'] as Color,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              library['icon'] as IconData,
                              color: Colors.white.withOpacity(0.9),
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              library['name'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 16,
                        bottom: 16,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
