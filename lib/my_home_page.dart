import 'package:flutter/material.dart';
import 'package:portofolio/model.dart';
import 'package:rive/rive.dart' hide Image;

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
                  child: Text(
                    "Hello, I'm ${userList[0].nama}\nFlutter Developer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Me",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 3,
                              height: 40,
                              color: Colors.blue.shade300, 
                              margin: const EdgeInsets.only(
                                right: 8,
                              ),
                            ),
                            Text(
                              userList[0].nama,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(userList[0].foto!, width: 200, height: 200),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
