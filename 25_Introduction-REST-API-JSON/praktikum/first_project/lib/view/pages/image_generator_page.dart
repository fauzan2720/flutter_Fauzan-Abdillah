import 'package:first_project/core/extensions/double_ext.dart';
import 'package:first_project/core/widgets/form_button.dart';
import 'package:first_project/core/widgets/form_input.dart';
import 'package:first_project/view_model/image_generator/image_generator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            BlocBuilder<ImageGeneratorCubit, ImageGeneratorState>(
              builder: (context, state) {
                if (state is ImageGeneratorLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ImageGeneratorSError) {
                  return Center(
                    child: Text(state.error),
                  );
                } else if (state is ImageGeneratorSuccess) {
                  return SvgPicture.string(
                    state.avatar,
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
                  .read<ImageGeneratorCubit>()
                  .avatarUrl(nameController.text),
            ),
          ],
        ),
      ),
    );
  }
}
