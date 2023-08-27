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
  String _selected = 'Canada';
  final List<String> _items = [
    'United Kingdom',
    'Singapore',
    'Canada',
    'China',
    'Netherland',
    'Indonesia'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _selected,
            style: GoogleFonts.roboto(
              color: blue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => showModal(context),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: darkerGrey,
              size: 21.sp,
            ),
          ),
        ],
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
                maxHeight: MediaQuery.of(context).size.height * 0.7),
            child: Container(
              padding: EdgeInsets.all(20.sp),
              alignment: Alignment.topRight,
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            child: Text(
                              _items[index],
                              style: GoogleFonts.roboto(
                                color: blue,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selected = _items[index];
                              });
                              Navigator.of(context).pop();
                            }),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    );
                  }),
            ),
          );
        });
  }
}
