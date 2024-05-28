import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String textToShow = 'Hello'; // Biến lưu trữ văn bản của Text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 130, 1), // Background color
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            bottom: -650,
            child: Image.asset(
              'assets/background_under.png', // Đường dẫn của hình nền
              fit: BoxFit.fitWidth,
            ),
          ),
          // Content
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Căn giữa theo trục chéo
              children: [
                // Character image
                Image.asset('assets/bot_start1.png', height: 300),
                const SizedBox(height: 250),
                // Text
                Text(
                  textToShow,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontFamily: 'RedditMono-ExtraLight',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0),
                // Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Cập nhật văn bản khi nút được nhấn
                      textToShow =
                          'Start Chatting With Our Chatbot to get to your questions !';
                    });
                  },
                  child: Image.asset(
                    'assets/button_next.png', // Đường dẫn của hình ảnh nút
                    height: 50,
                    width: 120,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
