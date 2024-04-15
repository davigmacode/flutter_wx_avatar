import 'package:flutter/material.dart';
import 'package:wx_text/wx_text.dart';
import 'package:wx_avatar/wx_avatar.dart';
import 'package:overlap_stack/overlap_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WxAvatar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              const WxText.displayMedium('WxAvatar'),
              const SizedBox(height: 40),
              const Wrapper(
                title: 'Rectangle Shape',
                child: Wrap(
                  spacing: 20,
                  children: [
                    WxAvatar(
                      backgroundColor: Colors.red,
                      image: NetworkImage('https://i.pravatar.cc/50?u=6'),
                    ),
                    WxAvatar(
                      elevation: 3.0,
                      backgroundColor: Colors.red,
                      foregroundStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                      child: Text('Wx'),
                    ),
                    WxAvatar(
                      borderStyle: BorderStyle.solid,
                      borderColor: Colors.black54,
                      borderWidth: 2,
                      foregroundColor: Colors.black87,
                      foregroundSize: 40,
                      child: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrapper(
                title: 'Circle Shape',
                child: Wrap(
                  spacing: 20,
                  children: [
                    const WxAvatar.circle(
                      image: NetworkImage('https://i.pravatar.cc/50?u=2'),
                    ),
                    const WxAvatar.circle(
                      elevation: 3.0,
                      backgroundColor: Colors.red,
                      child: Text('Wx'),
                    ),
                    WxAvatar.circle(
                      borderStyle: BorderStyle.solid,
                      borderColor: Colors.black54,
                      borderWidth: 2,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      foregroundColor: Colors.black87,
                      foregroundSize: 30,
                      child: const Icon(Icons.person),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Wrapper(
                title: 'Custom Shape',
                child: Wrap(
                  spacing: 25,
                  children: [
                    WxAvatar(
                      border: StarBorder(points: 12, innerRadiusRatio: .9),
                      borderStyle: BorderStyle.solid,
                      borderOffset: 5,
                      borderWidth: 2,
                      borderColor: Colors.blue,
                      backgroundColor: Colors.red,
                      image: NetworkImage('https://i.pravatar.cc/50?u=7'),
                    ),
                    WxAvatar(
                      border: StarBorder(
                        points: 8,
                        innerRadiusRatio: .7,
                        pointRounding: .9,
                      ),
                      shadows: [
                        BoxShadow(
                          color: Colors.green,
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      backgroundColor: Colors.red,
                      backgroundGradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.blue,
                          Colors.red,
                        ],
                      ),
                      child: Text('Wx'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Wrapper(
                title: 'Grouped Avatar',
                child: OverlapStack.builder(
                  minSpacing: 0.5,
                  maxSpacing: 0.8,
                  leadIndex: 3,
                  itemSize: const Size.square(30),
                  itemLimit: 7,
                  itemCount: 25,
                  itemBuilder: (context, i) {
                    return WxAvatar.circle(
                      radius: 15,
                      borderWidth: 3,
                      borderStyle: BorderStyle.solid,
                      borderColor: Theme.of(context).colorScheme.surface,
                      image: NetworkImage('https://i.pravatar.cc/50?u=$i'),
                    );
                  },
                  infoBuilder: (context, remaining) {
                    return WxAvatar.circle(
                      radius: 15,
                      elevation: 3.0,
                      foregroundSize: 11,
                      backgroundColor: Colors.red,
                      child: Text('+$remaining'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: WxText.labelLarge(title),
        ),
        SizedBox(
          width: 300,
          height: 100,
          child: Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: child),
            ),
          ),
        ),
      ],
    );
  }
}
