
import 'package:flutter/material.dart';


class Error404Page extends StatelessWidget {
  const Error404Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Страница не найдена'),),
      body: const Center(
        child: Text('Ошибка 404', 
        style: TextStyle(
          fontWeight: FontWeight.w700, 
          color: Color.fromRGBO(255, 53, 50, 50),
          ),
          ),
        ),
    );
  }
}