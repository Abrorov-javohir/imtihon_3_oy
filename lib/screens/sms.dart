import 'package:flutter/material.dart'; // Flutter Material dizayn paketini import qilish

// Chat StatefulWidget deklaratsiyasi
class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

// Chatning holatini boshqaradigan sinf
class _ChatState extends State<Chat> {
  // Xabarlar ro'yxati
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hi how are you', 'isSent': false}, // Qabul qilingan xabar
    {'text': 'Hi I am fine and you', 'isSent': true}, // Yuborilgan xabar
    {'text': 'Me too', 'isSent': false}, // Qabul qilingan xabar
  ];

  final TextEditingController _controller =
      TextEditingController(); // Matn maydoni uchun kontroller

  // Yangi xabar jo'natish funksiyasi
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(
            {'text': _controller.text, 'isSent': true}); // Yangi xabar qo'shish
        _controller.clear(); // Matn maydonini tozalash
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              child: Text('A'), // Avatar ichida matn
            ),
            SizedBox(width: 8), // Bo'sh joy
            Text('Asrorbek'), // Sarlavha matni
          ],
        ),
        backgroundColor: Colors.purple[100], // AppBar fon rangi
        elevation: 0, // AppBar soyasi
        actions: [
          IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {}), // Qo'ng'iroq ikonkasi
          IconButton(
              icon: const Icon(Icons.videocam),
              onPressed: () {}), // Video qo'ng'iroq ikonkasi
          IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {}), // Ko'proq variantlar ikonkasi
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length, // Xabarlar soni
              itemBuilder: (context, index) {
                final message = messages[index]; // Joriy xabar
                return Align(
                  alignment: message['isSent']
                      ? Alignment
                          .centerRight // Yuborilgan xabarlar o'ngga joylashtiriladi
                      : Alignment
                          .centerLeft, // Qabul qilingan xabarlar chapga joylashtiriladi
                  child: Container(
                    padding: const EdgeInsets.all(10), // Ichki bo'sh joy
                    margin: const EdgeInsets.all(5), // Tashqi bo'sh joy
                    decoration: BoxDecoration(
                      color: message['isSent']
                          ? Colors.purple[
                              100] // Yuborilgan xabarlar uchun fon rangi
                          : Colors.grey[
                              200], // Qabul qilingan xabarlar uchun fon rangi
                      borderRadius:
                          BorderRadius.circular(10), // Burchaklarni yumaloqlash
                    ),
                    child: Text(message['text']), // Xabar matni
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Butunlay bo'sh joy
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () {}), // Kamera ikonkasi
                IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () {}), // Foto ikonkasi
                Expanded(
                  child: TextField(
                    controller: _controller, // Matn maydoni kontrolleri
                    decoration: InputDecoration(
                      hintText: 'Text message', // Matn maydoni uchun hint matni
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Matn maydoni burchaklarini yumaloqlash
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send), // Yuborish ikonkasi
                  onPressed: _sendMessage, // Xabar jo'natish
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
