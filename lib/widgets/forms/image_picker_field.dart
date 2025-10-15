// ignore: dangling_library_doc_comments
/** Image Picker

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../common/app_image.dart';

import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField(
      {this.initUrl, this.currentFile, this.onChanged, this.validator});

  final ValueChanged<PickedFile> onChanged;
  final String initUrl;
  final PickedFile currentFile;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: validator,
      initialValue: initUrl,
      builder: (FormFieldState<String> field) {
        return Focus(
          child: Builder(
            builder: (context) {
              final InputDecoration effectiveDecoration =
                  const InputDecoration(contentPadding: EdgeInsets.all(0))
                      .applyDefaults(
                Theme.of(field.context).inputDecorationTheme,
              );
              return GestureDetector(
                onTap: _getImage,
                child: InputDecorator(
                  decoration:
                      effectiveDecoration.copyWith(errorText: field.errorText),
                  isEmpty: false,
                  isFocused: Focus.of(context).hasFocus,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: _buildImage(context)),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context) {
    if (isNullOrEmpty(initUrl) && currentFile == null) {
      return Center(
        child: Icon(
          Icons.camera_alt,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      );
    } else if (currentFile != null) {
      return Image.file(File(currentFile.path), fit: BoxFit.cover);
    } else {
      return AppImage(initUrl);
    }
  }

  Future _getImage() async {
    await Get.bottomSheet(
      SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Get.back();
                  _getImageBy(ImageSource.camera);
                }),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                _getImageBy(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Get.theme.backgroundColor,
    );
  }

  Future _getImageBy(ImageSource source) async {
    final picker = ImagePicker();

    final pickedFile =
        await picker.getImage(source: source, maxWidth: 512, maxHeight: 512);
    if (onChanged != null) {
      this.onChanged(pickedFile);
    }
  }
}
*/
