import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';
class SelectableItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
   final IconData? icon;

  const SelectableItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? kBlueColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(h(context, 12)),
          border: Border.all(
            color: isSelected ? kBlueColor : Colors.grey,
            width: 2,
          ),
        ),
        child: Row(
          
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 20,
                color: kBlackColor,
              ),
               SizedBox(width: w(context, 4)),
          
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class HorizontalSelectableList extends StatefulWidget {
  const HorizontalSelectableList({super.key});

  @override
  State<HorizontalSelectableList> createState() =>
      _HorizontalSelectableListState();
}

class _HorizontalSelectableListState extends State<HorizontalSelectableList> {
  int selectedIndex = 0; 

  final List<String> items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SelectableItem(
            label: items[index],
             
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}    

