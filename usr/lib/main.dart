import 'package:flutter/material.dart';
import 'models/slide.dart';
import 'screens/presentation_screen.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Presentation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: 'Roboto', // Modern, clean font
      ),
      debugShowCheckedModeBanner: false,
      home: PresentationScreen(
        presentationTitle: 'The Universal Knowledge Base',
        slides: _getSampleSlides(),
      ),
    );
  }

  List<Slide> _getSampleSlides() {
    return [
      Slide.title(
        title: 'The Universal Knowledge Base',
        subtitle: 'Exploring a multitude of topics in one presentation',
      ),
      Slide.content(
        title: 'Introduction',
        content: 'Welcome to this comprehensive overview.\n\nIn this presentation, we will cover a wide variety of topics ranging from modern technology and scientific discoveries to historical milestones and artistic movements.\n\nOur goal is to demonstrate a dynamic presentation built entirely using Flutter.',
      ),
      Slide.bullets(
        title: 'Topics Covered Today',
        bullets: [
          'Technology: Artificial Intelligence & Cloud Computing',
          'Science: Quantum Mechanics & Space Exploration',
          'History: The Industrial Revolution',
          'Arts: The Renaissance',
          'Future Outlook: Sustainable Energy',
        ],
      ),
      Slide.imageAndText(
        title: 'Technology: AI Revolution',
        content: 'Artificial Intelligence has rapidly evolved over the past decade.\n\nMachine learning models can now process vast amounts of data, recognize complex patterns, and generate creative content.\n\nFrom self-driving cars to advanced medical diagnostics, AI is reshaping the boundaries of human capability.',
        imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?auto=format&fit=crop&q=80&w=800',
      ),
      Slide.bullets(
        title: 'Science: The Frontier of Space',
        bullets: [
          'The James Webb Space Telescope has provided unprecedented views of early galaxies.',
          'Commercial space flight is becoming increasingly viable and accessible.',
          'Plans for lunar bases and Mars missions are actively in development by multiple space agencies.',
          'Exoplanet discovery accelerates, bringing us closer to finding Earth-like worlds.',
        ],
      ),
      Slide.content(
        title: 'History: The Industrial Shift',
        content: 'The Industrial Revolution marked a major turning point in history; almost every aspect of daily life was influenced in some way.\n\nIn particular, average income and population began to exhibit unprecedented sustained growth.\n\nInnovations in textile manufacturing, metallurgy, and the advent of the steam engine powered this massive societal transformation.',
      ),
      Slide.title(
        title: 'Conclusion',
        subtitle: 'Thank you for joining this journey across disciplines.\n\nBuilt with Flutter.',
      ),
    ];
  }
}
