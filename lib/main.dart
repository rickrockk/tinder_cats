import 'package:flutter/material.dart';
import 'package:lecture_1_app/model/cat_model.dart';
import 'package:lecture_1_app/service/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final service = Service();
  CatsModel? cats;
  String? randomCat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        title: const Text('Котики'),
      ),
      backgroundColor: Colors.yellow[200],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25),
            child: const Text(
              "Главная",
              style: TextStyle(fontSize: 22, color: Colors.black87),
            ),
          ),
          Flexible(
            child: Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                ),
                icon: const Icon(
                  Icons.favorite_outline,
                  size: 24,
                  color: Colors.white,
                ),
                label: const Text(
                  'Check favorites',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 14,
                child: SizedBox.square(
                  dimension: 300,
                  child: Builder(
                    builder: (context) {
                      if (randomCat == null) {
                        return Center(
                          child: CircularProgressIndicator(
                              color: Colors.yellow[200]),
                        );
                      }

                      return Image.network(
                        randomCat!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                                color: Colors.yellow[200]),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.large(
                    onPressed: () {
                      getRandomCat();
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  FloatingActionButton.large(
                    onPressed: () {
                      getRandomCat();
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getRandomCat() {
    setState(() {
      cats!.imgUrls.shuffle();
      randomCat = cats!.imgUrls.first;
    });
  }

  @override
  void initState() {
    super.initState();
    service.getCats().then((value) {
      cats = value;
      getRandomCat();
    });
  }
}
