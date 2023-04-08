import 'package:first_project/core/colors.dart';
import 'package:first_project/core/extensions/string_ext.dart';
import 'package:first_project/model/post_model.dart';
import 'package:first_project/view_model/post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  static const routeName = 'posts_page';

  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostSError) {
            state.error.failedBar(context);
          } else if (state is PostSuccess) {
            "Berhasil".succeedBar(context);
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostSError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is PostSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              reverse: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                PostModel item = state.data[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                    color: AppColors.card,
                    child: ListTile(
                      title: Text(item.title!),
                      subtitle: Text(item.body!),
                      trailing: IconButton(
                        onPressed: () =>
                            context.read<PostCubit>().updatePost(item.id!),
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
