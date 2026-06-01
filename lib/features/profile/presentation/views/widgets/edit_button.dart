import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelens/features/profile/presentation/views/edit_profile_view.dart';
import 'package:timelens/generated/l10n.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditProfileView.routeName);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.edit,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              decorationThickness: 1.5,
              fontFamily: GoogleFonts.lora().fontFamily,
            ),
          ),
          const SizedBox(width: 2),
          Icon(Icons.edit_outlined, size: 18.sp, color: Colors.white),
        ],
      ),
    );
  }
}
