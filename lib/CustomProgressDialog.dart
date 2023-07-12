// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressDialog extends GetxController {
  final Widget? customBody;
  final Color? overlayColor;
  CustomProgressDialog({this.customBody, this.overlayColor, Key? key});

  Future<void> _showDialog() async {
    await Get.dialog(
      barrierColor: overlayColor ?? const Color.fromRGBO(0, 0, 0, 0.2),
      barrierDismissible: false,
      Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.center,
          child: IntrinsicWidth(
              child: IntrinsicHeight(
            child: customBody ??
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(bottom: 20),
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.black87,
                          ),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          child: Text('Aguarde'),
                        ),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                          child: Text('Atualizando informações'),
                        ),
                      ]),
                ),
          ))),
    );
  }

  void show() async {
    if (!Get.isDialogOpen!) {
      await _showDialog();
    } else {
      debugPrint('pr is already show');
    }
  }

  void hide() {
    if (Get.isDialogOpen!) {
      Get.back();
    } else {
      debugPrint('pr is already closed');
    }
  }
}
