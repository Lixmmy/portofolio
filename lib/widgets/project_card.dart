import 'package:flutter/material.dart';
import 'package:portofolio/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final Function(String?) onGitHubPressed;
  const ProjectCard({
    super.key,
    required this.project,
    required this.onGitHubPressed,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.project.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: AnimatedScale(
                      scale: _isHovered ? 1.08 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        widget.project.pathName,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        semanticLabel: widget.project.title,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.project.subtitle,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.project.description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children:
                      widget.project.listOfTechnologies
                          ?.map(
                            (tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Colors.amber,
                            ),
                          )
                          .toList() ??
                      [],
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    widget.onGitHubPressed(widget.project.githubLink);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: const Text("View on GitHub"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
