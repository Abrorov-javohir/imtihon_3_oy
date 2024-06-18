import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            languageOption("English"),
            languageOption("Uzbek"),
            languageOption("Russian"),
          ],
        ),
      ),
    );
  }

  Widget languageOption(String language) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: selectedLanguage == language ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: selectedLanguage == language ? Colors.blue : Colors.grey),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            language,
            style: TextStyle(
              color: selectedLanguage == language
                  ? Colors.white
                  : Colors.grey[600],
              fontWeight: selectedLanguage == language
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            // Set selectedLanguage to the tapped language
            selectedLanguage = language;
          });
        },
      ),
    );
  }
}
