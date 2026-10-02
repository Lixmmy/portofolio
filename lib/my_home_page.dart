import 'package:flutter/material.dart';
import 'package:portofolio/models/user.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _aboutKey = GlobalKey();
  // final GlobalKey _projectsKey = GlobalKey();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("< Felix.Dev />", style: TextStyle(color: Colors.amber)),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              _scrollToSection(_homeKey);
            },
            child: Text("Home", style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {
              _scrollToSection(_aboutKey);
            },
            child: Text("About", style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Projects", style: TextStyle(color: Colors.amber)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Contact", style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
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
            Container(
              key: _aboutKey,
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 900;
                  final isDetailsWide = constraints.maxWidth >= 1200;
                  final aboutText = Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "About Me",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            """I'm a Flutter Developer from Medan, Indonesia, passionate about building beautiful, performant mobile and web applications. With 1+ year of dedicated self-study and hands-on projects, I've built production-quality apps using Clean Architecture and BLoC/Provider.\n
I believe great software is built on solid architecture, clean code, and attention to detail. Every project I build reflects my commitment to delivering real value through technology.""",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  );
                  final education = Column(
                    crossAxisAlignment: isDetailsWide
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: isDetailsWide
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          Icon(Icons.school, color: Colors.white),
                          SizedBox(width: 8),
                          const Text(
                            "Education",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(color: Colors.amber, height: 4, width: 150),
                      const SizedBox(height: 20),

                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: isDetailsWide
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                ), // Add some spacing between the circle and the text
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "STMIK Time\nBachelor of Computer Science\n2022 - 2026\nGPA: 3.99/4.00",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                  final photo = ClipOval(
                    child: Image.asset(felix.foto!, width: 250, height: 250),
                  );
                  final skills = Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.code, color: Colors.white),
                          SizedBox(width: 8),
                          const Text(
                            "Tech Stack",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          color: Colors.amber,
                          height: 4,
                          width: 150,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TechWrap(
                        skills: felix.bahasaPemrograman!,
                        text: 'Frontend: ',
                      ),
                      const SizedBox(height: 20),
                      TechWrap(skills: felix.backend!, text: 'Backend: '),
                      const SizedBox(height: 20),
                      TechWrap(
                        skills: felix.frameworks!,
                        text: 'Framework / Tools: ',
                      ),
                    ],
                  );

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1400),
                      child: isWide
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      aboutText,
                                      const SizedBox(height: 24),
                                      if (isDetailsWide)
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(child: education),
                                            const SizedBox(width: 24),
                                            Expanded(child: skills),
                                          ],
                                        )
                                      else ...[
                                        education,
                                        const SizedBox(height: 24),
                                        skills,
                                      ],
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 32),
                                photo,
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: photo),
                                const SizedBox(height: 24),
                                aboutText,
                                const SizedBox(height: 24),
                                education,
                                skills,
                              ],
                            ),
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
