import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/azamazing.jpg",
    "images/gayratjon.jpg",
    "images/mirzabekov.jpg",
    "images/teacherAzam.jpg",
    "images/goldenbooks.jpg",
    "images/pdpUniversity.jpg",
    "images/i_bunik.jpg",
    "images/maknuna_12.jpg",
  ];

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

  Future<void> justRefresh() async {
    await Future.delayed(const Duration(seconds: 1),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/insta_name.png',
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: justRefresh,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Stories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (index) => Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('images/story.jpg'),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(
                                profileImages[index],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Profile Name',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Column(
                children: List.generate(
                  8,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //HEADER POST
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundImage: AssetImage('images/story.jpg'),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Profile Name',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert_outlined),
                          ),
                        ],
                      ),
                      //IMAGE POST
                      Image.asset(
                        posts[index],
                      ),
                      //FOOTER POST
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                
                              });
                            },
                            icon: Icon(Icons.favorite_border),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat_bubble_outline),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share_outlined),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_border),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children:[
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Liked by",
                                  ),
                                  TextSpan(
                                    text: "  Profile Name",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: " and",
                                  ),
                                  TextSpan(
                                    text: "  93 935 0321 others...",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: " not good",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "@profileName",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: " Ajoyib, menimcha bu takrorlanmas rasm bo'libdi. Maslahatim endi hech qachon bunday rasmga tushmagin :)",
                                  ),
                                ],
                              ),
                            ),
                            Text('View all 40.7K comments', style: TextStyle(color: Colors.black38,),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
