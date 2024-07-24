import 'package:flutter/material.dart';

class TablisaWidget extends StatelessWidget {
  const TablisaWidget({super.key, required this.image});
  final image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablisa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/harplar/$image'))),
        ),
      ),
    );
  }
}
