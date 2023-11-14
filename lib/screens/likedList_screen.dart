import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/widgets/likedwebtoon_widget.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class LikedList extends StatefulWidget {
  const LikedList({super.key});

  @override
  State<LikedList> createState() => _LikedListState();
}

class _LikedListState extends State<LikedList> {
  late SharedPreferences prefs;
  late List<WebtoonModel> likedList = [];

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final toonlists = prefs.getStringList("likedToons");
    if (toonlists != null) {
      for (var item in toonlists) {
        var toon = WebtoonModel.fromJson(jsonDecode(item));
        likedList.add(toon);
      }
      setState(() {});
    } else {
      await prefs.setStringList("likedToons", []);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          '찜한 목록',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30,
        ),
        child: likedItem(likedList),
      ),
    );
  }

  ListView likedItem(List<WebtoonModel> likedList) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var likedWebtoon = likedList[index];
        return LikedWebtoon(likedWebtoon: likedWebtoon);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: likedList.length,
    );
  }
}
