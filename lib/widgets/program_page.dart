// program_page.dart
import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Page'),
      ),
      body: Center(
        child: Text('Content of the Program Page'),
      ),
    );
  }
}
