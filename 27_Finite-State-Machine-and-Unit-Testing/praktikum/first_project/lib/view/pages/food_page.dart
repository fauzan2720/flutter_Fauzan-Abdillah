import 'package:first_project/core/colors.dart';
import 'package:first_project/core/state.dart';
import 'package:first_project/model/food_model.dart';
import 'package:first_project/view_model/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  static const routeName = 'food_page';

  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
      ),
      body: Consumer<FoodProvider>(
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
              itemCount: value.foods.length,
              itemBuilder: (context, index) {
                FoodModel item = value.foods[index];
                return InkWell(
                  onTap: () {},
                  child: Card(
                    color: AppColors.card,
                    child: ListTile(
                      title: Text(item.name!),
                      subtitle: Text("ID: ${item.id}"),
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
