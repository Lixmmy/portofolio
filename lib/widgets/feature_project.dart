import 'package:flutter/material.dart';
import 'package:portofolio/models/project.dart';
import 'package:portofolio/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';

class FeatureProject extends StatelessWidget {
  const FeatureProject({
    super.key,
    required GlobalKey<State<StatefulWidget>> projectsKey,
  }) : _projectsKey = projectsKey;

  final GlobalKey<State<StatefulWidget>> _projectsKey;

  Future<void> _launchUrl(String? link) async {
    if (link == null || link.isEmpty) return;
    final Uri url = Uri.parse(link);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    )) {
      debugPrint('Tidak dapat memuat $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _projectsKey,
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;
          final isDetailsWide = constraints.maxWidth >= 1200;
          final projectsText = Text(
            "Featured Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          );
          final projectList = !isWide
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ProjectCard(
                        project: projects[index],
                        onGitHubPressed: (githubLink) => _launchUrl(githubLink),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDetailsWide ? 3 : 2,
                    childAspectRatio: isDetailsWide ? 0.6 : 0.68,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return ProjectCard(
                      project: projects[index],
                      onGitHubPressed: (githubLink) => _launchUrl(githubLink),
                    );
                  },
                );
          return ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              crossAxisAlignment: constraints.maxWidth > 600
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [projectsText, SizedBox(height: 20), projectList],
            ),
          );
        },
      ),
    );
  }
}
