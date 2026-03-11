import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/widgets/highlight_title.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/contact/data/models/contact.dart';
import 'package:portfolio/features/shells/providers/main_navigation_controller.dart';

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
        icon: FontAwesomeIcons.linkedin,
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
      
          SizedBox(height: AppConstants.spacingL.h,),
          const _SendMessageSection(),
          SizedBox(height: AppConstants.spacingM.h,),
          const _ViewMyWorkButton(),
          SizedBox(height: AppConstants.spacingXXL.h,),
          SizedBox(height: AppConstants.spacingXXL.h,),
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
        horizontal: AppConstants.spacingS.w,
        vertical: AppConstants.spacingS.h,
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
              size: AppConstants.fontL.sp,
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
                  fontSize: AppConstants.fontS.sp,
                  fontWeight: .w400
                ),
              ),
              Text(
                contact.content,
                style: TextStyle(
                  color: AppColors.textOnDark,
                  fontSize: AppConstants.fontS.sp,
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

class _SendMessageSection extends StatelessWidget {
  const _SendMessageSection();

  @override
  Widget build (BuildContext context) {
    List<String> placeholders = [
      'Name',
      'Email',
      'Phone',
      'Message'
    ];

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          "Send a Message",
          style: TextStyle(
            color: AppColors.textOnDark,
            fontSize: AppConstants.fontM.sp,
            fontWeight: .w500
          ),
        ),
        SizedBox(height: AppConstants.spacingM.h,),
        ListView.separated(
          shrinkWrap: true,
          itemCount: placeholders.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: AppConstants.spacingM.h,
            );
          },
          itemBuilder: (context, index) {
            final hint = placeholders[index];

            return _FieldTextField(
              hint: hint,
              maxLines: hint == 'Message' ? 5 : 1,
            );
          }
        ),
      ],
    );
  }
}

class _FieldTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const _FieldTextField({
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build (BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.textOnDark,
        fontSize: AppConstants.fontS.sp,
      ),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: Color(0xff1e1d23),
        filled: true,
        contentPadding: EdgeInsets.all(AppConstants.spacingM.r),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusM.r),
          borderSide: BorderSide(
            width: AppConstants.borderThin.w,
            color: AppColors.secondaryText
          )
        )
      ),

    );
  }
}

class _ViewMyWorkButton extends ConsumerWidget {
  const _ViewMyWorkButton();

  @override
  Widget build (BuildContext context, WidgetRef ref) {

    return GestureDetector(
      onTap: () => ref.read(mainNavigationControllerProvider.notifier).setIndex(2),
      child: Container(
        width: 250.w,
        decoration: BoxDecoration(
          gradient: AppColors.horizontalGradientButton,
          borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingXL.w,
          vertical: AppConstants.spacingM.h,
        ),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Icon(
              Icons.arrow_forward,
              color: AppColors.textOnDark,
              size: AppConstants.fontL.sp,
              weight: AppConstants.borderMedium,
            ),
            SizedBox(width: AppConstants.spacingS.w,),
            Text(
              AppStrings.viewMyWork,
              style: TextStyle(
                fontSize: AppConstants.fontS.sp,
                fontWeight: .w500,
                color: AppColors.textOnDark
              ),
            )
          ],
        ),
      ),
    );
  }
}