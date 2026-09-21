class Project {
  final String pathName;
  final String title;
  final String description;
  final List<String>? listOfTechnologies;
  final String? githubLink;

  const Project({
    required this.pathName,
    required this.title,
    required this.description,
    this.listOfTechnologies,
    this.githubLink,
  });
}

List<Project> projects = [
  Project(
    pathName: 'assets/images/sistime_app.png',
    title: 'Sistime App',
    description: 'A simple time tracking app',
  ),
  Project(
    pathName: 'assets/images/restaurant_app.png',
    title: 'Restaurant App',
    description: 'An app for ordering food from a restaurant',
  ),
  Project(
    pathName: 'assets/images/destination_app.png',
    title: 'Destination App',
    description: 'An app for discovering new travel destinations',
  ),
];
