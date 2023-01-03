import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/constants.dart';

class Helpers {
  static textfieldDecoration(String hintText) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      hintText: hintText,
      filled: true,
      fillColor: AppColors.defaultColor,
      // labelText: hintText,
      contentPadding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
    );
  }

  static launchWhatsAppUri(
      BuildContext context, String phoneNumber, String message) async {
    String whatsappURlAndroid =
        "whatsapp://send?phone='+91$phoneNumber'&text=$message";

    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  }

  static openMail(String body, String emailId) async {
    final Email email = Email(
      body: body,
      subject: 'Jewelery Enquiry',
      recipients: [emailId],
      isHTML: false,
    );

    debugPrint(email.body);
    await FlutterEmailSender.send(email);
  }

  static onShareClick(List<String> images) async {
    List<XFile> files = [];
    List<Uint8List> imageInUnit8List = [];
    if (Platform.isAndroid) {
      final documentDirectory = (await getExternalStorageDirectory())?.path;
      List<File> imgFile = [];

      for (int i = 0; i < images.length; i++) {
        imageInUnit8List.add(await convertImage(images[i]));
        imgFile.add(File('$documentDirectory/jewelery${i + 1}.png'));
      }

      for (int i = 0; i < imgFile.length; i++) {
        imgFile[i].writeAsBytesSync(imageInUnit8List[i]);
        files.add(XFile(imgFile[i].path));
      }

      Share.shareXFiles(
        files,
        subject: '',
        text: '',
      );
    } else if (Platform.isIOS) {
      final documentDirectory = (await getApplicationDocumentsDirectory()).path;
      List<File> imgFile = [];

      for (int i = 0; i < images.length; i++) {
        imageInUnit8List.add(await convertImage(images[i]));
        imgFile.add(File('$documentDirectory/jewelery${i + 1}.png'));
      }

      for (int i = 0; i < imgFile.length; i++) {
        imgFile[i].writeAsBytesSync(imageInUnit8List[i]);
        files.add(XFile(imgFile[i].path));
      }

      Share.shareXFiles(
        files,
        subject: '',
        text: '',
      );
    }
  }

  static convertImage(String imageString) async {
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imageString)).load(imageString))
            .buffer
            .asUint8List();
    return bytes;
  }
}
