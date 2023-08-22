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

  Future<List<InCommonData>> getPlayers() async {
    return await select(inCommon).get();
  }

  Future<InCommonData> getPlayer(int id) async {
    return await (select(inCommon)..where((p) => p.id.equals(id))).getSingle();
  }

  // Future<bool> updatePlayer(PlayersCompanion player) async {
  //   return await update(players).replace(player);
  // }

  // Future<int> deletePlayer(int id) async {
  //   return await (delete(players)..where((p) => p.id.equals(id))).go();
  // }

  // Future<int> deleteAllPlayers() async {
  //   return await delete(players).go();
  // }

  // Future<int> insertPlayer(PlayersCompanion player) async {
  //   return await into(players).insert(player);
  // }

  // getPlayersStream() {
  //   return select(players).watch().listen((event) {
  //     event.log();
  //   });
  // }
}
