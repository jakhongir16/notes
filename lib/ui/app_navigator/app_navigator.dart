import 'package:flutter/material.dart';
import 'package:notes_hive/ui/app_navigator/app_routes.dart';
import 'package:notes_hive/ui/pages/add_notes_page/app_notes_page.dart';
import 'package:notes_hive/ui/pages/change_notes_page/change_notes_page.dart';
import 'package:notes_hive/ui/pages/error_404_page/error_404_page.dart';
import 'package:notes_hive/ui/pages/search_notes_page/search_notes_page.dart';

import '../pages/home_page/home_page.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;
  
  static Map<String, WidgetBuilder> get routes{
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotesPage(),
      AppRoutes.changeNotes: (_) => const ChangeNotesPage(),
      AppRoutes.searchNotes: (_) => const SearchNotesPage(),
      
      
      
      
    };
  }
  
  
  static Route generate(RouteSettings settings){
    final setting = RouteSettings(
      name: '/404', 
      arguments: settings.arguments
      
      );
      
     return MaterialPageRoute(
      settings: setting,
      builder: (_)=> const Error404Page(),
      );
    
    
  }
  
  
  
  
  
}