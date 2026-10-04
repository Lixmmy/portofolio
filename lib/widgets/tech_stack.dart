import 'package:flutter/material.dart';

class TechWrap extends StatelessWidget {
  final String text;
  final List<String> skills;
  const TechWrap({super.key, required this.text, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.end,
      children: [
        Text(text, style: TextStyle(color: Colors.amber)),
        for (var skill in skills)
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0), // Optional padding
                color: Colors.white, // Background color for the image
                child: Image.asset(
                  'assets/images/${skill.toLowerCase()}_logo.png',
                  width: 32,
                  height: 32,
                ),
              ),
              SizedBox(height: 4),
              Chip(
                label: Text(skill),
                backgroundColor: Colors.grey[800],
                labelStyle: TextStyle(color: Colors.amberAccent[200]),
              ),
            ],
          ),
      ],
    );
  }
}
