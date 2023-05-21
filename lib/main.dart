import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir_tpm_teori/HomePage.dart';
import 'package:project_akhir_tpm_teori/login_page/Login.dart';
import 'package:project_akhir_tpm_teori/login_page/Register.dart';
import 'package:project_akhir_tpm_teori/login_page/landing.dart';
import 'login_page/hiveType.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ptoject Akhir TPM',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: RegisterPage(),
    );
  }
}