import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Middleware/constants/colors.dart';

class SearchCountry extends StatefulWidget {
  final List<Map<String, String>> items;
  SearchCountry({super.key, required this.items});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  String query = '';

  List<Map<String, String>> searchItem(String query) {
    return widget.items.where((item) {
      return item['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = searchItem(query);

    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search country...',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Update the selected country and close the bottom sheet
                  Navigator.of(context).pop(filteredItems[index]['name']);
                },
                child: Row(
                  children: [
                    Image.asset(
                      filteredItems[index]['imagePath']!,
                      width: 24.sp,
                      height: 24.sp,
                    ),
                    SizedBox(width: 14.sp),
                    Text(
                      filteredItems[index]['name']!,
                      style: GoogleFonts.roboto(
                        color: blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
