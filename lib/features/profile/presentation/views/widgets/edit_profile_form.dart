import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';
import 'package:timelens/features/auth/presentation/views/widgets/back_drop_filter.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:timelens/features/profile/presentation/views/widgets/country_drop_list.dart';
import 'package:timelens/features/profile/presentation/views/widgets/edit_menu_item.dart';
import 'package:timelens/features/profile/presentation/views/widgets/lang_drop_list.dart';
import 'package:timelens/features/profile/presentation/views/widgets/menu_item.dart';

class EditContainerStack extends StatelessWidget {
  const EditContainerStack({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BackDropFilter(h: 380),
        // Positioned(
        //   top: 0.h,
        //   left: 0.w,
        //   right: 0.w,
        //   child: Transform.scale(
        //     scaleX: 1.1.w,
        //     scaleY: 1.06.h,
        //     scale: 1,
        //     child: Image.asset(
        //       Assets.assetsImagesSquareFrame,
        //     ),
        //   ),
        // ),
        Positioned(
          top: 20.h,
          left: 0.w,
          right: 0.w,
          child: EditProfileForm(profile: profile),
        ),
      ],
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({
    super.key,
    required this.profile,
  });

  final ProfileEntity profile;

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late ProfileEntity editedProfile;

  @override
  Widget build(BuildContext context) {
   
    editedProfile = widget.profile;
   
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            EditMenuItem(
              title: context.loc.userName,
              icon: Icons.person,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                
                child: TextFormField(
                  // textAlign: TextAlign.center,
                  
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return context.loc.requiredField;
                    }
                    return null;
                  },
                  clipBehavior: Clip.none,
                  maxLines: 1,
                  maxLength: 40,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.brownWriting,
                  ),
                  initialValue: widget.profile.name,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      height: 2.1.h,
                      fontSize: 12.sp,
                      color: Colors.red,
                    ),
                    counterStyle: TextStyle(
                      backgroundColor: AppColors.primaryColor.withAlpha(70),
                      fontSize: 12.sp,
                      color: AppColors.brownWriting,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    border: InputBorder.none,
                  ),
                 
                  onChanged: (newValue) {
                    editedProfile = editedProfile.copyWith(name: newValue);
                    debugPrint("Saved value: $newValue");
                  },
                ),
              ),
            ),
            SizedBox(height: 18.h),
            EditMenuItem(
              title: context.loc.language,
              icon: Icons.translate,
              child: Center(
                child: DropList(
                  chosen: getLanguageIndex(widget.profile.language),
                 
                  onChanged: (newValue) {
                    editedProfile =
                        editedProfile.copyWith(language: languages[newValue]);
                  },
                ),
              ),
            ),
            SizedBox(height: 18.h),
            EditMenuItem(
              title: context.loc.Country,
              icon: Icons.language_outlined,
              child: CountryPicker(
                country: widget.profile.country,
                
                onChanged: (newCountry) {
                  editedProfile = editedProfile.copyWith(country: newCountry);
                },
              ),
            ),
            SizedBox(height: 18.h),
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(50),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: MenuItem(
                centered: true,
                icon: Icons.save_outlined,
                title: context.loc.save,
                noDivider: true,
                
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint("Edited profile: ${editedProfile.toString()}");

                    isProfileChanged()
                        ? context
                            .read<ProfileCubit>()
                            .updateProfile(editedProfile)
                        : Navigator.pop(context);

                    
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.redAccent.withAlpha(50),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.red,
                ),
              ),
              child: MenuItem(
                centered: true,
                icon: Icons.cancel_outlined,
                title: context.loc.cancel,
                onTap: () {
                  Navigator.pop(context);
                },
                iconColor: Colors.red,
                trailingColor: Colors.red,
                noDivider: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getLanguageIndex(String language) {
    switch (language) {
      case 'en':
        return 0;
      case 'ar':
        return 1;
      case 'de':
        return 2;
      default:
        return -1; // Return -1 for unsupported languages
    }
  }

  List<String> languages = ['en', 'ar', 'de'];

  bool isProfileChanged() {
    return editedProfile != widget.profile;
  }
}
