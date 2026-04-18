import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/skills/data/models/skill.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: SizedBox(
        width: double.infinity,
        child: _Content()
      )
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build (BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: .center,
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          HighLightTitle(
            primaryText: "My Skills",
            secondaryText: "Technologies | work with",
          ),
          _SkillsSection()
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build (BuildContext context) {
    final List<Skill> skills = [
      Skill(
        percentage: 0.95,
        icon: FontAwesomeIcons.flutter,
        label: 'Flutter',
        color: Color(0xff4687f3),
      ),
      Skill(
        percentage: 0.80,
        icon: FontAwesomeIcons.android,
        label: 'Jetpack Compose',
        color: Color(0xff32a350),
      ),
      Skill(
        percentage: 0.82,
        icon: FontAwesomeIcons.server,
        label: 'Api',
        color: Color(0xff5c48b3),
      ),
      Skill(
        percentage: 0.85,
        icon: FontAwesomeIcons.database,
        label: 'Database',
        color: Color(0xff6fe9c0),
      ),
      Skill(
        percentage: 0.70,
        icon: FontAwesomeIcons.fire,
        label: 'Firebase',
        color: Color(0xfffbb142),
      ),
      Skill(
        percentage: 0.90,
        icon: FontAwesomeIcons.gitAlt,
        label: 'Git',
        color: Color(0xfff9685c),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isDesktop(context) ? 4 : Responsive.isTablet(context) ? 4 : 3, // columns
        mainAxisSpacing: getResponsiveHeight(context, 20),      // Vertical spacing
        crossAxisSpacing: getResponsiveWidth(context, 20),     // Horizontal spacing
        childAspectRatio: 1.0,      // Keep them square (1.0) or rectangular
      ),
      itemBuilder: (context, index) {
        return _SkillContainer(
          skill: skills[index],
        );
      },

    );
  }
}

class _SkillContainer extends StatelessWidget {
  final Skill skill;

  const _SkillContainer({required this.skill});

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.skillBackgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusL.r),
        border: Border.all(
          color: AppColors.skillBorderColor,
          width: AppConstants.borderThick.w
        )
      ),
      padding: EdgeInsets.symmetric(
        horizontal:  getResponsiveWidth(context, AppConstants.spacingS)
      ),
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          Stack(
            alignment: .center,
            children: [
              SizedBox(
                height: Responsive.isDesktop(context)
                  ? 50
                  : 30,
                width: Responsive.isDesktop(context)
                  ? 50
                  : 30,
                child: CircularProgressIndicator(
                  value: skill.percentage,
                  valueColor: AlwaysStoppedAnimation<Color>(skill.color),
                  strokeWidth: Responsive.isDesktop(context)
                    ? 5
                    : 3,
                  backgroundColor: Color(0xff223242),
                ),
              ),

              Icon(
                skill.icon,
                size: Responsive.isDesktop(context)
                  ? getResponsiveFont(context, AppConstants.fontXL)
                  : getResponsiveFont(context, AppConstants.fontS),
                color: skill.color
              )
            ],
          ),

          SizedBox(height: AppConstants.spacingM.h,),
          Text(
            skill.label,
            style: TextStyle(
              fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontM)
                : getResponsiveFont(context, AppConstants.fontXS),
              fontWeight: .w600,
              color: AppColors.textOnDark
            ),
            textAlign: .center,
          ),
          SizedBox(height: getResponsiveHeight(context, AppConstants.spacingXS),),
          Text(
            "${skill.percentage * 100}%",
            style: TextStyle(
              fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontS)
                : getResponsiveFont(context, AppConstants.fontXXS),
              fontWeight: .w500,
              color: AppColors.textOnDark
            ),
          ),
        ],
      ),
    );
  }
}