import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'result_screen.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Page'),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
