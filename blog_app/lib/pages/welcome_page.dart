import 'package:flutter/material.dart';
import 'dart:async';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  // This is going to hold all the image and text that we are going to show the users
  final List<Map<String, String>> _listOfImageAndText = [
    {
      'image': 'lib/images/carousel-image.webp',
      'text': 'Discover the latest news from around the globe!',
    },
    {
      'image': 'lib/images/carousel-image2.webp',
      'text': 'Stay informed with breaking stories and in-depth analysis.',
    },
    {
      'image': 'lib/images/carousel-image3.webp',
      'text': 'Your personalized news feed awaits. Get started now!',
    },
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _listOfImageAndText.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(microseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Or a background color that suits your design
      body: Column(
        children: [
          // Carousel (PageView) takes up most of the space
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _listOfImageAndText.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index; // Update current page when user swipes
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image
                    Image.asset(
                      _listOfImageAndText[index]['image']!,
                      height:
                          MediaQuery.of(context).size.height *
                          0.5, // 50% of screen height
                      fit: BoxFit.contain, // Ensure image fits without cropping
                    ),
                    const SizedBox(height: 30),
                    // Text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        _listOfImageAndText[index]['text']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Page Indicators (Dots)
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_listOfImageAndText.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: _currentPage == index ? 30 : 10, // Active dot is wider
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                );
              }),
            ),
          ),
          // Optional: A button to skip or get started
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to your main app screen or login/signup page
                Navigator.pushReplacementNamed(context, '/login_options_page');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}
