import 'package:flutter/material.dart';

class CardStat extends StatelessWidget {
  final String title;
  final int randomNumber;

  const CardStat({
    Key? key,
    required this.title,
    required this.randomNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width /
          2.5, // You can adjust this value to your desired width
      height: MediaQuery.of(context).size.height /
          2.5, // You can adjust this value to your desired height
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Random Number: $randomNumber',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
