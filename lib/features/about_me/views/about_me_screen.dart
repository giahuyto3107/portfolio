import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/core/widgets/project_container.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

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
    final webPortFolio = Project(
      coverImagePath: "assets/web_portfolio.png",
      title: 'Welcome to My Portfolio Website!',
      description: "Here I showcase my work as a mobile developer from clean UI designs to fully functional cross-platform apps. Take a look at my projects and see how I bring ideas to life with Flutter/Dart and Jetpack Compose.",
      techStack: [
        'Flutter',
        'UI/UX',
      ],
      onDemoTap: () => {},
      onCodeTap: () => launchUrl(Uri.parse('https://github.com/giahuyto3107/portfolio_web.git')),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          HighLightTitle(
            primaryText: "About Me",
            secondaryText: "Passionate Mobile Developer",
          ),
      
          const _SelfDescriptionContainer(),
          SizedBox(height: AppConstants.spacingXXXL.h,),
          const _PortfolioSpotLight(),
          ProjectContainer(
            project: webPortFolio
          ),
          SizedBox(height: AppConstants.spacingNavigationBar.h,),
        ],
      ),
    );
  }
}

class _SelfDescriptionContainer extends StatelessWidget {
  const _SelfDescriptionContainer();

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1a2c45),
        borderRadius: BorderRadius.circular(AppConstants.radiusL.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM.w,
        vertical: AppConstants.spacingM.h,
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "Hi there, Harry (To Gia Huy) here",
            style: TextStyle(
              fontSize: AppConstants.fontS.sp,
              fontWeight: .w600,
              color: AppColors.textOnDark
            ),
          ),
          SizedBox(height: AppConstants.spacingS.h,),
          Text(
            AppStrings.bio1,
            style: TextStyle(
              fontSize: AppConstants.fontXS.sp,
              fontWeight: .w400,
              color: AppColors.disable
            ),
            textAlign: .justify,
          ),
          SizedBox(height: AppConstants.spacingM.h,),
          Text(
            AppStrings.bio2,
            style: TextStyle(
              fontSize: AppConstants.fontXS.sp,
              fontWeight: .w400,
              color: AppColors.disable
            ),
            textAlign: .justify,
          ),
          SizedBox(height: AppConstants.spacingM.h,),
          const _SkillsWrap()
        ],
      ),
    );
  }
}

class _SkillsWrap extends StatelessWidget {
  const  _SkillsWrap();

  @override
  Widget build (BuildContext context) {
    List<String> skills = [
      'Flutter',
      'Jetpack Compose',
      'Api',
      'UI/UX',
      'Database',
      'Git',
      'App development',
      'REST APIs',
      'FastAPI',
      'Problem Solving',
      'Data Structures',
      'Algorithms'
    ];

    final double spacing = AppConstants.spacingXS.w;

    return Wrap(
      spacing: spacing,      // Horizontal space between fields
      runSpacing: spacing,   // Vertical space between rows
      children: skills.map((label) {

        return _SkillsContainer(label: label);
      }).toList(),
    );
  }
}

class _SkillsContainer extends StatelessWidget {
  final String label;
  const _SkillsContainer({required this.label});

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3a4a5f),
        borderRadius: BorderRadius.circular(AppConstants.radiusS.r),
        border: Border.all(
          color: Color(0xff48586f),
          width: AppConstants.borderThin.w,
        )
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingXS.w,
        vertical: AppConstants.spacingXXS.h,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: AppConstants.fontXS.sp,
          fontWeight: .w400,
          color: AppColors.textOnDark
        )
      ),
    );
  }
}

class _PortfolioSpotLight extends StatelessWidget {
  const _PortfolioSpotLight();

  @override
  Widget build(BuildContext context) {
    return HighLightTitle(
      primaryText: 'Portfolio Spotlight',
    );
  }
}