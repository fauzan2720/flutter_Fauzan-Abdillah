import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewImagePage extends StatelessWidget {
  static const routeName = 'preview_image_page';

  final String? imageUrl;

  const PreviewImagePage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PreviewImagePage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Image'),
      ),
      body: Hero(
        tag: args.imageUrl!,
        child: PhotoView(
          imageProvider: AssetImage(args.imageUrl!),
          maxScale: PhotoViewComputedScale.covered * 2.0,
          minScale: PhotoViewComputedScale.contained * 0.8,
          initialScale: PhotoViewComputedScale.contained,
        ),
      ),
    );
  }
}
