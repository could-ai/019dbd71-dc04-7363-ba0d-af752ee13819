import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/slide.dart';
import '../widgets/slide_view.dart';

class PresentationScreen extends StatefulWidget {
  final String presentationTitle;
  final List<Slide> slides;

  const PresentationScreen({
    super.key,
    required this.presentationTitle,
    required this.slides,
  });

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _nextSlide() {
    if (_currentIndex < widget.slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousSlide() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
          event.logicalKey == LogicalKeyboardKey.space) {
        _nextSlide();
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        _previousSlide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: _handleKeyEvent,
        child: Stack(
          children: [
            // Slide Content
            Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.slides.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SlideView(slide: widget.slides[index]);
                    },
                  ),
                ),
              ),
            ),
            
            // Navigation Controls & Progress
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.presentationTitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
                        onPressed: _currentIndex > 0 ? _previousSlide : null,
                      ),
                      Text(
                        '${_currentIndex + 1} / ${widget.slides.length}',
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
                        onPressed: _currentIndex < widget.slides.length - 1 ? _nextSlide : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
