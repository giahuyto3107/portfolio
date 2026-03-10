import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/projects/data/models/project.dart';

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
        description: 'AI',
        techStack: ['Flutter', 'Api Integration', 'UI/UX', 'FastAPI', 'MySQL'],
        onCodeTap: () => {},
        onDemoTap: () => {},
      ),
      Project(
        title: 'Tiktok-clone',
        description: 'Tiktok-clone app',
        techStack: ['Jetpack compose', 'Api Integration', 'FastAPI', 'MySQL', 'Firebase'],
        onCodeTap: () => {},
        onDemoTap: () => {},
      ),
    ];

    return SingleChildScrollView(
      child: Column(
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
                return _ProjectContainer(
                  project: projects[index],
                );
              }
          )
        ],
      ),
    );
  }
}

class _ProjectContainer extends StatelessWidget {
  final Project project;
  const _ProjectContainer({required this.project});

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        _ProjectUpperSection(),
        _ProjectLowerSection(
          project: project,
        ),
      ],
    );
  }
}

class _ProjectUpperSection extends StatelessWidget {
  const _ProjectUpperSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      
      decoration: BoxDecoration(
        gradient: AppColors.horizontalGradientButton,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusL.r)
        ),
      ),
    );
  }
}

class _ProjectLowerSection extends StatelessWidget {
  final Project project;

  const _ProjectLowerSection({
    required this.project
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff152f50),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppConstants.radiusL.r)
        )
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM.w,
        vertical: AppConstants.spacingS.h,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            project.title,
            style: TextStyle(
              fontSize: AppConstants.fontM.sp,
              fontWeight: .w500,
              color: AppColors.textOnDark
            ),
          ),
      
          Text(
            project.description,
            style: TextStyle(
              fontSize: AppConstants.fontS.sp,
              fontWeight: .w400,
              color: AppColors.disable
            ),
          ),
      
          _TechStackSection(
              skills: project.techStack,
          ),
        ],
      ),
    );
  }
}

class _TechStackSection extends StatelessWidget {
  final List<String> skills;
  const _TechStackSection({required this.skills});

  @override
  Widget build (BuildContext context) {
    final double spacing = AppConstants.spacingXS.w;

    return Wrap(
      spacing: spacing,      // Horizontal space between fields
      runSpacing: spacing,   // Vertical space between rows
      children: skills.map((skill) {

        return _TechStackContainer(skill: skill);
      }).toList(),
    );
  }
}

class _TechStackContainer extends StatelessWidget {
  final String skill;
  const _TechStackContainer({required this.skill});

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0e67d7),
        borderRadius: BorderRadius.circular(AppConstants.radiusM.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingS.w,
        vertical: AppConstants.spacingS.h,
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: AppConstants.fontXS.sp,
          fontWeight: .w500,
          color: AppColors.textOnDark
        ),
      ),
    );
  }
}