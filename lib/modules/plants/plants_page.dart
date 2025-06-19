import 'package:demo_flutter_cursor/core/ui/theme/extensions/theme_extension.dart';
import 'package:demo_flutter_cursor/i18n/strings.g.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/components/add_plant_form.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plants_state.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plants_state_notifier.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/widgets/plant_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlantsPage extends ConsumerStatefulWidget {
  static const routeName = 'plants';

  const PlantsPage({super.key});

  @override
  ConsumerState<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends ConsumerState<PlantsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(plantsStateNotifierProvider.notifier).loadPlants();
    });
  }

  void _showAddPlantDialog() {
    showDialog(
      context: context,
      builder: (context) => AddPlantForm(
        onPlantAdded: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.plants.plant_added)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(plantsStateNotifierProvider);
    final notifier = ref.read(plantsStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.plants.title, style: context.textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.refresh(),
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(state),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPlantDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(PlantsState state) {
    if (state.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(t.plants.loading, style: context.textTheme.bodyLarge),
          ],
        ),
      );
    }

    if (state.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colors.error,
            ),
            const SizedBox(height: 16),
            Text(
              t.plants.error_loading,
              style: context.textTheme.titleMedium,
            ),
            if (state.errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                state.errorMessage!,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => notifier.refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.isEmpty) {
      return Center(
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
              t.plants.no_plants,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              t.plants.add_first_plant,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.plants.length,
      itemBuilder: (context, index) {
        return PlantListItem(plant: state.plants[index]);
      },
    );
  }
}
