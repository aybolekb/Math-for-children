import 'package:flutter/material.dart';
import 'package:math_for_child/screen/category.dart';

class TeachScreen extends StatelessWidget {
  TeachScreen({super.key});

  final List<Map<String, dynamic>> mathItems = [
    {
      'title': 'Harplar',
      'img': 'abc.jpg',
      'color': Colors.red.shade100,
    },
    {
      'title': 'Sanlar',
      'img': 'numbers.jpg',
      'color': Colors.blue.shade100,
    },
    {
      'title': 'Renkler',
      'img': 'colors.jpg',
      'color': Colors.green.shade100,
    },
    {
      'title': 'Sekiller',
      'img': 'shapes.jpg',
      'color': Colors.yellow.shade100,
    },
    {
      'title': 'Gosmak',
      'img': 'animals.jpg',
      'color': Colors.orange.shade100,
    },
    {
      'title': 'Ayyrmak',
      'img': 'birds.png',
      'color': Colors.purple.shade100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owren'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: mathItems.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = mathItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                    selectedCategory: item['title'],
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 10,
                        color: item['color'],
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/img/${item['img']}',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item['title'],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
