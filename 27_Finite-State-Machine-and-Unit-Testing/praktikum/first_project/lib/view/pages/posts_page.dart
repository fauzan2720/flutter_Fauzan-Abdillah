import 'package:first_project/core/colors.dart';
import 'package:first_project/core/state.dart';
import 'package:first_project/model/post_model.dart';
import 'package:first_project/view_model/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatelessWidget {
  static const routeName = 'posts_page';

  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Consumer<PostProvider>(
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
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              reverse: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                PostModel item = value.posts[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                    color: AppColors.card,
                    child: ListTile(
                      title: Text(item.title!),
                      subtitle: Text(item.body!),
                      trailing: IconButton(
                        onPressed: () =>
                            context.read<PostProvider>().updatePost(item.id!),
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
