import 'package:flutter/material.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_images.dart';
import 'package:project_structure/constants/app_styling.dart';
import 'package:project_structure/view/widget/Custom_text_widget.dart';
import 'package:project_structure/view/widget/common_image_view_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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
          text: 'Total Expenses',
          size: 20,
          color: kBlackColor,
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2003, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),

                onDaySelected: (selectedDay, focusedDay) {},
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    color: kBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: kBlueColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(h(context, 16)),
                  ),
                  selectedDecoration: BoxDecoration(
                    color: kBlueColor,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: kRedColor),
                ),
              ),

              SizedBox(height: h(context, 20)),
              CommonImageView(
                imagePath: Assets.imagesLatestEntries,
                height: h(context,350),
                width: w(context, 350),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
