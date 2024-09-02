import 'package:bmi_calculator_plus/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const BMIPlusApp());
}

class BMIPlusApp extends StatelessWidget {
  const BMIPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator Plus',
      home: Homepage(),
    );
  }
}