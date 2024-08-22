import 'package:flutter/material.dart';
import 'package:socially_app/common/common.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = 'SecondScreen';

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primaryColor, body: Container());
  }
}
