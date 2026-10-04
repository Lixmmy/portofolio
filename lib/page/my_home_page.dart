import 'package:flutter/material.dart';
import 'package:portofolio/models/project.dart';
import 'package:portofolio/models/user.dart';
import 'package:portofolio/widgets/about_me.dart';
import 'package:portofolio/widgets/project_card.dart';
import 'package:portofolio/widgets/tech_stack.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  // final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("< Felix.Dev />", style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.transparent,

        actions: MediaQuery.of(context).size.width > 600
            ? [
                TextButton(
                  onPressed: () {
                    _scrollToSection(_aboutKey);
                  },
                  child: Text("About", style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Projects",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Contact", style: TextStyle(color: Colors.amber)),
                ),
              ]
            : null,
      ),

      endDrawer: MediaQuery.of(context).size.width <= 600
          ? Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 350,
                height: 560,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text(
                          'Menu',
                          style: TextStyle(color: Colors.amber, fontSize: 24),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'About',
                          style: TextStyle(color: Colors.amber),
                        ),
                        onTap: () {
                          _scrollToSection(_aboutKey);
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Projects',
                          style: TextStyle(color: Colors.amber),
                        ),
                        onTap: () {
                          // Handle Projects navigation
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Contact',
                          style: TextStyle(color: Colors.amber),
                        ),
                        onTap: () {
                          // Handle Contact navigation
                          Navigator.pop(context); // Close the drawer
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: _homeKey,
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Stack(
                children: [
                  SizedBox(
                    child: RiveAnimation.asset(
                      "assets/rives/icon_animation.riv",
                      alignment: MediaQuery.of(context).size.width > 600
                          ? Alignment.center
                          : Alignment.centerLeft,
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width > 600 ? 140 : 60,
                    top: 150,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 600
                          ? 400
                          : 285,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              felix.nama,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontFamily: 'Horizon',
                                color: Colors.amber,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  RotateAnimatedText('Flutter'),
                                  RotateAnimatedText('Developer'),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                                repeatForever: true,
                              ),
                            ),
                          ),
                          DefaultTextStyle(
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "A ${felix.pekerjaan} who currently focused on Mobile development. Other than that i also intrested in UI/UX design and back end development. i love to learn new things and always open to new opportunities",
                                  speed: Duration(milliseconds: 50),
                                ),
                              ],
                              onTap: () {
                                print("Tap Event");
                              },
                              repeatForever: false,
                              isRepeatingAnimation: false,
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("View Projects"),
                                  onHover: (value) {},
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("Download CV"),
                                  onHover: (value) {},
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 285,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/github.png'),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/linkedin.png',
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/instagram.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AboutMe(aboutKey: _aboutKey),
            Container(
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
                            return ProjectCard(
                              project: projects[index],
                              onGitHubPressed: (githubLink) =>
                                  _launchUrl(githubLink),
                            );
                          },
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isDetailsWide ? 3 : 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return ProjectCard(
                              project: projects[index],
                              onGitHubPressed: (githubLink) =>
                                  _launchUrl(githubLink),
                            );
                          },
                        );
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1400),
                    child: Column(
                      crossAxisAlignment: constraints.maxWidth > 600
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        projectsText,
                        SizedBox(height: 20),
                        projectList,
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
