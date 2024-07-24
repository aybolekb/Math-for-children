import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_for_child/model/book.dart';
import 'package:math_for_child/screen/pdf_reader.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<String> cardBackgroundImages = [
    'assets/kitapSurat/Çagalar üçin Iňlisçe–Türkmençe gysga hekaýalar.jpg',
    'assets/kitapSurat/Garaýew A~Meniň harplygym.jpg',
    'assets/kitapSurat/Sanawaçlar-2008`Türkmen döwlet neşirýat gullugy.jpg',
    'assets/kitapSurat/Hojanyýazow H~Matematika-2015`Türkmen döwlet neşirýat gullugy.jpg',
    'assets/kitapSurat/Şahymährem.jpg',
    'assets/kitapSurat/Ýartygulak-2010`Türkmen döwlet neşirýat gullugy.jpg',
    'assets/kitapSurat/Üç çopan-2010`Türkmen döwlet neşirýat gullugy.jpg',
    'assets/kitapSurat/Garry atanyň nesihatlary.jpg',
    'assets/kitapSurat/Gorkana goşa görner.jpg',
  ];
  List<Book> books = [];
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadJson().then((list) {
      setState(() {
        for (var element in list) {
          books.add(Book.fromJson(element));
        }
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Kitaplar'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.9,
                  crossAxisSpacing: 2,
                ),
                itemCount: books.length,
                itemBuilder: (BuildContext contex, int index) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PdfReader(
                                  pdfUrl: book.pdfUrl,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        cardBackgroundImages[index],
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              height: 180,
                              width: 150,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    book.bookName,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.amber.shade300),
                                          onPressed: () {},
                                          child: const Text(
                                            'Oka',
                                            style: TextStyle(fontSize: 18),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }

  Future<dynamic> loadJson() async {
    final json = await rootBundle.loadString('assets/json/books_json.json');

    return jsonDecode(json);
  }
}
