import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';

class Carditems extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color backgroundColor;
  final bool isSelected;
  final VoidCallback onTap;
  const Carditems({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.backgroundColor,
     required this.isSelected,
    required this.onTap,
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap,
      child: Container(
        padding:  all(context, 12),
        decoration: BoxDecoration(
           color: isSelected ? kBlueColor :kVioletColor,
          borderRadius: BorderRadius.circular(h(context, 12)),
          boxShadow: [
            BoxShadow(
              color: kBlackColor,
              blurRadius: 4,
            ),
          ],
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
             SizedBox(height: 12,),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
