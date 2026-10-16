import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portofolio/models/user.dart';
import 'package:portofolio/widgets/about_me.dart';
import 'package:portofolio/widgets/contact_card.dart';
import 'package:portofolio/widgets/feature_project.dart';
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
  final GlobalKey _contactKey = GlobalKey();
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
    final Uri url;
    if (link.contains('@') && !link.startsWith('http')) {
      // Email -> buka aplikasi email
      if (kIsWasm || kIsWeb) {
        url = Uri(
          scheme: 'https',
          host: 'google.com',
          path: '/mail/',
          queryParameters: {
            'view': 'cm',
            'fs': '1',
            'to': 'tujuan@email.com', // Ganti dengan email tujuan
            'su': 'Halo Admin!', // Judul / Subjek email
            'body': 'Saya ingin bertanya...', // Isi email
          },
        );
      } else {
        url = Uri(
          scheme: 'mailto',
          path: link,
          queryParameters: <String, String>{
            'subject': 'Halo Admin!',
            'body': 'Saya ingin bertanya...',
          },
        );
      }
    } else if (RegExp(r'^\+?[\d\s-]+$').hasMatch(link)) {
      // Nomor telepon -> WhatsApp (0xxx diubah ke format internasional 62xxx)
      var number = link.replaceAll(RegExp(r'[^\d]'), '');
      if (number.startsWith('0')) number = '62${number.substring(1)}';
      url = Uri.parse('https://wa.me/$number');
    } else {
      url = Uri.parse(link);
    }
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
                  onPressed: () {
                    _scrollToSection(_projectsKey);
                  },
                  child: Text(
                    "Projects",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _scrollToSection(_contactKey);
                  },
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
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
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
                      right: MediaQuery.of(context).size.width > 600 ? 140 : 40,
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
                                    // print("Tap Event");
                                  },
                                  repeatForever: true,
                                ),
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    "A ${felix.pekerjaan} who currently focused on Mobile development. Other than that i also intrested in UI/UX design and back end development. i love to learn new things and always open to new opportunities",
                                    speed: Duration(milliseconds: 50),
                                  ),
                                ],
                                onTap: () {
                                  // print("Tap Event");
                                },
                                repeatForever: false,
                                isRepeatingAnimation: false,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _scrollToSection(_projectsKey);
                                    },
                                    child: Text("View Projects"),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: Text("Download CV"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 285,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _launchUrl(
                                        felix.sosmedAccount![0]['Link'],
                                      );
                                    },
                                    icon: Image.asset(
                                      felix.sosmedAccount![0]['imageAsset']!,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _launchUrl(
                                        felix.sosmedAccount![1]['Link'],
                                      );
                                    },
                                    icon: Image.asset(
                                      felix.sosmedAccount![1]['imageAsset']!,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _launchUrl(
                                        felix.sosmedAccount![2]['Link'],
                                      );
                                    },
                                    icon: Image.asset(
                                      felix.sosmedAccount![2]['imageAsset']!,
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
              FeatureProject(projectsKey: _projectsKey),
              Container(
                key: _contactKey,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 900;
                    final contactText = Column(
                      crossAxisAlignment: isWide
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Let's Talk",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "I'm open to Junior Flutter roles and exciting projects. Feel free to reach out!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 94, 93, 93),
                          ),
                        ),
                      ],
                    );
                    final cardContact = !isWide
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final Map<String, String> item =
                                  felix.sosmedAccount![index];
                              return ContactCard(
                                item: item,
                                onClick: () {
                                  _launchUrl(item['Link']);
                                },
                              );
                            },
                            itemCount: felix.sosmedAccount!.length,
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: constraints.maxWidth / 200,
                                ),
                            itemCount: felix.sosmedAccount!.length,
                            itemBuilder: (context, index) {
                              final Map<String, String> item =
                                  felix.sosmedAccount![index];
                              return ContactCard(
                                item: item,
                                onClick: () {
                                  _launchUrl(item['Link']);
                                },
                              );
                            },
                          );

                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1400),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: isWide
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [contactText, cardContact],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
