import 'package:flutter/material.dart';
import 'package:math_for_child/screen/about_screen.dart';
import 'package:math_for_child/screen/bookScreen.dart';
import 'package:math_for_child/screen/tablisa_screen.dart';
import 'package:math_for_child/screen/teach.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map<String, dynamic>> menu = [
    {"text": "Öwren", 'link': TeachScreen()},
    {"text": "Oýunlar", 'link': TeachScreen()},
    {"text": "Kitaplar", 'link': const BookScreen()},
    {
      "text": "Tablisa",
      'link': const TabliisaScreen(),
    },
    {
      "text": "Biz barada",
      'link': const AboutScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'assets/img/back5.jpg',
            ),
            fit: BoxFit.fitHeight,
          )),
        ),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Matematika',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 50,
              ),
              ...List.generate(
                  menu.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          menu[index]['link']));
                            },
                            child: Text(
                              menu[index]['text'],
                              style: const TextStyle(fontSize: 16),
                            )),
                      )),
            ],
          ),
        ))
      ],
    ));
  }
}
