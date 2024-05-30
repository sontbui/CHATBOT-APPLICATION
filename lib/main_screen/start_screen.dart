import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  String textToShow = 'Hello'; // Biến lưu trữ văn bản của Text
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), // Duration of the animation
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      // Cập nhật văn bản khi nút được nhấn
      textToShow = 'Start Chatting With Our Chatbot to get to your questions !';
    });
    _controller.forward().then((value) => _controller.reverse());
  }

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
              'assets/images/background_under.png', // Đường dẫn của hình nền
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
                Image.asset('assets/images/bot_start1.png', height: 300),
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
                // Button with animation
                GestureDetector(
                  onTap: _onTap,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      'assets/images/button_next.png',
                      height: 50,
                      width: 120,
                    ),
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
