import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlurredAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // To add some elevation shadow
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 2),
        ),
      ]),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                const Text('Dashboard',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

AudioCache player = AudioCache(
  prefix: 'assets/',
  fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY),
);

void playSound(int noteNumber) {
  player.play(
    'sounds/assets_note$noteNumber.wav',
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beginner Xylophone'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: InkWell(
            child: Container(
              width: double.infinity,
              color: Colors.red,
              height: 100,
              child: const Center(
                  child: Text(
                'Saa',
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              playSound(1);
            },
          ),
        ),
        Expanded(
          child: InkWell(
            child: Container(
              color: Colors.blue,
              height: 100,
              child: const Center(
                  child: Text(
                'Re',
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              playSound(2);
            },
          ),
        ),
        Expanded(
          child: InkWell(
            child: Container(
              color: Colors.green,
              height: 100,
              child: const Center(
                  child: Text(
                'Ga',
                style: TextStyle(fontSize: 32),
              )),
            ),
            onTap: () {
              playSound(3);
            },
          ),
        ),
        Expanded(
            child: InkWell(
          child: Container(
            color: Colors.yellow,
            height: 100,
            child: const Center(
                child: Text(
              'Ma',
              style: TextStyle(fontSize: 32),
            )),
          ),
          onTap: () {
            playSound(4);
          },
        )),
        Expanded(
            child: InkWell(
          child: Container(
            width: double.infinity,
            color: Colors.orange,
            child: const Center(
                child: Text(
              'Pa',
              style: TextStyle(fontSize: 32),
            )),
          ),
          onTap: () {
            playSound(5);
          },
        )),
        Expanded(
            child: InkWell(
          child: Container(
            color: Colors.purple,
            height: 100,
            child: const Center(
                child: Text(
              'Dhaa',
              style: TextStyle(fontSize: 32),
            )),
          ),
          onTap: () {
            playSound(6);
          },
        )),
        Expanded(
            child: InkWell(
          child: Container(
            color: Colors.grey,
            height: 100,
            child: const Center(
                child: Text(
              'Nee',
              style: TextStyle(fontSize: 32),
            )),
          ),
          onTap: () {
            playSound(7);
          },
        )),
      ]),
    );
  }
}
