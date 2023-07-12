import 'package:customprogressdialog/CustomProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  CustomProgressDialog pr = Get.put(CustomProgressDialog(), permanent: true);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final CustomProgressDialog pr = Get.find();
  void _onPressed() async {
    pr.show();
    await Future.delayed(Duration(seconds: 2));
    pr.hide();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Progress Dialog')),
      body: const Center(child: Text('Aperte o botão')),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressed,
        backgroundColor: Colors.blue,
        isExtended: true,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
