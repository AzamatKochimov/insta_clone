import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key});

  List<String> posts = [
    "images/azam_post.jpg",
    "images/gayrat_post.jpg",
    "images/asad_post.jpg",
    "images/me_post.jpg",
    "images/book_post.jpg",
    "images/pdp_post.jpg",
    "images/bunik_post.jpg",
    "images/maknuna_post.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _tagItem('Style'),
                  _tagItem('Science and Tech'),
                  _tagItem('Flutter'),
                  _tagItem('YouTube'),
                  _tagItem('Azamazing_guy'),
                  _tagItem('me.coding'),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.grey[300],
                  child: Image.asset(
                    posts[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _tagItem(String title) {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey.shade400),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.all(5),
      child: Text(title),
    ),
  );
}