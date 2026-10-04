class Project {
  final String pathName;
  final String title;
  final String subtitle;
  final String description;
  final List<String>? listOfTechnologies;
  final String? githubLink;

  const Project({
    required this.pathName,
    required this.title,
    required this.subtitle,
    required this.description,
    this.listOfTechnologies,
    this.githubLink,
  });
}

List<Project> projects = [
  Project(
    pathName: 'assets/images/sistime_apps.png',
    title: 'Sistime Portal',
    subtitle:
        'Academic & Student Portal Mobile Application atau Sistem Informasi Akademik Mobile Kampus.',
    description:
        '''A campus academic portal mobile application (SIAKAD) built with Clean Architecture and securely integrated with the university\’s REST API in a structured manner. It supports real-time student academic management, including study plan registration (KRS), grades and transcript tracking (KHS), a digital student ID card, and multi-language support (l10n).
      - Comprehensive Academic Management (Course Scheduling, Study Plan/KRS, Grade Reports/KHS, & Academic Transcripts)
      - Student Profile Management & Digital Student ID Card   
      - Architecture & BLoC State Management with Dependency Injection (GetIt)''',
    listOfTechnologies: [
      'Flutter',
      'BLoC',
      'Clean Arch',
      'REST API',
      'Secure Storage',
    ],
    githubLink: 'https://github.com/Lixmmy/SistimePortal',
  ),
  // Project(
  //   pathName: 'assets/images/restaurant_app.png',
  //   title: 'Restaurant App',
  //   description: 'An app for ordering food from a restaurant',
  // ),
  // Project(
  //   pathName: 'assets/images/destination_app.png',
  //   title: 'Destination App',
  //   description: 'An app for discovering new travel destinations',
  // ),
];
