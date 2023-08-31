import 'package:flutter/material.dart';

import '../../core/widgets/drawer/drawer_v1_widget.dart';

class HomePageApp extends StatefulWidget {
  final String title;

  const HomePageApp({super.key, required this.title});

  @override
  State<HomePageApp> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<HomePageApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          drawer: const DrawerV1Widget(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'provider');
                  },
                  child: const Text('provider'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Change Notifier'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
