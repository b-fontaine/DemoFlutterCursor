import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class DateInfoTile extends StatelessWidget {
  final String title;
  final DateTime date;

  const DateInfoTile({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.bodyMedium),
        Text(formattedDate, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
