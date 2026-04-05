import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/core/widgets/project_container.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
        child: const _Content()
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build (BuildContext context) {
    List<Project> projects = [
      Project(
        title: 'Nutripal',
        description: 'AI-Powered Nutrition & Fitness App',
        techStack: ['Flutter', 'Api Integration', 'UI/UX', 'FastAPI', 'MySQL', 'Firebase'],
        onCodeTap: () => {},
        onDemoTap: () => {},
        coverImagePath: '',
      ),
      Project(
        coverImagePath: 'assets/automatic_demonstration.png',
        title: 'Automatic demonstration',
        description: 'Hands-free Flutter mobile app for location-triggered multilingual audio guides for street food discovery.',
        techStack: [
          'Flutter (Dart 3)',
          'Riverpod',
          'Vietmap GL',
          'Just Audio',
          'Geolocator',
          'Dio',
          'Intl'
        ],
        onCodeTap: () =>
          launchUrl(Uri.parse('https://github.com/giahuyto3107/automatic_demonstration.git')),
        onDemoTap: () => {}
      ),
      Project(
        title: 'Tiktok-clone',
        description: 'Android app for a short-video social media application.',
        techStack: ['Jetpack compose', 'Api Integration', 'FastAPI', 'MySQL', 'Firebase'],
        onDemoTap: () => {},
        coverImagePath: 'assets/tiktok.png',
        isCover: false,
        subLinks: {
          "Mobile's repo": 'https://github.com/giahuyto3107/Tiktok-clone.git',
          "Backend's repo": 'https://github.com/giahuyto3107/tiktok_clone_backend.git'
        }
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: .max,
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          HighLightTitle(
            primaryText: 'My Projects',
            secondaryText: 'Showcasing my latest works and innovations',
          ),

          ListView.separated(
            shrinkWrap: true,
            itemCount: projects.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.spacingXL.h,
              );
            },
            itemBuilder: (context, index) {
              return ProjectContainer(
                project: projects[index],
              );
            }
          ),

          SizedBox(height: AppConstants.spacingXXXL.h,),
        ],
      ),
    );
  }
}

