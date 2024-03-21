

import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController
{
  static AuthController instanceAuth = Get.find();

  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async
  {
    final picketImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(picketImageFile != null){
      Get.snackbar(
        "Profile Image",
        "you have succesfully select your profile"
      );

    }

    _pickedFile = Rx<File?>(File(picketImageFile!.path));
  }

  void captureImageFromcamera() async
  {
    final picketImageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(picketImageFile != null){
      Get.snackbar(
          "Profile Image",
          "you have succesfully select your profile"
      );

    }

    _pickedFile = Rx<File?>(File(picketImageFile!.path));
  }

}