import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cookit/app/utils/themes/theme.dart'; 

class ThemeController extends GetxController {
  
  var isDarkMode = false.obs; 


  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  
  ThemeData get currentTheme => isDarkMode.value ? darkMood : lightMood;
}
