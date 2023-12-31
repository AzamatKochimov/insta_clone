import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/homepage.dart';
import 'package:instagram_clone/screens/profile_base_screen.dart';
import 'package:instagram_clone/pages/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Instagram Demo',
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
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(currentPage),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: currentPage,
        onTabTapped: (index) {
          setState(() {
            currentPage = index;
          });
          navigateToPage(index);
        },
      ),
    );
  }

  void navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileBaseScreen()),
        );
        break;
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return SearchPage();
      case 2:
        // Replace with the appropriate page for index 2
        return HomePage();
      case 3:
        return HomePage();
      case 4:
        return ProfileBaseScreen();
      default:
        return HomePage();
    }
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar({
    required this.currentPage,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Expanded(
              child: IconButton(
                icon: Icon(
                  _getIconForIndex(i),
                  color: currentPage == i
                      ? const Color.fromRGBO(203, 75, 101, 1)
                      : const Color.fromRGBO(40, 40, 40, 1),
                ),
                onPressed: () => onTabTapped(i),
              ),
            ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.search;
      case 2:
        return Icons.add_box_outlined;
      case 3:
        return Icons.ondemand_video;
      case 4:
        return Icons.person;
      default:
        return Icons.home;
    }
  }
}
