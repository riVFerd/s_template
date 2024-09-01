import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:s_template/common/extensions/context_extension.dart';

import '../../common/storage/storage.dart';
import '../../injection.dart';
import '../themes/sizing.dart';

class AvatarPicker extends StatelessWidget {
  final File? selectedImage;
  final File? initialImage;
  final Function(File)? onImageSelected;

  const AvatarPicker({super.key, this.selectedImage, this.onImageSelected, this.initialImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            foregroundDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.colorScheme.primary, width: 4),
            ),
            clipBehavior: Clip.antiAlias,
            child: selectedImage == null
                ? initialImage != null
                ? Image.file(initialImage!, fit: BoxFit.cover)
                : Image.asset('assets/images/profile_placeholder.png', fit: BoxFit.cover)
                : Image.file(selectedImage!, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: -(38 / 2),
            child: IconButton(
              onPressed: () async {
                chooseImage(context);
              },
              style: IconButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                backgroundColor: context.colorScheme.primaryContainer,
              ),
              icon: const Icon(Icons.camera_alt_rounded),
            ),
          ),
        ],
      ),
    );
  }

  void chooseImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: Sz.screenPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a picture'),
                onTap: () async {
                  final picker = ImagePicker();
                  final pickedImage = await picker.pickImage(
                    source: ImageSource.camera,
                    preferredCameraDevice: CameraDevice.front,
                  );
                  if (pickedImage == null) return;
                  onImageSelected?.call(File(pickedImage.path));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.image,
                ),
                title: const Text('Choose from gallery'),
                onTap: () async {
                  final pickedImage = await locator<Storage>().pickFile(extensions: ['jpg', 'jpeg', 'png']);
                  if (pickedImage == null) return;
                  onImageSelected?.call(pickedImage);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
