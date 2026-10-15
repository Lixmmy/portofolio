import 'package:flutter/material.dart';
import 'package:portofolio/theme.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.item, this.onClick});

  final Map<String, String> item;
  final Function()? onClick;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onClick,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: _isHovered ? Colors.white : AppTheme.surfaceDarkColorA10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedScale(
                    scale: _isHovered ? 1.08 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      widget.item['imageAsset']!,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item['name']!,
                          style: TextStyle(
                            fontSize: 18,
                            color: _isHovered ? Colors.black : Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          widget.item["Link"]!,
                          style: TextStyle(
                            fontSize: 12,
                            color: _isHovered ? Colors.black : Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
