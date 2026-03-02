import 'package:flutter/material.dart';
import 'package:timelens/core/utils/app_colors.dart';
import 'package:timelens/features/weather/domain/entities/location_entity.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({super.key, required this.location, required this.onTap});

  final LocationEntity location;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.blurColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(
          Icons.location_city_rounded,
          size: 32,
          color: AppColors.brownWriting,
        ),
        title: Text(
          location.locationName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.brownWriting,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              location.country,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.brownWriting,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Lat: ${location.lat}, Long: ${location.lon}",
              style:
                  const TextStyle(fontSize: 14, color: AppColors.brownWriting),
            ),
          ],
        ),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}
