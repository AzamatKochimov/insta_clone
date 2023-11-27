import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late OverlayEntry _popupDialog;

  List<String> posts = [
    "assets/images/azam_post.jpg",
    "assets/images/gayrat_post.jpg",
    "assets/images/asad_post.jpg",
    "assets/images/me_post.jpg",
    "assets/images/book_post.jpg",
    "assets/images/pdp_post.jpg",
    "assets/images/bunik_post.jpg",
    "assets/images/maknuna_post.jpg",
    "assets/images/gayrat_post.jpg",
    "assets/images/azamazing.jpg",
    "assets/images/pdp_post.jpg",
    "assets/images/pdp_post.jpg",
    "assets/images/book_post.jpg",
    "assets/images/azamazing.jpg",
    "assets/images/pdp_post.jpg",
    "assets/images/azamazing.jpg",
    "assets/images/azamazing.jpg",
    "assets/images/azamazing.jpg",
    "assets/images/azamazing.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: posts.map(_createGridTileWidget).toList(),
      ),
    );
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(0.7),
          child: GestureDetector(
            onLongPress: () {
              _popupDialog = _createPopupDialog(url);
              Overlay.of(context).insert(_popupDialog);
            },
            onLongPressEnd: (details) => _popupDialog.remove(),
            child: Image.asset(url, fit: BoxFit.cover),
          ),
        ),
      );

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        child: _createPopupContent(url),
      ),
    );
  }

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: const ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/azamazing.jpg'),
        ),
        title: Text(
          'azamazing_guy',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.asset(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({super.key,  required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? opacityAnimation;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeOutExpo),
    );

    controller!.addListener(() => setState(() {}));
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation!.value),
      child: Center(
        child: FadeTransition(
          opacity: opacityAnimation as Animation<double>,
          child: ScaleTransition(
            scale: scaleAnimation as Animation<double>,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
