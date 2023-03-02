

import 'package:flutter/material.dart';
import 'package:notes_hive/ui/theme/app_colors.dart';
import 'package:notes_hive/ui/theme/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key, 
    this.title = '', 
    this.text = '', 
    this.data = '', 
    required this.index, 
    });
    
  final String title, text, data;
  final int index;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(title, style: AppStyle.fontStyle.copyWith(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            
            ),
            ),
            const SizedBox(height: 5,),
            Text(data, style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.lightGrey,
              
              
            ),
            
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textGrey,
              ),
            ),
          ],
          ),
      ),
    );
  }
}