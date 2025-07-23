import 'package:card_swiper/card_swiper.dart';
import 'package:cookit/app/modules/countries/countries_food_view.dart';
import 'package:cookit/app/modules/countries/countries_view.dart';
import 'package:cookit/app/modules/search/search_view.dart';
import 'package:cookit/app/utils/themes/theme_controller.dart';
import 'package:cookit/app/utils/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> topDishes = [
    'assets/dish1.png',
    'assets/dish2.png',
    'assets/dish3.png',
  ];

  final List<Map<String, String>> egyptianDishes = [
    {
      'image': 'assets/egyptian_fatteh.png',
      'name': 'Egyptian Fatteh',
      'category': 'Main Course'
    },
    {'image': 'assets/mulukhiya.png', 'name': 'Mulukhiyah', 'category': 'Soup'},
    {
      'image': 'assets/shakshuka.png',
      'name': 'Shakshuka',
      'category': 'Breakfast'
    },
  ];

  RxInt currentIndex = 0.obs;

  void onTabChange(int index) {
    if (index != currentIndex.value) {
      currentIndex.value = index; 

      if (index == 0) {
        Get.off(() => HomeScreen()); 
      } else if (index == 1) {
        Get.off(() => SearchView()); 
      } else if (index == 2) {
        Get.off(() => CountriesView()); 
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Confirm Exit"),
            content: const Text("Press again to exit the app."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.orange), 
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.orange), 
                child: const Text("Exit"),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: themeController.currentTheme.colorScheme.secondary,
          title: Text(
            "Cookit App",
            style: TextStyle(
              color: themeController.currentTheme.colorScheme.onPrimary,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,
                  color: themeController.currentTheme.colorScheme.onPrimary),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: Obx(() => Drawer(
              child: Container(
                color: themeController.currentTheme.colorScheme.background,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                themeController.isDarkMode.value
                                    ? 'assets/dark.jpg'
                                    : 'assets/light.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              color: themeController
                                  .currentTheme.colorScheme.onPrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        themeController.isDarkMode.value
                            ? 'Switch to Light Mode'
                            : 'Switch to Dark Mode',
                        style: TextStyle(
                            color: themeController
                                .currentTheme.colorScheme.onBackground),
                      ),
                      trailing: Switch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                        activeColor:
                            themeController.currentTheme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 360,
                child: Swiper(
                  itemCount: topDishes.length,
                  itemWidth: 265,
                  itemHeight: 300,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor:
                          themeController.currentTheme.colorScheme.secondary,
                      size: 8.0,
                      activeSize: 10.0,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 225,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(topDishes[index]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 186, 85)
                                  .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(
                                  12), 
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dish Name", 
                                  style: TextStyle(
                                    color: themeController
                                        .currentTheme.colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "Category: Main Course", 
                                  style: TextStyle(
                                    color: themeController
                                        .currentTheme.colorScheme.onSurface,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Egyptian Food",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            themeController.currentTheme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => CountriesFoodView(countryName: 'Egypt'));
                      },
                      child: Row(
                        children: [
                          Text(
                            "See More",
                            style: TextStyle(
                                color: themeController
                                    .currentTheme.colorScheme.secondary),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 16,
                              color: themeController
                                  .currentTheme.colorScheme.secondary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: egyptianDishes.length,
                  itemBuilder: (context, index) {
                    final dish = egyptianDishes[index];
                    return Container(
                      width: 142,
                      margin: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(dish['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 186, 85)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                  12), 
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dish['name']!,
                                  style: TextStyle(
                                    color: themeController
                                        .currentTheme.colorScheme.onSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Category: ${dish['category']}",
                                  style: TextStyle(
                                    color: themeController
                                        .currentTheme.colorScheme.onSecondary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex.value, 
          onTabChange: onTabChange,
        ),
      ),
    );
  }
}
