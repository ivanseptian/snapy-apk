import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:markaz_snappy/modules/EditProfileScreen/EditProfileScreen.dart';

class EditProfileScreenController extends GetxController {

  final EditProfileScreenService _service;

  EditProfileScreenController(this._service);

  GlobalKey<FormFieldState> inputTxtNamaLengkapKey = GlobalKey<FormFieldState>();
  var inputTxtNamaLengkap = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtPhoneNumberKey = GlobalKey<FormFieldState>();
  var inputTxtPhoneNumber = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtEmailKey = GlobalKey<FormFieldState>();
  var inputTxtEmail = TextEditingController().obs;
  GlobalKey<FormFieldState> inputTxtAlamatKey = GlobalKey<FormFieldState>();
  var inputTxtAlamat = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();

}