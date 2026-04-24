enum SlideLayout {
  title,
  content,
  bullets,
  imageAndText,
}

class Slide {
  final String title;
  final String? subtitle;
  final String? content;
  final List<String>? bullets;
  final String? imageUrl;
  final SlideLayout layout;

  const Slide({
    required this.title,
    this.subtitle,
    this.content,
    this.bullets,
    this.imageUrl,
    required this.layout,
  });

  // Factory methods for convenient slide creation
  factory Slide.title({
    required String title,
    String? subtitle,
  }) {
    return Slide(
      title: title,
      subtitle: subtitle,
      layout: SlideLayout.title,
    );
  }

  factory Slide.content({
    required String title,
    required String content,
  }) {
    return Slide(
      title: title,
      content: content,
      layout: SlideLayout.content,
    );
  }

  factory Slide.bullets({
    required String title,
    required List<String> bullets,
  }) {
    return Slide(
      title: title,
      bullets: bullets,
      layout: SlideLayout.bullets,
    );
  }

  factory Slide.imageAndText({
    required String title,
    required String content,
    required String imageUrl,
  }) {
    return Slide(
      title: title,
      content: content,
      imageUrl: imageUrl,
      layout: SlideLayout.imageAndText,
    );
  }
}
