import 'package:flutter/material.dart';
import 'package:portofolio/models/user.dart';
import 'package:portofolio/widgets/tech_stack.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key, required GlobalKey<State<StatefulWidget>> aboutKey})
    : _aboutKey = aboutKey;

  final GlobalKey<State<StatefulWidget>> _aboutKey;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            border: Border.all(color: Colors.amber, width: 2),
                          ),
                        ),
                        Expanded(
                          child: Container(width: 2, color: Colors.white),
                        ), // Add some spacing between the circle and the text
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "STMIK Time\nBachelor of Computer Science\n2022 - 2026\nGPA: 3.99/4.00",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                child: Container(color: Colors.amber, height: 4, width: 150),
              ),
              const SizedBox(height: 20),
              TechWrap(skills: felix.bahasaPemrograman!, text: 'Frontend: '),
              const SizedBox(height: 20),
              TechWrap(skills: felix.backend!, text: 'Backend: '),
              const SizedBox(height: 20),
              TechWrap(skills: felix.frameworks!, text: 'Framework / Tools: '),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
