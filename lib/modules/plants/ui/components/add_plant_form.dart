import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plant_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlantForm extends ConsumerStatefulWidget {
  final VoidCallback onPlantAdded;

  const AddPlantForm({required this.onPlantAdded, super.key});

  @override
  ConsumerState<AddPlantForm> createState() => _AddPlantFormState();
}

class _AddPlantFormState extends ConsumerState<AddPlantForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _careNotesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _careNotesController.dispose();
    super.dispose();
  }

  Future<void> _savePlant() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final userState = ref.read(userStateNotifierProvider);
    if (userState.user == null) {
      return;
    }

    await ref.read(plantStateNotifierProvider.notifier).addPlant(
      name: _nameController.text.trim(),
      species: _speciesController.text.trim(),
      careNotes: _careNotesController.text.trim().isEmpty 
          ? null 
          : _careNotesController.text.trim(),
      userId: userState.user.idOrThrow,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.plants.plant_saved)),
      );
      widget.onPlantAdded();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            t.plants.add_plant,
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: t.plants.plant_name,
              hintText: t.plants.name_hint,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return t.plants.name_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          TextFormField(
            controller: _speciesController,
            decoration: InputDecoration(
              labelText: t.plants.plant_species,
              hintText: t.plants.species_hint,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return t.plants.species_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          TextFormField(
            controller: _careNotesController,
            decoration: InputDecoration(
              labelText: t.plants.care_notes,
              hintText: t.plants.care_notes_hint,
              border: const OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(t.common.cancel),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _savePlant,
                child: Text(t.plants.save_plant),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
