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
        Text(text, style: const TextStyle(color: Colors.amber)),
        for (var skill in skills) TechSkillItem(skill: skill),
      ],
    );
  }
}

class TechSkillItem extends StatefulWidget {
  final String skill;
  const TechSkillItem({super.key, required this.skill});

  @override
  State<TechSkillItem> createState() => _TechSkillItemState();
}

class _TechSkillItemState extends State<TechSkillItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: _isHovered ? 1.15 : 1.0,
            curve: Curves.easeInOut,
            child: Container(
              padding: const EdgeInsets.all(12.0), // Optional padding
              color: Colors.white, // Background color for the image
              child: Image.asset(
                'assets/images/${widget.skill.toLowerCase()}_logo.png',
                width: 32,
                height: 32,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Chip(
            label: Text(widget.skill),
            backgroundColor: Colors.grey[800],
            labelStyle: TextStyle(color: Colors.amberAccent[200]),
          ),
        ],
      ),
    );
  }
}
