import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timelens/core/utils/app_images.dart';
import 'package:timelens/features/profile/domain/entities/profile_entity.dart';
import 'package:timelens/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key, this.profile});

  final ProfileEntity? profile;

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

File? selectedImage;

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return widget.profile == null
        ? const SizedBox.shrink()
        : GestureDetector(
          onTap: pickImage,
          child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 110.r,
                    height: 115.r,
                    child: Image.network(
                      widget.profile!.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ClipOval(
                  child: SizedBox(
                    width: 150.r,
                    height: 155.r,
                    child: Image.asset(
                      Assets.assetsImagesProfileFrame,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
        );
  }

    void pickImage(  ) async {

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        return;
      }
      selectedImage = File(pickedFile.path);

      debugPrint("Selected image path: ${selectedImage.toString()}");
      
      
      if(mounted) {
        context.read<ProfileCubit>().updateProfilePic(
          widget.profile!,
          selectedImage!
        );
      }

    } on Exception catch (e) {
      ScaffoldMessenger(child: SnackBar(content: Text(e.toString())));
    }

  }
}
