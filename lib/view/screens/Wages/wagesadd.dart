import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_structure/view/screens/auth/login/login.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:project_structure/constants/app_colors.dart';
import 'package:project_structure/constants/app_styling.dart';
import 'package:project_structure/view/widget/Custom_text_widget.dart';
import 'package:project_structure/view/widget/wagesfield.dart';

class Wagesadd extends StatefulWidget {
  const Wagesadd({Key? key}) : super(key: key);

  @override
  State<Wagesadd> createState() => _WagesaddState();
}

class _WagesaddState extends State<Wagesadd> {
  final List<Map<String, dynamic>> fields = [
    {"title": "Income Title", "type": TextInputType.text},
    {"title": "Working Hour", "type": TextInputType.number},
    {"title": "Wage Type", "type": TextInputType.text},
    {"title": "Hourly Wage", "type": TextInputType.number},
  ];

  final List<String> currencies = [
    'Pakistan PKR',
    'Brazil Real',
    'Ireland EURO',
    'Iran Rial',
    'Japan Yen',
    'Indonesia Rupiah',
    'India Indian Rupees',
    'Bangladesh Taka',
    'Afghanistan Afghani',
    'Armenia Dram',
  ];

  String selectedCategory = 'Salary';
  String? selectedCurrency;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: kBlackColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text: 'Add Wages',
                  size: 20,
                  color: kBlackColor,
                  weight: FontWeight.bold,
                ),
                SizedBox(width: w(context, 40)),
                CustomText(
                  text: 'Default Currency',
                  size: 12,
                  color: kGreyColor,
                  weight: FontWeight.bold,
                ),
                SizedBox(width: w(context, 3)),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: kGreyColor,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(h(context, 16)),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: h(context, 400),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: all(context,16),
                                decoration:  BoxDecoration(
                                  color: kBlueColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(h(context, 16)),
                                  ),
                                ),
                                child: CustomText(
                                  text: 'Select Currency',
                                  textAlign: TextAlign.center,
                                  color: kPrimaryColor,
                                  size: 18,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(h(context, 12)),
                                child: CustomText(
                                  text: "Currency Type",
                                  size: 16,
                                  weight: FontWeight.bold,
                                  color: kGreyColor,
                                ),
                              ),
                              Padding(
                                padding: symmetric(context, horizontal: 12),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search currency',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        h(context, 8),
                                      ),
                                    ),
                                    contentPadding: symmetric(context, horizontal: 12)
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      searchText = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: h(context, 8)),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: currencies.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(currencies[index]),
                                      onTap: () {
                                        setState(() {
                                          selectedCurrency = currencies[index];
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            if (selectedCurrency != null)
              Padding(
                padding: only(context, right: 20),
                child: Text(
                  selectedCurrency!,
                  style: TextStyle(fontSize: 13, color: kGreyColor),
                ),
              ),
          ],
        ),
      ),
      body: Padding(
        padding: all(context, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  selectedDecoration:  BoxDecoration(
                    color: kBlueColor,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle:  TextStyle(color: kRedColor),
                ),
              ),
              SizedBox(height: h(context, 24)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(fields.length, (index) {
                  var field = fields[index];
                  return Padding(
                    padding:only(context, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          field['title'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kGreyColor,
                          ),
                        ),
                        SizedBox(height: h(context, 6)),
                        Wagesfield(hintText: '', inputType: field['type']),
                      ],
                    ),
                  );
                }),
              ),
              CustomText(
                text: "Income Category",
                size: 18,
                weight: FontWeight.w600,
                color: kGreyColor,
              ),
              SizedBox(height: h(context, 12)),

              Row(
                children: [
                  DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [6, 6],
                      strokeWidth: 1,
                      color: kGreyColor,
                      padding: all(context, 16),
                    ),
                    child: Icon(Icons.add, color: kGreyColor, size: 20,)
                  ),

                  SizedBox(width: w(context, 16)),

                  GestureDetector(
                    onTap: () => setState(() => selectedCategory = 'Salary'),
                    child: Container(
                      padding: symmetric(context, horizontal: 28, vertical: 16),
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Salary'
                            ? kBlueColor
                            : kVioletColor,
                        borderRadius: BorderRadius.circular(h(context, 12)),
                      ),
                      child: CustomText(
                        text: 'Salary',
                        size: 16,
                        weight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),
                  ),

                  SizedBox(width: w(context, 16)),

                  GestureDetector(
                    onTap: () => setState(() => selectedCategory = 'Rewards'),
                    child: Container(
                      padding:  symmetric(context, horizontal: 28, vertical: 16),
                      decoration: BoxDecoration(
                        color: selectedCategory == 'Rewards'
                            ? kBlueColor
                            : kVioletColor,
                        borderRadius: BorderRadius.circular(h(context, 12)),
                      ),
                      child: CustomText(
                        text: 'Rewards',
                        size: 16,
                        weight: FontWeight.bold,
                        color: kBlackColor2,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h(context, 40)),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Container(
                  height: h(context, 56),
                  width: w(context, 343),
                  decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.circular(h(context, 15)),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Add',
                      size: 24,
                      weight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
