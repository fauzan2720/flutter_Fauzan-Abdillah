import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/state.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/view_model/image_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ImageGeneratorPage extends StatelessWidget {
  static const routeName = 'image_generator_page';

  const ImageGeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Generator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            80.0.height,
            Consumer<ImageGeneratorProvider>(
              builder: (context, value, child) {
                if (value.state == DataStateStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (value.state == DataStateStatus.failed) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else if (value.state == DataStateStatus.success) {
                  return SvgPicture.string(
                    context.read<ImageGeneratorProvider>().avatar,
                    width: 200.0,
                  );
                } else {
                  return SvgPicture.network(
                      "https://api.dicebear.com/6.x/bottts/svg");
                }
              },
            ),
            20.0.height,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FozFormInput(
                controller: nameController,
                label: "Your Name",
              ),
            ),
            FozFormButton(
              label: "Generate",
              onPressed: () => context
                  .read<ImageGeneratorProvider>()
                  .avatarUrl(nameController.text),
            ),
          ],
        ),
      ),
    );
  }
}
