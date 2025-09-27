import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';

class CustomLatestEntryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String amount;
  final String vat;

  const CustomLatestEntryTile({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.vat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding:  all(context, 10),
            decoration: BoxDecoration(
              color: kGreyColor,
              borderRadius: BorderRadius.circular(h(context, 12)),
            ),
            child: Icon(icon, size: 24, color: kBlackColor),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date, style: TextStyle(fontSize: 16, color: kGreyColor)),
              ],
            ),
          ),

          Row(
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: amount.contains('-') ? kBlackColor : kBlackColor,
                ),
              ),
              Text(
                " + VAT $vat",
                style: TextStyle(fontSize: 16, color: kBlackColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
