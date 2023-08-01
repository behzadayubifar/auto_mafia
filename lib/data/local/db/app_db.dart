import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:god_father/data/local/entity/entity.dart';
import 'package:god_father/model/role.dart';
import 'package:god_father/providers/player_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:developer' as devtools show log;

import 'package:provider/provider.dart';

part 'app_db.g.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'auto_mafia.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [
  Players,
])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Player>> getPlayers() async {
    return await select(players).get();
  }

  Future<Player> getPlayer(int id) async {
    return await (select(players)..where((p) => p.id.equals(id))).getSingle();
  }

  Future<bool> updatePlayer(PlayersCompanion player) async {
    return await update(players).replace(player);
  }

  Future<int> deletePlayer(int id) async {
    return await (delete(players)..where((p) => p.id.equals(id))).go();
  }

  Future<int> deleteAllPlayers() async {
    return await delete(players).go();
  }

  Future<int> insertPlayer(PlayersCompanion player) async {
    return await into(players).insert(player);
  }

  getPlayersStream() {
    return select(players).watch().listen((event) {
      event.log();
    });
//   }

//   final PlayerData playerData = Provider.of<PlayerData>;
// Map<String, Role> assignedRoles = playerData.assignedRoles;

//   void fillDatabaseWithInitialData() async {
//     final appDb = AppDb();

//     // Add your initial player data here
//     for (final player in ) {}
/*     final initialPlayers = [
      PlayersCompanion()
    ];

    for (final player in initialPlayers) {
      await appDb.insertPlayer(player);
    } */
  }
}
