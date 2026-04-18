import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/ui_helpers.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/core/widgets/project_container.dart';
import 'package:portfolio/features/projects/data/models/project.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/download_provider.dart';
import 'package:pdfx/pdfx.dart';

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
      description: "Here I showcase my work as a mobile developer"
        " from clean UI designs to fully functional cross-platform apps."
        " Take a look at my projects and see how I bring ideas to life"
        " with Flutter/Dart and Jetpack Compose.",
      techStack: [
        'Flutter',
        'UI/UX',
      ],
      onDemoTap: () => {},
      onCodeTap: () => launchUrl(
        Uri.parse('https://github.com/giahuyto3107/portfolio_web.git')
      ),
    );

    final workExperience = Project(
      coverImagePath: "assets/la_chan_xanh.png",
      title: 'La Chan Xanh',
      description: "As a Developer at LA CHAN XANH, "
        "I spearheaded the end-to-end development of"
        " a cross-platform educational application using Flutter, "
        "contributing to approximately 40% of the total feature implementation"
        " and UI design. I engineered responsive layouts and fluid animations to"
        " ensure a seamless, high-performance user experience across diverse "
        "mobile devices while integrating RESTful APIs to manage dynamic lesson content, "
        "user profiles, and complex minigame systems. My role involved "
        "architecting critical application modules, including dedicated dual-mode"
        " interfaces for children and adults and secure authentication flows,"
        " ultimately driving the project to a successful launch on the Google Play Store "
          "with more than 500 downloads.",
      techStack: [
        'Flutter',
        'UI/UX'
      ],
      subLinks: {
        "App Store": "https://apps.apple.com/vn/app/l%C3%A1-ch%E1%BA%AFn-xanh/id6757321927?l=vi",
        "Google Play": "https://play.google.com/store/apps/details?id=lab.icip.lachanxanh"
      }
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: .max,
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          HighLightTitle(
            primaryText: "About Me",
            secondaryText: "Passionate Mobile Developer",
          ),

          const _ImageSection(),
          const _SelfDescriptionContainer(),
          SizedBox(height: AppConstants.spacingXXXL.h,),

          const _PortfolioSpotLight(),
          ProjectContainer(
            project: webPortFolio
          ),

          SizedBox(height: AppConstants.spacingXXXL.h,),
          const _WorkExperienceSpotLight(),
          ProjectContainer(
            project: workExperience
          ),

          SizedBox(height: AppConstants.spacingNavigationBar.h,),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  final String imageUrl = "assets/about.png";
  const _ImageSection();

  @override
  Widget build (BuildContext context) {
    return SizedBox(
      height: 125.h,
      width: double.infinity,
      child: GestureDetector(
        onTap: () => UIHelpers.showImageZoom(context, imageUrl),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppConstants.radiusL.r)
          ),
          child: Image.asset(
            imageUrl,
            fit: .cover,
          ),
        ),
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
              fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontL)
                : getResponsiveFont(context, AppConstants.fontS),
              fontWeight: .w600,
              color: AppColors.textOnDark
            ),
          ),
          SizedBox(height: AppConstants.spacingS.h,),
          Text(
            AppStrings.bio1,
            style: TextStyle(
              fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontM)
                : getResponsiveFont(context, AppConstants.fontXS),
              fontWeight: .w400,
              color: AppColors.disable
            ),
            textAlign: .justify,
          ),
          SizedBox(height: AppConstants.spacingM.h,),
          Text(
            AppStrings.bio2,
            style: TextStyle(
              fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontM)
                : getResponsiveFont(context, AppConstants.fontXS),
              fontWeight: .w400,
              color: AppColors.disable
            ),
            textAlign: .justify,
          ),
          SizedBox(height: AppConstants.spacingM.h,),
          const _SkillsWrap(),
          SizedBox(height: AppConstants.spacingL.h,),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const _CvPreviewDialog(),
                );
              },
              icon: const Icon(Icons.contact_page, color: Colors.white),
              label: const Text('View CV', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1874e3),
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingM.w,
                  vertical: AppConstants.spacingS.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusM.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CvPreviewDialog extends StatefulWidget {
  const _CvPreviewDialog();

  @override
  State<_CvPreviewDialog> createState() => _CvPreviewDialogState();
}

class _CvPreviewDialogState extends State<_CvPreviewDialog> {
  late PdfControllerPinch pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/cv.pdf'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(4),
      backgroundColor: const Color(0xff1a2c45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusL.r),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CV',
                    style: TextStyle(
                      fontSize: getResponsiveFont(context, AppConstants.fontL),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textOnDark,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppConstants.radiusS.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.radiusS.r),
                  child: PdfViewPinch(
                    controller: pdfController,
                  ),
                ),
              ),
            ),
            SizedBox(height: AppConstants.spacingL.h),
            ElevatedButton.icon(
              onPressed: () {
                downloadCV(); // This will automatically call the correct version
              },
              icon: const Icon(Icons.download, color: Colors.white),
              label: const Text('Download CV', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1874e3),
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingL.w,
                  vertical: AppConstants.spacingS.h,
                ),
              ),
            ),
          ],
        ),
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
          fontSize: Responsive.isDesktop(context)
            ? getResponsiveFont(context, AppConstants.fontM)
            : getResponsiveFont(context, AppConstants.fontXS),
          fontWeight: .w400,
          color: AppColors.textOnDark
        )
      ),
    );
  }
}

class _WorkExperienceSpotLight extends StatelessWidget {
  const _WorkExperienceSpotLight();

  @override
  Widget build(BuildContext context) {
    return HighLightTitle(
      primaryText: 'Work Experience',
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