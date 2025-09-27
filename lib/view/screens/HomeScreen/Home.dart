import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_images.dart';
import 'package:project_structure/constants/app_styling.dart';
import 'package:project_structure/view/widget/Custom_text_widget.dart';
import 'package:project_structure/view/widget/card.dart';
import 'package:project_structure/view/widget/common_image_view_widget.dart';
import 'package:project_structure/view/widget/latest_entries_widget.dart';
import 'package:project_structure/view/widget/selectableitem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int selectedIndexes = 0;

  final List<Map<String, dynamic>> options = [
    {'title': 'Savings', 'icon': Icons.add},
    {'title': 'Remind', 'icon': Icons.notifications},
    {'title': 'Budget', 'icon': Icons.money},
  ];
  final List<Map<String, dynamic>> cardsItems = [
    {
      'title': 'Hourly wages',
      'icon': Icons.wallet,
      'value': '\$1289.38',
      'backgroundColor': kVioletColor,
    },
    {
      'title': 'Monthly wages',
      'icon': Icons.wallet,
      'value': '\$298.16',
      'backgroundColor': kBlueColor,
    },
  ];
  final List<Map<String, dynamic>> latestentries = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'date': '20 Feb 2024',
      'amount': '+ \$20',
      'vat': '0.5%',
    },

    {
      'icon': Icons.directions_bike,
      'title': "Uber",
      'date': "13 Mar 2024",
      'amount': "- \$18",
      'vat': "0.8%",
    },
    {
      'icon': Icons.shopping_bag,
      'title': "Shopping",
      'date': "11 Mar 2024",
      'amount': "- \$400",
      'vat': "0.12%",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: all(context, 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Dashboard',
                    size: 24,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.left,
                    color: kBlackColor,
                  ),
                  Spacer(),
                  Container(
                    height: h(context, 40),
                    width: w(context, 40),
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.circular(h(context, 16)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h(context, 20)),

              CommonImageView(
                imagePath: Assets.imagesSaving,
                height: h(context, 160),
                width: w(context, 160),
                fit: BoxFit.contain,
              ),

              SizedBox(height: h(context, 20)),

              CustomText(
                text: 'Total Earning of the Month',
                size: 20,
                weight: FontWeight.bold,
                color: kBlackColor,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: h(context, 20)),

              SizedBox(
                height: h(context, 120),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardsItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: only(context, right: 20),
                      child: Carditems(
                        icon: cardsItems[index]['icon'],
                        title: cardsItems[index]["title"],
                        value: cardsItems[index]['value'],
                        backgroundColor: cardsItems[index]['backgroundColor'],
                        isSelected: selectedIndexes == index,
                        onTap: () {
                          setState(() {
                            selectedIndexes = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: h(context, 40)),

              SizedBox(
                height: h(context, 40),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return SelectableItem(
                      label: options[index]['title'],
                      icon: options[index]['icon'],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: h(context, 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h(context, 5),
                      width: w(context, 15),
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(h(context, 15)),
                      ),
                    ),
                  ),
                  SizedBox(width: w(context, 10)),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h(context, 5),
                      width: w(context, 15),
                      decoration: BoxDecoration(
                        color: kVioletColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(h(context, 15)),
                      ),
                    ),
                  ),
                  SizedBox(width: w(context, 10)),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: h(context, 5),
                      width: w(context, 15),
                      decoration: BoxDecoration(
                        color: kVioletColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(h(context, 15)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h(context, 30)),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "Latest Entries",
                        size: 24,
                        weight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                      Spacer(),
                      Icon(
                        Icons.more_horiz_outlined,
                        color: kBlackColor2,
                        size: 30,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: h(context,250),
                    child: ListView.builder(
                      itemCount: latestentries.length,
                      itemBuilder: (context, index) {
                        return CustomLatestEntryTile(
                          icon: latestentries[index]['icon'],
                          title: latestentries[index]["title"],
                          date: latestentries[index]['date'],
                          amount: latestentries[index]['amount'],
                          vat: latestentries[index]['vat'],
                        );
                      },
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
