import 'package:drift/drift.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playerName => text().named('player_name')();
  TextColumn get roleName => text().named('role_name')();
  TextColumn get type => text().named('type')();
  IntColumn get heart => integer().named('heart')();
  BoolColumn get isBlocked => boolean().named('is_blocked')();
  BoolColumn get isReversible => boolean().named('is_reversible')();
  BoolColumn get isSaved => boolean().named('is_saved')();
  IntColumn get order => integer().named('order')();
  BoolColumn get isAlive => boolean().named('is_alive')();
  IntColumn get playerCode => integer().nullable().named('player_code')();

  IntColumn get nostradamousId => integer()
      .customConstraint('REFERENCES nostradamous_table(id)')
      .nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Nostradamous')
class NostradamousTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get playerId =>
      integer().customConstraint('REFERENCES players(id)')();
  TextColumn get selectedPlayerName => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class SingleProperties extends Table {}
