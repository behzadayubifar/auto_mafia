import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:god_father/data/local/entity/entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:developer' as devtools show log;

part 'app_db.g.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'auto_mafia.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [
  InCommon,
  KaneSection,
  KonstantinSection,
  DoctorSection,
  LeonSection,
  MafiaSection,
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

//
  Future<void> insertMultiplePlayers(List<InCommonCompanion> players) async {
    await batch((batch) {
      batch.insertAll(inCommon, players);
    });
  }

  //
  Future<int> insertPlayer(InCommonCompanion player) async {
    return await into(inCommon).insert(player);
  }

  //
  Future<List<InCommonData>> getAllPlayers() async {
    return await select(inCommon).get();
  }

  Future<InCommonData> getPlayerByRole(String role) async {
    return await (select(inCommon)..where((p) => p.roleName.equals(role)))
        .getSingle();
  }

  Future<bool> updatePlayer(InCommonCompanion playerRole) async {
    return await update(inCommon).replace(playerRole);
  }

  Future<int> deletePlayer(int id) async {
    return await (delete(inCommon)..where((p) => p.id.equals(id))).go();
  }

  Future<int> deleteAllPlayers() async {
    return await delete(inCommon).go();
  }

  Stream<List<InCommonData>> watchAllPlayers() {
    return select(inCommon).watch();
  }

  // write a method to retrieve players' names from inCommon table

  Future<List<String>> getPlayersNames() async {
    return await select(inCommon).map((row) => row.playerName).get();
  }
}
