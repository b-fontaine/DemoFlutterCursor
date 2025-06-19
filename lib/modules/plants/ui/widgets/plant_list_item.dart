import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/widgets/plant_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlantListItem extends StatelessWidget {
  final Plant plant;

  const PlantListItem({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return PlantContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_florist,
                color: context.colors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      plant.type,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (plant.description != null) ...[
            const SizedBox(height: 12),
            Text(
              plant.description!,
              style: context.textTheme.bodyMedium,
            ),
          ],
          if (plant.creationDate != null) ...[
            const SizedBox(height: 12),
            Text(
              'Added ${DateFormat.yMMMd().format(plant.creationDate!)}',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
