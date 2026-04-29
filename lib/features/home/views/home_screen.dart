import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/utils/ui_helpers.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/home/data/models/social_account.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: const _HomeContent()
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build (BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          const _OwnerInformation(),
          if (kIsWeb) ...[
            SizedBox(height: AppConstants.spacingL.h),
            const _DownloadApkBanner(),
          ],
          SizedBox(height: AppConstants.spacingL.h,),
          const _SocialAccountsSection(),
      
          SizedBox(height: AppConstants.spacingNavigationBar.h,),
        ],
      ),
    );
  }
}

class _OwnerInformation extends StatelessWidget {
  const _OwnerInformation();

  @override
  Widget build (BuildContext context) {
    final int size = 100;

    return Column(
      children: [
        GestureDetector(
          onTap: () => UIHelpers.showImageZoom(context, 'assets/avatar.jpg', isCircular: true),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r),
            child: Image.asset(
              'assets/avatar.jpg',
              fit: BoxFit.cover,
              height: getResponsiveWidth(context, size * 1.0),
              width: getResponsiveWidth(context, size * 1.0),
            ),
          ),
        ),

        SizedBox(height: AppConstants.spacingXS.h,),
        _OwnerTitle(
          title: 'Tô Gia Huy',
          size: getResponsiveFont(context, AppConstants.fontXXXL),
          weight: .w500,
          color: AppColors.textOnDark
        ),

        _OwnerTitle(
            title: 'Flutter Developer | Android Developer',
            size: getResponsiveFont(context, AppConstants.fontL),
            weight: .w400,
            color: AppColors.secondaryText
        )
      ],
    );
  }
}

class _OwnerTitle extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;

  const _OwnerTitle({
    required this.title,
    required this.size,
    required this.weight,
    required this.color
  });

  @override
  Widget build (BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color
      ),
    );
  }
}

class _SocialAccountsSection extends StatelessWidget {
  const _SocialAccountsSection();

  @override
  Widget build (BuildContext context) {
    final List<SocialAccount> socialAccounts = [
      SocialAccount(
        icon: FontAwesomeIcons.github,
        label: 'GitHub profile',
        urlLink: 'https://github.com/giahuyto3107'
      ),
      SocialAccount(
        icon: Icons.facebook,
        label: 'Facebook profile',
        urlLink: 'https://www.facebook.com/giahuy3107',
      ),
      SocialAccount(
        icon: FontAwesomeIcons.linkedin,
        label: 'LinkedIn profile',
        urlLink: 'https://www.linkedin.com/in/togiahuy3107/',
      ),
      SocialAccount(
        icon: FontAwesomeIcons.instagram,
        label: 'Instagram profile',
        urlLink: 'https://www.instagram.com/tgiahuy07_/',
      ),
      SocialAccount(
        icon: FontAwesomeIcons.google,
        label: 'Gmail address',
        urlLink: 'https://mail.google.com/mail/u/0/#inbox?compose=CllgCJvrbrPVJtQZGXPkwbVhwkDFbNldTVlMtHhwlrHWFmVTbhxvQsTVKZDrLbkFbJKBmjspGjB',
      )
    ];

    return Container(
      decoration: BoxDecoration(
        color: Color(0xff152235),
        borderRadius: BorderRadius.circular(AppConstants.radiusL.r)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingL.w,
          vertical: AppConstants.spacingL.h,
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            _ContactMeSection(),
            SizedBox(height: AppConstants.spacingXL.h,),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: socialAccounts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isDesktop(context) ? 5 : Responsive.isTablet(context) ? 4 : 3, // columns based on layout
                mainAxisSpacing: getResponsiveHeight(context, 10),      // Vertical spacing
                crossAxisSpacing: getResponsiveWidth(context, 10),     // Horizontal spacing
                childAspectRatio: 1.0,      // Keep them square (1.0) or rectangular
              ),
              itemBuilder: (context, index) {
                return _SocialAccountContainer(
                  icon: socialAccounts[index].icon,
                  label: socialAccounts[index].label,
                  urlString: socialAccounts[index].urlLink,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _DownloadApkBanner extends StatelessWidget {
  const _DownloadApkBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.spacingM.w),
      decoration: BoxDecoration(
        color: const Color(0xff1a2c45),
        borderRadius: BorderRadius.circular(AppConstants.radiusL.r),
        border: Border.all(color: const Color(0xff1874e3).withOpacity(0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.android, color: Colors.greenAccent, size: 32),
          SizedBox(width: AppConstants.spacingM.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Try the Android App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getResponsiveFont(context, AppConstants.fontM),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Download the APK for the best mobile experience.",
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: getResponsiveFont(context, AppConstants.fontXS),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppConstants.spacingS.w),
          ElevatedButton(
            onPressed: () => launchUrl(
              Uri.parse('https://github.com/giahuyto3107/portfolio/releases/download/v1.0.0/portfolio.apk'),
              mode: LaunchMode.externalApplication,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1874e3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusM.r),
              ),
            ),
            child: const Text("Download", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _ContactMeSection extends StatelessWidget {
  const _ContactMeSection();

  @override
  Widget build (BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Can I help you?",
              style: TextStyle(
                fontSize: getResponsiveFont(context, AppConstants.fontM),
                fontWeight: .w400,
                color: AppColors.textOnDark
              ),
            ),
            Text(
              "Let's work!",
              style: TextStyle(
                fontSize: getResponsiveFont(context, AppConstants.fontM),
                fontWeight: .w400,
                color: AppColors.textOnDark
              ),
            )
          ],
        ),

        Container(
          decoration: BoxDecoration(
            color: Color(0xff168CF6),
            borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r),
            border: Border.all(
              color: Color(0xff1B6CB5),
              width: AppConstants.borderThin.w,
            )
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingM.w,
            vertical: AppConstants.spacingS.h,
          ),
          child: Text(
            AppStrings.contactMe,
            style: TextStyle(
              fontSize: getResponsiveFont(context, AppConstants.fontM),
              fontWeight: .w500,
              color: AppColors.textOnDark
            ),
          ),
        )
      ],
    );
  }
}

class _SocialAccountContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final String urlString;

  const _SocialAccountContainer({
    required this.icon,
    required this.label,
    required this.urlString,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    // Check if the device is capable of opening this specific URI
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(urlString),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.verticalGradientButton,
          borderRadius: BorderRadius.circular(AppConstants.radiusL.r)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
            ? 0
            : getResponsiveFont(context, AppConstants.fontS)
        ),
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Icon(
              icon,
              size: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontTitleS)
                : getResponsiveFont(context, AppConstants.fontXXXL),
              color: AppColors.textOnDark
            ),
            SizedBox(height: getResponsiveHeight(context, AppConstants.spacingS),),
            Text(
              label,
              style: TextStyle(
                fontSize: Responsive.isDesktop(context)
                  ? getResponsiveFont(context, AppConstants.fontM)
                  : getResponsiveFont(context, AppConstants.fontS),
                fontWeight: .w300,
                color: AppColors.textOnDark
              ),
              textAlign: .center,
            )
          ],
        ),
      ),
    );
  }
}