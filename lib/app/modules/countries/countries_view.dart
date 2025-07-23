import 'package:cookit/app/modules/countries/countries_food_view.dart';
import 'package:cookit/app/modules/home/home_view.dart';
import 'package:cookit/app/modules/search/search_view.dart';
import 'package:cookit/app/utils/themes/theme_controller.dart';
import 'package:cookit/app/utils/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesView extends StatelessWidget {
  final List<String> countries = [
    'Egypt',
    'USA',
    'France',
    'Germany',
    'Italy',
    'Spain',
    'Japan',
    'China',
    'Brazil',
    'India'
  ];

  final RxInt currentIndex = 2.obs;

  void onTabChange(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index; 

      if (index == 0) {
        Get.off(() => HomeScreen());
      } else if (index == 1) {
        Get.off(() => SearchView());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:
            Get.find<ThemeController>().currentTheme.colorScheme.secondary,
        title: Text(
          "Choose Country",
          style: TextStyle(
            color:
                Get.find<ThemeController>().currentTheme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CountriesFoodView(
                      countryName: countries[index],
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                color: theme.colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 30, color: theme.colorScheme.onSecondary),
                      SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          countries[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 20, color: theme.colorScheme.onSecondary),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex.value, 
        onTabChange: onTabChange,
      ),
    );
  }
}
