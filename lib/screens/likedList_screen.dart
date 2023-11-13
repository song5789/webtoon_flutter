import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webtoon/models/webtoon_model.dart';

class LikedList extends StatefulWidget {
  const LikedList({super.key});

  @override
  State<LikedList> createState() => _LikedListState();
}

class _LikedListState extends State<LikedList> {
  late SharedPreferences prefs;
  late List<Map<String, dynamic>> likedList;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
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
      body: const Column(
        children: [Text("섹스")],
      ),
    );
  }
}
