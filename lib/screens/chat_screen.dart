import 'package:flutter/material.dart';
import 'package:imtihon_3_oy/model/chat.dart';
import 'package:imtihon_3_oy/screens/favoritescreen.dart';
import 'package:imtihon_3_oy/screens/homescreen.dart';
import 'package:imtihon_3_oy/screens/profile_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> chatItems = [
    {'name': 'Javohir', 'message': 'You Sent a Sticker'},
    {'name': 'Asrorbek', 'message': 'Asror Sereal Sent Gift'},
    {'name': 'Asilbek', 'message': 'Hi'},
    {'name': 'Putri Chania', 'message': 'Putri Chania Sent Gift'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredChatItems = chatItems
        .where((chatItem) =>
            chatItem['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Message',
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: filteredChatItems
                    .map((chatItem) => ChatItem(
                          name: chatItem['name']!,
                          message: chatItem['message']!,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.home,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
              child: const Icon(Icons.message, color: Colors.blue, size: 30),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoritesPage()),
                );
              },
              child: const Icon(Icons.favorite),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: const Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
