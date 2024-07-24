import 'package:flutter/material.dart';
import 'package:math_for_child/widgets/tablisa_widget.dart';

class TabliisaScreen extends StatelessWidget {
  const TabliisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tablisaItems = [
      {
        'color': Colors.red.shade100,
        'image': "1_times.jpg",
      },
      {
        'color': Colors.blue.shade100,
        'image': "2_times.jpg",
      },
      {
        'color': Colors.green.shade100,
        'image': "3_times.jpg",
      },
      {
        'color': Colors.yellow.shade100,
        'image': "4_times.jpg",
      },
      {
        'color': Colors.purple.shade100,
        'image': "5_times.jpg",
      },
      {
        'color': Colors.orange.shade100,
        'image': "6_times.jpg",
      },
      {
        'color': Colors.pink.shade100,
        'image': "7_times.jpg",
      },
      {
        'color': Colors.amber.shade100,
        'image': "8_times.jpg",
      },
      {
        'color': Colors.red.shade100,
        'image': "9_times.jpg",
      },
      {
        'color': Colors.blue.shade100,
        'image': "10_times.jpg",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablisa'),
      ),
      body: ListView(children: [
        Column(
          children: [
            ...List.generate(
                tablisaItems.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TablisaWidget(
                                        image: tablisaItems[index]['image'],
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                color: tablisaItems[index]['color'],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: ListTile(
                              title: Text(
                                '${index + 1} Kopeltmek Tablisasy',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ]),
    );
  }
}
