import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/theme/theme.dart';
import 'package:portfolio/core/utils/ui_helpers.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectContainer extends StatelessWidget {
  final Project project;
  const ProjectContainer({super.key, required this.project});

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
      child: GestureDetector(
        onTap: () => UIHelpers.showImageZoom(context, project.coverImagePath),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppConstants.radiusL.r)
          ),
          child: Image.asset(
            project.coverImagePath,
            fit: project.isCover ? .cover : .contain,
          ),
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
    bool showDemoTap = project.onDemoTap != null;
    
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

          if (!showDemoTap) _SubActionRow(subLinks: project.subLinks!)

          else showCodeTap
            ? _ActionButtons(
              project: project,
              showCodeTap: showCodeTap,
            )
            : Column(
              children: [
                _ActionButtons(
                  project: project,
                  showCodeTap: showCodeTap,
                ),
                SizedBox(height: AppConstants.spacingM.w,),
                _SubActionRow(subLinks: project.subLinks!)
              ],
            )
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
          onTap: () => project.onDemoTap!(),
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

class _SubActionRow extends StatelessWidget {
  final Map<String, String> subLinks;
  final List<Color> palette = const [
    Color(0xfff97015), // Orange
    Color(0xff6366f1), // Indigo
  ];

  const _SubActionRow({required this.subLinks});

  @override
  Widget build (BuildContext context) {
    final entries = subLinks.entries.toList();

    return Column(
      children: [
        Row(
          children: List.generate(entries.length, (index) {
            final entry = entries[index];

            return Padding(
              padding: EdgeInsets.only(right: AppConstants.spacingM.w),
              child: _SubCodeLine(
                label: entry.key,
                link: entry.value,
                color: palette[index % palette.length],
              ),
            );
          })
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
    IconData? iconData;
    String cleanLabel = label.toLowerCase();

    if (cleanLabel.contains('app store')) {
      iconData = FontAwesomeIcons.appStoreIos;
    } else if (cleanLabel.contains('google play')) {
      iconData = FontAwesomeIcons.googlePlay;
    }

    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(link)),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppConstants.radiusM.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingM.w,
          vertical: AppConstants.spacingS.h,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null) ...[
              Icon(
                iconData,
                size: AppConstants.fontL.sp,
                color: AppColors.textOnDark,
              ),
              SizedBox(width: AppConstants.spacingS.w),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: AppConstants.fontXS.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textOnDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}