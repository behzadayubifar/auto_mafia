import 'package:flutter/material.dart';
import 'package:god_father/model/role.dart';
import '../data/local/db/app_db.dart';

class AppDbProvider extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<InCommonData> _playersListFuture = [];
  List<InCommonData> get playersListFuture => _playersListFuture;
  List<InCommonData> _playersListStream = [];
  List<InCommonData> get playersListStream => _playersListStream;
  List<String> _playersNameList = [];
  List<String> get playersNameList => _playersNameList;
  //
  Map<String, Role> assignedRolesFromDb = {};
  //
  List<String> get playersList => _playersNameList;
  // List<DoctorSectionData> _do
  String _error = '';
  String get error => _error;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

//
  Future<void> getPlayersNameList() async {
    _isLoading = true;
    try {
      _playersNameList = await _appDb!.getPlayersNamesList();
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      _isLoading = false;
    }
  }

  Future<void> getPlayersListFuture() async {
    _isLoading = true;
    try {
      _playersListFuture = await _appDb!.getAllPlayers();
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      _isLoading = false;
    }
  }

  void getPlayersListStream() {
    _isLoading = true;
    _appDb?.watchAllPlayers().listen((event) {
      _playersListStream = event;
    });
    _isLoading = false;
    notifyListeners();
  }

//get single player by role
  Future<InCommonData> getPlayerByRole(String role) async {
    try {
      return await _appDb!.getPlayerByRole(role);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      throw e;
    }
  }

  Future<void> insertPlayer(InCommonCompanion player) async {
    try {
      await _appDb!.insertPlayer(player);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> insertMultiplePlayers(List<InCommonCompanion> players) async {
    try {
      await _appDb!.insertMultiplePlayers(players);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deletePlayer(int id) async {
    try {
      await _appDb!.deletePlayer(id);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteAllPlayers() async {
    try {
      await _appDb!.deleteAllPlayers();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updatePlayer(InCommonCompanion player) async {
    try {
      await _appDb!.updatePlayer(player);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
