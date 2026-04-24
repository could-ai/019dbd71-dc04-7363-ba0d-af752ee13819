import 'package:flutter/material.dart';
import '../models/slide.dart';

class SlideView extends StatelessWidget {
  final Slide slide;

  const SlideView({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48.0),
      color: Colors.white,
      child: _buildSlideContent(context),
    );
  }

  Widget _buildSlideContent(BuildContext context) {
    switch (slide.layout) {
      case SlideLayout.title:
        return _buildTitleSlide(context);
      case SlideLayout.content:
        return _buildContentSlide(context);
      case SlideLayout.bullets:
        return _buildBulletsSlide(context);
      case SlideLayout.imageAndText:
        return _buildImageAndTextSlide(context);
    }
  }

  Widget _buildTitleSlide(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          slide.title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
          textAlign: TextAlign.center,
        ),
        if (slide.subtitle != null) ...[
          const SizedBox(height: 24),
          Text(
            slide.subtitle!,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black54,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  Widget _buildContentSlide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 48),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              slide.content ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black87,
                    height: 1.5,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletsSlide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 48),
        Expanded(
          child: ListView.builder(
            itemCount: slide.bullets?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• ',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: Text(
                        slide.bullets![index],
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.black87,
                              height: 1.5,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImageAndTextSlide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const SizedBox(height: 48),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  slide.content ?? '',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black87,
                        height: 1.5,
                      ),
                ),
              ),
              const SizedBox(width: 48),
              Expanded(
                flex: 1,
                child: slide.imageUrl != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(slide.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : const Placeholder(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          slide.title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
        ),
        const Divider(color: Colors.blueAccent, thickness: 4, endIndent: 800),
      ],
    );
  }
}
