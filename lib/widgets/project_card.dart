import 'package:flutter/material.dart';
import 'package:portofolio/models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final Function(String?) onGitHubPressed;
  const ProjectCard({
    super.key,
    required this.project,
    required this.onGitHubPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.all(Radius.circular(12.0)),
              child: Image.asset(
                project.pathName,
                fit: BoxFit.cover,
                semanticLabel: project.title,
              ),
            ),
            SizedBox(height: 8),
            Text(
              project.subtitle,
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Text(
              project.description,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children:
                  project.listOfTechnologies
                      ?.map(
                        (tech) => Chip(
                          label: Text(tech),
                          backgroundColor: Colors.amber,
                        ),
                      )
                      .toList() ??
                  [],
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                onGitHubPressed(project.githubLink);
              },
              child: Text("View on GitHub"),
            ),
          ],
        ),
      ),
    );
  }
}
