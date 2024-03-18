import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderContainer extends StatefulWidget {
  final String header, id;

  const HeaderContainer({
    super.key,
    required this.header,
    required this.id,
  });

  @override
  State<HeaderContainer> createState() => _HeaderContainerState();
}

class _HeaderContainerState extends State<HeaderContainer> {
  late SharedPreferences prefs;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likeToons = prefs.getStringList('likeToons');
    if (likeToons != null) {
      if (likeToons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likeToons', []);
    }
  }

  Future<void> onHeartTap() async {
    final likedToons = prefs.getStringList("likedToons");
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
        setState(() {
          isLiked = false;
        });
      } else {
        likedToons.add(widget.id);
        setState(() {
          isLiked = true;
        });
      }
      await prefs.setStringList('likedToons', likedToons);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: Colors.black,
      backgroundColor: Theme.of(context).cardColor,
      foregroundColor: Theme.of(context).textTheme.displayLarge?.color,
      actions: [
        IconButton(
          onPressed: () => onHeartTap(),
          icon: Icon(
            isLiked ? Icons.favorite_outlined : Icons.favorite_border_outlined,
          ),
        )
      ],
      title: Text(widget.header,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
            fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
          )),
    );
  }
}
