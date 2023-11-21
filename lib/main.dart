import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/homepage.dart';
import 'package:instagram_clone/pages/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            //! Btn1
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.home,
                color: currentPage == 0
                    ? Color.fromRGBO(203, 75, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 0;
                });
              },
            ),
            Spacer(),
            //! Btn2
            IconButton(
              icon: Icon(
                Icons.search,
                color: currentPage == 1
                    ? Color.fromRGBO(203, 75, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                });
              },
            ),
            Spacer(),
            //! Btn3
            IconButton(
              icon: Icon(
                Icons.ondemand_video,
                color: currentPage == 2
                    ? Color.fromRGBO(203, 75, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 2;
                });
              },
            ),
            Spacer(),
            //! Btn4
            IconButton(
              icon: Icon(
                Icons.card_travel,
                color: currentPage == 3
                    ? Color.fromRGBO(203, 75, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 3;
                });
              },
            ),
            Spacer(),
            //! Btn5
            IconButton(
              icon: Icon(
                Icons.person,
                color: currentPage == 4
                    ? Color.fromRGBO(203, 75, 101, 1)
                    : Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  currentPage = 4;
                });
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
