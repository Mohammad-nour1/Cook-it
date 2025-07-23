import 'package:cookit/app/data/models/food_model.dart';
import 'package:flutter/material.dart';


class RecipeDetailsView extends StatelessWidget {
  final Food food;

  const RecipeDetailsView({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                food.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              food.description,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              "المكونات:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (var ingredient in food.ingredients)
              Text(
                "• $ingredient",
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 16),

            const Text(
              "طريقة التحضير:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              food.instructions,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            const Text(
              "نصائح إضافية:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "يمكنك إضافة توابل حسب الذوق. تأكد من تحضير المكونات بشكل جيد.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
