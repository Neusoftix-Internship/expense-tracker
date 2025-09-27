import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';

class Itemincard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;
  const Itemincard({
    Key? key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
     required this.isSelected,
    required this.onTap,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap,
      child: Container(
        height: 88,
        width: 123.5,
        padding:  all(context, 20),
        decoration: BoxDecoration(
           color: isSelected ? kBlueColor :kVioletColor,
          borderRadius: BorderRadius.circular(h(context, 20)),
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
