import 'package:flutter/material.dart';
import 'package:drift/drift.dart';
import '../data/local/db/app_db.dart';
import '../data/local/entity/entity.dart';

class AppDbProvider extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<InCommonData> _playersListFuture = [];
  List<InCommonData> get playersListFuture => _playersListFuture;
  List<InCommonData> _playersListStream = [];
  List<InCommonData> get playersListStream => _playersListStream;
  String _error = '';
  String get error => _error;

  Future<void> getPlayersListFuture() async {
    try {
      _playersListFuture = await _appDb!.getAllPlayers();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Stream<List<InCommonData>> getPlayersListStream() {
    return _appDb!.watchAllPlayers();
  }
}
