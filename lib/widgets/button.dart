import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double textSize;
  final double height;
  final double? width;
  final double radius;
  final Color color;
  final Color borderColor;
  final VoidCallback onPress;
  final Widget? suffixIcon;
  const Button(
      {Key? key, required this.text,required this.color,
        required this.onPress, required this.height, this.width,
        required this.radius, required this.textSize, required this.textColor, required this.fontWeight, required this.borderColor, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onPress,
          child: Container(
            height: height.h,
            width: width == null ? Get.width : width?.w,
            child: suffixIcon == null ?
            Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: textSize.sp,
                    fontWeight: fontWeight,
                    color: textColor
                ),
              ),
            ) :
            Stack(
              children: [
                Center(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                        fontSize: textSize.sp,
                        fontWeight: fontWeight,
                        color: textColor
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: suffixIcon,
                )
              ],
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                    side: BorderSide(color: borderColor)
                )
            )
          ),
        );
  }
}
