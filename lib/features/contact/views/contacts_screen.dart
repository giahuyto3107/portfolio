import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/contact/data/models/contact.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: _ContactsContent()
    );
  }
}

class _ContactsContent extends StatelessWidget {
  const _ContactsContent();

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [
      Contact(
        label: 'Email',
        content: 'giahuyto3107@gmail.com',
        icon: Icons.email,
        iconBgColor: Color(0xff30dcff),
        bgColor: Color(0xff068dbb)
      ),
      Contact(
        label: 'Phone',
        content: '+84 776 103 283',
        icon: Icons.phone,
        iconBgColor: Color(0xff53c462),
        bgColor: Color(0xff529856)
      ),
      Contact(
        label: 'Location',
        content: 'Ho Chi Minh City, VietNam',
        icon: Icons.location_pin,
        iconBgColor: Color(0xffffae07),
        bgColor: Color(0xffcb7c11)
      ),
      Contact(
        label: 'Linkedin',
        content: 'linkedin.com/in/togiahuy3107/',
        icon: FontAwesomeIcons.linkedin.data,
        iconBgColor: Color(0xffc04bcb),
        bgColor: Color(0xff963fa5)
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppConstants.spacingS.h,),
          // Text(
          //   "Feel free to reach out for any project or collaboration",
          //   style: TextStyle(
          //     color: AppColors.textOnDark,
          //     fontSize: AppConstants.fontS.sp,
          //     fontWeight: .w400
          //   ),
          //   textAlign: .center,
          // ),

          HighLightTitle(
            primaryText: 'Get in Touch',
            secondaryText: 'Feel free to reach out for any project or collaboration',
          ),

          ListView.separated(
            shrinkWrap: true,
            itemCount: contacts.length,
            physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppConstants.spacingM.h,
                );
              },
            itemBuilder: (context, index) {
              return _ContactMethodContainer(
                contact: contacts[index],
              );
            }
          ),
      
          SizedBox(height: AppConstants.spacingNavigationBar.h,),
        ],
      ),
    );
  }
}

class _ContactMethodContainer extends StatelessWidget {
  final Contact contact;
  const _ContactMethodContainer({required this.contact});

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: contact.bgColor,
        borderRadius: BorderRadius.circular(AppConstants.radiusM.r)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveWidth(context, AppConstants.spacingM),
        vertical: getResponsiveHeight(context, AppConstants.spacingM),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: contact.iconBgColor,
              borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r)
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingS.w,
              vertical: AppConstants.spacingS.w,
            ),
            child: Icon(
              contact.icon,
              color: AppColors.textOnDark,
              size: getResponsiveFont(context, AppConstants.fontL),
            ),
          ),
          SizedBox(width: AppConstants.spacingM.w,),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                contact.label,
                style: TextStyle(
                  color: AppColors.textOnDark,
                  fontSize: getResponsiveFont(context, AppConstants.fontM),
                  fontWeight: .w400
                ),
              ),
              Text(
                contact.content,
                style: TextStyle(
                  color: AppColors.textOnDark,
                  fontSize: getResponsiveFont(context, AppConstants.fontM),
                  fontWeight: .w500
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
