import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const WebAppbar({
    super.key,
  });

  @override
  State<WebAppbar> createState() => _WebAppbarState();
}

class _WebAppbarState extends State<WebAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        height: 9.h,
        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 28, 34, 48),
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/analyze/profile.png'),
            ),
            SizedBox(
              width: 1.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello !',
                  style: GoogleFonts.roboto(
                    fontSize: 13.sp,
                    color: whiteText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Balwinder',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: whiteText,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    height: 3.5.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Center(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    height: 3.5.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Center(
                      child: Text(
                        'History',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    height: 3.5.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    child: Center(
                      child: Text(
                        'Feedback',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
