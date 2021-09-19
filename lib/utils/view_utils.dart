import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showProgress({required String message}) {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 16),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    ),
  );
}

void hideProgress() {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}
