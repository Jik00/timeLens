import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pick_country_picker/pick_country_picker.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/core/utils/context_extensions.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker(
      {super.key, required this.country, required this.onChanged});

  final String country;
  final ValueChanged<String> onChanged;

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String? chosenCounty;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCountryPicker(context),
      child: SizedBox(
        width: 300.w,
        child: Text(
          chosenCounty ?? widget.country,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.brownWriting,
          ),
        ),
      ),
    );
  }

  void showCountryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
            color: AppColors.parchment,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            border: Border.all(
              color: AppColors.primaryColor,
              width: 1.5.w,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: Theme(
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: AppColors.brownWriting,
                      displayColor: AppColors.brownWriting,
                    ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintStyle: TextStyle(
                      color:
                          AppColors.brownWriting.withAlpha(153)), // 60% opacity
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.brownWriting),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.brownWriting),
                  ),
                ),
                iconTheme: IconThemeData(color: AppColors.brownWriting),
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: AppColors.primaryColor,
                      onSurface: AppColors.brownWriting,
                    ),
              ),
              child: CountryPickerModal(
                onCountryChanged: (Country country) {
                  debugPrint("Selected: ${country.countryName}");
                  widget.onChanged(country.countryName);
                  setState(() {
                    chosenCounty = country.countryName;
                  });
                  Navigator.pop(context);
                },
                placeholderText: context.loc.selectCountry,
                selectedCountryCode: 'EG',
                priorityCountryCodes: const ['EG', 'US', 'GB', 'SA'],
                hideSearch: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
