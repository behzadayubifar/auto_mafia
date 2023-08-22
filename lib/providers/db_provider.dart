import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../data/local/db/app_db.dart';
import '../data/local/entity/entity.dart';

class AppDbProvider extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<InCommon> _playersListFuture = [];

  Future<void> insertPlayer(String playerName, String roleName) async {
    if (_appDb == null) {
      throw Exception('AppDb not initialized. Call initAppDb() first.');
    }

    // final player = PlayersCompanion(
    //   playerName: Value(playerName),
    //   roleName: Value(roleName),
    //   // Add other role-specific fields based on the role name
    // );
  }

  // Add other methods for updating, deleting, and querying data
}
