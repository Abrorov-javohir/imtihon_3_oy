import 'package:flutter/material.dart'; // Flutter Material dizayn paketini import qilish
import 'package:imtihon_3_oy/model/chat.dart'; // Chat modelini import qilish
import 'package:imtihon_3_oy/screens/favoritescreen.dart'; // Favoritlar ekranini import qilish
import 'package:imtihon_3_oy/screens/homescreen.dart'; // Uy ekranini import qilish
import 'package:imtihon_3_oy/screens/profile_screen.dart'; // Profil ekranini import qilish

// ChatScreen StatefulWidget deklaratsiyasi
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

// ChatScreenning holatini boshqaradigan sinf
class _ChatScreenState extends State<ChatScreen> {
  // Chat elementlarining ro'yxati
  List<Map<String, String>> chatItems = [
    {'name': 'Javohir', 'message': 'You Sent a Sticker'},
    {'name': 'Asrorbek', 'message': 'Asror Sereal Sent Gift'},
    {'name': 'Asilbek', 'message': 'Hi'},
    {'name': 'Putri Chania', 'message': 'Putri Chania Sent Gift'},
  ];

  // Qidiruv so'rovi uchun o'zgaruvchi
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Qidiruv so'roviga mos keladigan chat elementlarini filtrlash
    List<Map<String, String>> filteredChatItems = chatItems
        .where((chatItem) =>
            chatItem['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'), // AppBar sarlavhasi
        backgroundColor: Colors.white, // AppBar fon rangi
        foregroundColor: Colors.black, // AppBar matn rangi
        elevation: 0, // AppBar soyasi
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Tananing chetidan 16 piksel bo'sh joy
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Gorizontal bo'sh joy
              decoration: BoxDecoration(
                color: Colors.grey[200], // Kontayner fon rangi
                borderRadius:
                    BorderRadius.circular(30.0), // Kontaynerning burchaklari
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search Message', // Qidiruv maydoni uchun matn
                  border: InputBorder.none, // Chegarasiz qidiruv maydoni
                  icon: Icon(Icons.search,
                      color: Colors.grey), // Qidiruv ikonkasi
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value; // Qidiruv so'rovini yangilash
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: filteredChatItems
                    .map((chatItem) => ChatItem(
                          name: chatItem['name']!, // Chat ismi
                          message: chatItem['message']!, // Chat xabari
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // Pastki panel shakli
        notchMargin: 6.0, // Pastki panel chegara
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Elementlarni teng taqsimlash
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomeScreen(), // Uy ekraniga o'tish
                  ),
                );
              },
              child: const Icon(
                Icons.home, // Uy ikonkasi
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ChatScreen(), // Chat ekraniga o'tish
                  ),
                );
              },
              child: const Icon(Icons.message,
                  color: Colors.blue, size: 30), // Chat ikonkasi
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FavoritesPage()), // Favoritlar ekraniga o'tish
                );
              },
              child: const Icon(Icons.favorite), // Favoritlar ikonkasi
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfileScreen()), // Profil ekraniga o'tish
                );
              },
              child: const Icon(Icons.person), // Profil ikonkasi
            )
          ],
        ),
      ),
    );
  }
}
