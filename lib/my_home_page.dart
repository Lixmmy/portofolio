import 'package:flutter/material.dart';
import 'package:portofolio/user.dart';
import 'package:rive/rive.dart' hide Image;
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = MediaQuery.sizeOf(context).width > 600;
                  final aboutText = Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      const Text(
                        "STMIK Time\nBachelor of Computer Science\n2022 - 2026\nGPA: 3.99/4.00",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  );
                  final photo = ClipOval(
                    child: Image.asset(felix.foto!, width: 250, height: 250),
                  );

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: isWide
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      aboutText,
                                      const SizedBox(height: 24),
                                      education,
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
                              ],
                            ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // final isWide = MediaQuery.sizeOf(context).width > 600;
                  final skills = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      Container(color: Colors.amber, height: 4, width: 150),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Text(
                            "Frontend: ",
                            style: TextStyle(color: Colors.amber),
                          ),
                          for (var skill in felix.bahasaPemrograman!)
                            Column(
                              children: [
                                Container(
                                  color: Colors
                                      .white, // Background color for the image
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
                                  labelStyle: TextStyle(
                                    color: Colors.amberAccent[200],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Text(
                            "Frameworks / Tools: ",
                            style: TextStyle(color: Colors.amber),
                          ),
                          for (var skill in felix.frameworks!)
                            Column(
                              children: [
                                Container(
                                  color: Colors
                                      .white, // Background color for the image
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
                                  labelStyle: TextStyle(
                                    color: Colors.amberAccent[200],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  );

                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: skills,
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
