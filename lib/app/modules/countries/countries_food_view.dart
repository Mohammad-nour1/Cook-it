import 'package:cookit/app/data/models/food_model.dart';
import 'package:cookit/app/modules/recipe_details.dart';
import 'package:flutter/material.dart';


class CountriesFoodView extends StatelessWidget {
  final String countryName;

   CountriesFoodView({super.key, required this.countryName});

  final Map<String, List<Food>> foodMap = {
    'Egypt': [
      Food(
        name: 'كشري',
        image: 'assets/koshari.jpg',
        description: 'طبق شعبي مصري يحتوي على الأرز والمكرونة والعدس',
        ingredients: ['أرز', 'مكرونة', 'عدس', 'بصل', 'صلصة'],
        instructions: '1. قم بتحضير الأرز... 2. ثم أضف المكونات الأخرى...'
      ),
     
    ],
    'USA': [
      Food(
        name: 'برجر',
        image: 'assets/burger.jpg',
        description: 'شريحة لحم داخل خبز مع الخضار',
        ingredients: ['لحم', 'خبز', 'خضار'],
        instructions: '1. سخن الشواية... 2. ضع اللحم في الخبز...'
      ),
      
    ],
    
  };

  @override
  Widget build(BuildContext context) {
    final List<Food>? recipes = foodMap[countryName];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("$countryName Recipes"),
      ),
      body: recipes != null && recipes.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.7,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailsView(food: recipe),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            recipe.image,
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            recipe.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: Text("No recipes found for $countryName")),
    );
  }
}
