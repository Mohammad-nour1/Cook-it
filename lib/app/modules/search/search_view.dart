import 'package:cookit/app/modules/countries/countries_view.dart';
import 'package:cookit/app/utils/themes/theme_controller.dart';
import 'package:cookit/app/utils/widgets/custom_bottom_navbar.dart';
import 'package:cookit/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; 

class SearchView extends StatelessWidget {
  final RxInt currentIndex = 1.obs;
  final TextEditingController searchController = TextEditingController();

  void onTabChange(int index) {
    currentIndex.value = index; 
    if (index == 0) {
      Get.off(() => HomeScreen());
    } else if (index == 2) {
      Get.to(() => CountriesView()); 
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSearching = false;
    bool searchError = false;

    void onSearch() {
      isSearching = true;
      searchError = false; 

      Future.delayed(Duration(seconds: 2), () {
        isSearching = false;
        if (searchController.text.isEmpty) {
          searchError = true;
        } else {
          searchError = false;
        }
      });
    }

    return Scaffold(
      backgroundColor:
          theme.colorScheme.surface, 
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search Page',
          style: TextStyle(
              color: Get.find<ThemeController>()
                  .currentTheme
                  .colorScheme
                  .onPrimary),
        ),
        backgroundColor:
            Get.find<ThemeController>().currentTheme.colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search for a dish...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: onSearch, 
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Lottie.asset(
                  isSearching
                      ? 'assets/search_view.json' 
                      : (searchError
                          ? 'assets/searching_error.json'
                          : 'assets/search_view.json'), 
                  width: 350,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex.value, 
        onTabChange: onTabChange,
      ),
    );
  }
}
