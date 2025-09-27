import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';
import 'package:project_structure/view/widget/Custom_text_widget.dart';
import 'package:project_structure/view/widget/itemincard.dart';
import 'package:project_structure/view/widget/latest_entries_widget.dart';

class Addscreen extends StatefulWidget {
  Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  int selectedIndexes = 0;

  final List<Map<String, dynamic>> latestentries = [
    {
      'icon': Icons.monetization_on_outlined,
      'title': 'Salary',
      'date': '20 Feb 2024',
      'amount': '+ \$20',
      'vat': '0.5%',
    },

    {
      'icon': Icons.monetization_on_sharp,
      'title': "Cashback",
      'date': "13 Mar 2024",
      'amount': "- \$18",
      'vat': "0.8%",
    },
    {
      'icon': Icons.money_off_csred_outlined,
      'title': "Price Money",
      'date': "11 Mar 2024",
      'amount': "- \$400",
      'vat': "0.12%",
    },
  ];

  final List<Map<String, dynamic>> cardsItems = [
    {
      'title': 'Add wage',
      'icon': Icons.wallet,
      'backgroundColor': kVioletColor,
    },
    {
      'title': 'Add Expen',
      'icon': Icons.wallet,
      'backgroundColor': kBlueColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new, color: kBlackColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: CustomText(
          text: 'Add',
          size: 20,
          color: kBlackColor,
          weight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: all(context, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DottedBorder(
                  options: RectDottedBorderOptions(
                    dashPattern: [6, 6],
                    strokeWidth: 1,
                    color: kGreyColor,
                    padding: all(context, 24),
                  ),
                  child: Center(
                    child: SizedBox(
                      height: h(context, 70),
                      width: w(context, 20),
                      child:  Icon(Icons.add, color: kGreyColor, size: 28),
                    ),
                  ),
                ),
              SizedBox(width: w(context, 16)),

                Expanded(
                  child: SizedBox(
                    height: h(context, 120),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cardsItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: only(context, right: 15),
                          child: Itemincard(
                            icon: cardsItems[index]['icon'],
                            title: cardsItems[index]["title"],
                            backgroundColor:
                                cardsItems[index]['backgroundColor'],
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
                ),
              ],
            ),

            SizedBox(height: h(context, 40)),
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
                SizedBox(height: h(context, 30)),
                SizedBox(
                  height: h(context, 170),
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
    );
  }
}
