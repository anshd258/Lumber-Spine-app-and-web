import 'package:data_hub/Middleware/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({super.key});

  @override
  State<CountryDropdown> createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? _selected = 'Canada';
  String? _selectedFlag = 'assets/flags/canada.png';

  final List<Map<String, String>> items = [
    {'name': 'United Kingdom', 'imagePath': 'assets/flags/uk.png'},
    {'name': 'Singapore', 'imagePath': 'assets/flags/singapore.png'},
    {'name': 'Canada', 'imagePath': 'assets/flags/canada.png'},
    {'name': 'China', 'imagePath': 'assets/flags/china.png'},
    {'name': 'Netherland', 'imagePath': 'assets/flags/netherlands.png'},
    {'name': 'Indonesia', 'imagePath': 'assets/flags/indonesia.png'},
  ];

  String query = '';

  List<Map<String, String>> searchItem(String query) {
    return items.where((item) {
      return item['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: GestureDetector(
        onTap: () => showModal(context),
        child: Row(
          children: <Widget>[
            Image.asset(
              _selectedFlag.toString(),
              width: 24.sp,
              height: 24.sp,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              _selected.toString(),
              style: GoogleFonts.roboto(
                color: blue,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: darkerGrey,
              size: 21.sp,
            ),
          ],
        ),
      ),
    );
  }

  void showModal(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Container(
            padding: EdgeInsets.all(20.sp),
            alignment: Alignment.topRight,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.roboto(),
                      icon: Icon(Icons.search, size: 22.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchItem(query).length,
                    itemBuilder: (context, index) {
                      final country = searchItem(query)[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = country['name'];
                                _selectedFlag = country['imagePath'];
                              });
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  country['imagePath'].toString(),
                                  width: 24.sp,
                                  height: 24.sp,
                                ),
                                SizedBox(width: 14.sp),
                                Text(
                                  country['name'].toString(),
                                  style: GoogleFonts.roboto(
                                    color: blue,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
