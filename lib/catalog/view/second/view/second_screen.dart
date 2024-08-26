import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = 'SecondScreen';

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text('Hi'),
          ),
          body: Container()

    );
  }

}
