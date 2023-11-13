import 'package:flutter/material.dart';
import 'package:webtoon/screens/likedList_screen.dart';

class LikedListButton extends StatelessWidget {
  const LikedListButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.green,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LikedList(),
              ),
            );
          },
          child: Icon(
            Icons.favorite,
            color: Colors.red.shade300,
            size: 30,
          ),
        ),
      ),
    );
  }
}
