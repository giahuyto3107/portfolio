import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelpers {
  static void showImageZoom(
      BuildContext context,
      String imagePath, {
        bool isCircular = false,
      }) {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (context) {
        // 1. Determine the shape based on the parameter
        Widget imageWidget = Image.asset(imagePath, fit: BoxFit.contain);

        if (isCircular) {
          final double size = MediaQuery.of(context).size.width * 0.8;
          imageWidget = ClipOval(
            child: SizedBox(
              width: size,
              height: size,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          );
        } else {
          // Standard view: use a slight rounded corner or just the raw image
          imageWidget = ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: imageWidget,
          );
        }

        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Center(
                  child: Hero(
                    tag: imagePath,
                    child: InteractiveViewer(
                      minScale: 1.0,
                      maxScale: 4.0,
                      clipBehavior: Clip.none,
                      child: imageWidget,
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  right: 20.w,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 30.sp),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}