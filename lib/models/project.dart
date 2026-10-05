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
        '''A campus academic portal mobile application (SIAKAD) built with Clean Architecture and securely integrated with the university's REST API in a structured manner. It supports real-time student academic management, including study plan registration (KRS), grades and transcript tracking (KHS), a digital student ID card, and multi-language support (l10n).
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
  Project(
    pathName: 'assets/images/restaurant_app.png',
    title: 'Restaurant App',
    subtitle: 'Restaurant Discovery & Favorite Manager',
    description:
        '''A feature-rich restaurant discovery mobile app built with Flutter and Provider state management, integrated with a remote REST API. Features comprehensive search and filtering, customer review submissions, offline bookmarking powered by SQLite (sqflite), scheduled daily lunch notifications, and adaptive Dark/Light theme switching. Includes unit and mock tests with Mockito to ensure robust state and business logic.
        -Restaurant Discovery & Interactive Review Submission
        -Local Offline Storage (SQLite) & Scheduled Daily Push Notifications
        -Provider State Management, Unit Testing (Mockito), & Dynamic Theming''',
    listOfTechnologies: [
      'Flutter',
      'Dart',
      'Provider',
      'SQLite',
      'REST API',
      'Local Notifications',
      'Unit Testing',
    ],
    githubLink: 'https://github.com/Lixmmy/restaurant_app',
  ),
  Project(
    pathName: 'assets/images/destination_app.png',
    title: 'Destination App',
    subtitle: 'Interactive Travel Guide & Destination Explorer',
    description:
        '''A responsive cross-platform travel guide application built with Flutter, designed to deliver an intuitive destination discovery experience. The app features seamless authentication, a categorized destination showcase (e.g., wonders of the world, natural lakes, and geothermal springs), rich detail views with gallery image carousels, and an interactive favorite bookmarking toggle. Engineered with responsive layout constraints using LayoutBuilder to adapt flawlessly across mobile phones, tablets, and desktop screen sizes.
        -Curated Destination Exploration with Comprehensive Information & Image Galleries
        -Interactive Bookmark/Favorite Toggle & Custom Authentication Flow
        -Fully Responsive Adaptive UI supporting Mobile, Tablet, and Desktop Viewports (LayoutBuilder)''',
    listOfTechnologies: [
      'Flutter',
      'Dart',
      'Responsive UI',
      'LayoutBuilder',
      'Material Design',
    ],
    githubLink: 'https://github.com/Lixmmy/dicodingpemula',
  ),
];
