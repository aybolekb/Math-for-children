import 'package:flutter/material.dart';
import 'package:math_for_child/constants/harplar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.selectedCategory});
  final String selectedCategory;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _index = 0;
  dynamic catego = harplar;
  @override
  void initState() {
    super.initState();
    if (widget.selectedCategory == 'Harplar') {
      catego = harplar;
    } else if (widget.selectedCategory == 'Sanlar') {
      catego = sanlar;
    } else if (widget.selectedCategory == 'Sekiller') {
      catego = sekiller;
    } else {
      catego = harplar;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color = harplar[_index]['color'];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: color),
              child: Center(
                child: Text(
                  catego[_index]['harp'],
                  style: const TextStyle(fontSize: 70, color: Colors.white),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 50,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_index == 0) {
                        _index = 4;
                      } else {
                        _index--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_circle_left,
                    color: color,
                    size: 60,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_index == 4) {
                        _index = 0;
                      } else {
                        _index++;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_circle_right,
                    color: color,
                    size: 60,
                  ),
                ),
              ],
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/harplar/${catego[_index]['image']}',
                width: 280,
                height: 200,
              ),
            ),

            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: color),
              child: Center(
                child: Text(
                  catego[_index]['meselem'],
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
