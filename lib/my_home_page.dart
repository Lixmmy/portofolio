import 'package:flutter/material.dart';
import 'package:portofolio/model.dart';
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
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.5,
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
                  right: MediaQuery.of(context).size.width > 600 ? 250 : 20,
                  top: 150,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width > 600 ? 400 : 285,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            userList[0].nama,
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
                              color: Colors.white,
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
                                "A ${userList[0].pekerjaan} who currently focused on Mobile development. Other than that i also intrested in UI/UX design and back end development. i love to learn new things and always open to new opportunities",
                                speed: Duration(milliseconds: 50),
                              ),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                            repeatForever: false,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/github.png',
                                  width: 26,
                                  height: 26,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/linkedin.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/instagram.png',
                                  width: 26,
                                  height: 26,
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
        ],
      ),
    );
  }
}
