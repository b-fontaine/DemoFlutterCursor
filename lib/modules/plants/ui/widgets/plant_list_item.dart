import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:flutter/material.dart';

class PlantListItem extends StatelessWidget {
  final Plant plant;

  const PlantListItem({required this.plant, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.colors.primary,
          child: Icon(
            Icons.local_florist,
            color: context.colors.onPrimary,
          ),
        ),
        title: Text(
          plant.name,
          style: context.textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plant.species,
              style: context.textTheme.bodyMedium,
            ),
            if (plant.careNotes != null && plant.careNotes!.isNotEmpty)
              Text(
                plant.careNotes!,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.7),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        isThreeLine: plant.careNotes != null && plant.careNotes!.isNotEmpty,
      ),
    );
  }
}
