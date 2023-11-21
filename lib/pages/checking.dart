import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instagram Search'),
          backgroundColor: Colors.white,
          elevation: 0, // Removes the shadow
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InstagramSearchScreen(),
        ),
      ),
    );
  }
}

class InstagramSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 12, // Replace with the actual number of pictures and videos
      itemBuilder: (context, index) {
        // You can replace this with your actual picture or video widget
        return Container(
          color: Colors.grey[300],
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
    );
  }
}
