import 'package:demo_flutter_cursor/core/ui/states/user_state_notifier.dart';
import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/i18n/translations.g.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/components/add_plant_form.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plant_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/widgets/plant_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlantsPage extends ConsumerStatefulWidget {
  const PlantsPage({super.key});

  @override
  ConsumerState<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends ConsumerState<PlantsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userState = ref.read(userStateNotifierProvider);
      if (userState.user != null) {
        ref.read(plantStateNotifierProvider.notifier)
            .loadUserPlants(userState.user.idOrThrow);
      }
    });
  }

  void _showAddPlantDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddPlantForm(
            onPlantAdded: () {
              Navigator.of(context).pop();
              final userState = ref.read(userStateNotifierProvider);
              if (userState.user != null) {
                ref.read(plantStateNotifierProvider.notifier)
                    .refresh(userState.user.idOrThrow);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final plantState = ref.watch(plantStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.plants.title),
        backgroundColor: context.colors.surface,
      ),
      body: plantState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : plantState.plants.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_florist,
                        size: 64,
                        color: context.colors.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.plants.empty_state,
                        style: context.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: plantState.plants.length,
                  itemBuilder: (context, index) {
                    return PlantListItem(plant: plantState.plants[index]);
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPlantDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
