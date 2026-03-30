import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
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
        subLinks:
          SubLinks(
            feLink: 'https://github.com/giahuyto3107/Tiktok-clone.git',
            beLink: 'https://github.com/giahuyto3107/tiktok_clone_backend.git'
          ),
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
              return _ProjectContainer(
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

class _ProjectContainer extends StatelessWidget {
  final Project project;
  const _ProjectContainer({required this.project});

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        _ProjectUpperSection(
          project: project,
        ),
        _ProjectLowerSection(
          project: project,
        ),
      ],
    );
  }
}

class _ProjectUpperSection extends StatelessWidget {
  final Project project;

  const _ProjectUpperSection({
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return project.coverImagePath == '' ? Container(
      height: 125.h,
      decoration: BoxDecoration(
        gradient: AppColors.horizontalGradientButton,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusL.r)
        ),
      ),
    ) : SizedBox(
      height: 125.h,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusL.r)
        ),
        child: Image.asset(
          project.coverImagePath,
          fit: project.isCover ? .cover : .contain,
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
    bool showCodeTap = project.onCodeTap != null;

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
        vertical: AppConstants.spacingM.h,
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
          SizedBox(height: AppConstants.spacingXS.h,),
          Text(
            project.description,
            style: TextStyle(
              fontSize: AppConstants.fontS.sp,
              fontWeight: .w400,
              color: AppColors.disable
            ),
          ),
          SizedBox(height: AppConstants.spacingS.h,),
          _TechStackSection(
            skills: project.techStack,
          ),

          SizedBox(height: AppConstants.spacingM.h,),
          _ActionButtons(
            project: project,
            showCodeTap: showCodeTap,
          ),

          showCodeTap ? Container()
              : _SubCodeRow(subLinks: project.subLinks!,)
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
  Widget build(BuildContext context) {
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

class _ActionButtons extends StatelessWidget {
  final Project project;
  final bool showCodeTap;

  const _ActionButtons({
    required this.project,
    this.showCodeTap = true
  });

  @override
  Widget build (BuildContext context) {
    return Row(
      children: [
        showCodeTap ? GestureDetector(
          onTap: () => project.onCodeTap!(),
          child: _ActionContainer(
            bgColor: Color(0xff24242B),
            icon: Icons.code,
            label: 'Code'
          ),
        ) : Container(),
        showCodeTap ? SizedBox(width: AppConstants.spacingM.w,) : Container(),
        GestureDetector(
          onTap: () => project.onDemoTap(),
          child: _ActionContainer(
            bgColor: Color(0xff10B924),
            icon: Icons.play_arrow,
            label: 'Demo'
          ),
        ),
      ],
    );
  }
}

class _ActionContainer extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final String label;

  const _ActionContainer({
    required this.bgColor,
    required this.icon,
    required this.label
  });

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: .circular(AppConstants.radiusM.r)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM.w,
        vertical: AppConstants.spacingS.h,
      ),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          Icon(
            icon,
            color: AppColors.textOnDark,
            size: AppConstants.fontL.sp,
          ),
          SizedBox(width: AppConstants.spacingXS.w,),
          Text(
            label,
            style: TextStyle(
              fontSize: AppConstants.fontXS.sp,
              fontWeight: .w500,
              color: AppColors.textOnDark
            ),
          )
        ],
      ),
    );
  }
}

class _SubCodeRow extends StatelessWidget {
  final SubLinks subLinks;
  const _SubCodeRow({required this.subLinks});

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppConstants.spacingM.h,),

        Row(
          children: [
            _SubCodeLine(
              label: "Mobile's repo",
              link: subLinks.feLink,
              color: Color(0xfff97015),
            ),
            SizedBox(width: AppConstants.spacingM.w),
            _SubCodeLine(
              label: "Backend's repo",
              link: subLinks.beLink,
              color: Color(0xff24242B),
            ),
          ],
        ),
      ],
    );
  }
}

class _SubCodeLine extends StatelessWidget {
  final String label;
  final String link;
  final Color color;

  const _SubCodeLine({
    required this.label,
    required this.link,
    required this.color,
  });

  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(link)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: .circular(AppConstants.radiusM.r)
        ),
        padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM.w,
        vertical: AppConstants.spacingS.h,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: AppConstants.fontXS.sp,
            fontWeight: .w500,
            color: AppColors.textOnDark
          ),
        ),
      ),
    );
  }
}