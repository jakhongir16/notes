import 'package:flutter/material.dart';
import 'package:notes_hive/domain/providers/notes_provider.dart';
import 'package:notes_hive/ui/app_navigator/app_navigator.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppNavigator.initRoute,
        routes: AppNavigator.routes,
        onGenerateRoute: AppNavigator.generate,
      ),
    );
  }
}