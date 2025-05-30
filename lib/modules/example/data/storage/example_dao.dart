import 'dart:convert';

import 'package:demo_flutter_cursor/core/data/storage/key_value_storage.dart';
import 'package:demo_flutter_cursor/modules/example/data/storage/entity/example_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exampleDaoProvider = Provider<ExampleDao>((ref) {
  final keyValueStorage = ref.watch(keyValueStorageProvider);
  return ExampleDaoImpl(keyValueStorage: keyValueStorage);
});

abstract class ExampleDao {
  Future<void> save(ExampleEntity example);
  Future<ExampleEntity?> get(String id);
  Future<List<ExampleEntity>> getAll();
  Future<void> saveAll(List<ExampleEntity> examples);
  Future<void> delete(String id);
  Future<void> deleteAll();
}

class ExampleDaoImpl implements ExampleDao {
  final KeyValueStorage _keyValueStorage;
  static const String _examplePrefix = 'example_';
  static const String _examplesListKey = 'examples_list';

  ExampleDaoImpl({required KeyValueStorage keyValueStorage})
    : _keyValueStorage = keyValueStorage;

  @override
  Future<void> save(ExampleEntity example) async {
    final jsonString = jsonEncode(example.toJson());
    final key = _getKeyForId(example.id);
    await _keyValueStorage.setString(key, jsonString);

    // Update the list of example IDs
    final idsList = await _getExamplesIdsList();
    if (!idsList.contains(example.id)) {
      idsList.add(example.id);
      await _saveExamplesIdsList(idsList);
    }
  }

  @override
  Future<ExampleEntity?> get(String id) async {
    final key = _getKeyForId(id);
    final jsonString = _keyValueStorage.getString(key);

    if (jsonString == null) {
      return null;
    }

    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return ExampleEntity.fromJson(json);
  }

  @override
  Future<List<ExampleEntity>> getAll() async {
    final idsList = await _getExamplesIdsList();
    final examples = <ExampleEntity>[];

    for (final id in idsList) {
      final example = await get(id);
      if (example != null) {
        examples.add(example);
      }
    }

    return examples;
  }

  @override
  Future<void> saveAll(List<ExampleEntity> examples) async {
    final idsList = <String>[];

    for (final example in examples) {
      await save(example);
      idsList.add(example.id);
    }

    await _saveExamplesIdsList(idsList);
  }

  @override
  Future<void> delete(String id) async {
    final key = _getKeyForId(id);
    await _keyValueStorage.remove(key);

    // Update the list of example IDs
    final idsList = await _getExamplesIdsList();
    idsList.remove(id);
    await _saveExamplesIdsList(idsList);
  }

  @override
  Future<void> deleteAll() async {
    final idsList = await _getExamplesIdsList();

    for (final id in idsList) {
      final key = _getKeyForId(id);
      await _keyValueStorage.remove(key);
    }

    await _saveExamplesIdsList([]);
  }

  // Helper methods
  String _getKeyForId(String id) {
    return '$_examplePrefix$id';
  }

  Future<List<String>> _getExamplesIdsList() async {
    final jsonString = _keyValueStorage.getString(_examplesListKey);

    if (jsonString == null) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList.cast<String>();
    } catch (e) {
      // Log error or handle exception
      return [];
    }
  }

  Future<void> _saveExamplesIdsList(List<String> idsList) async {
    final jsonString = jsonEncode(idsList);
    await _keyValueStorage.setString(_examplesListKey, jsonString);
  }
}
