import 'package:drift/drift.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playerName => text()();
  TextColumn get roleName => text()(); // Column for role name

  // Role-specific fields as nullable columns
  TextColumn get kaneRightChoice => text().nullable()();
  IntColumn get nightOfCorrectChoice => integer().nullable()();
  BoolColumn get kaneActionDone => boolean().nullable()();
  BoolColumn get kaneMustBeOut => boolean().nullable()();

  TextColumn get nightOfReturning => text().nullable()();
  BoolColumn get konstantinActionDone => boolean().nullable()();

  IntColumn get nightOfSavingDoctor => integer().nullable()();
  BoolColumn get isDoctorSavedOnce => boolean().nullable()();

  TextColumn get whoIsBlockedLastNight => text().nullable()();
  IntColumn get lastNight => integer().nullable()();
  IntColumn get mafiaBullet => integer().nullable()();
  BoolColumn get mfiaHasShot => boolean().nullable()();

  TextColumn get leonHasShot => text().nullable()();
  IntColumn get leonBullets => integer().nullable()();
  BoolColumn get leonWrongShot => boolean().nullable()();

  IntColumn get playerCode => integer().nullable()();
  IntColumn get nostradamousId => integer().nullable()();
  IntColumn get order => integer()();
  BoolColumn get isAlive => boolean()();
  BoolColumn get isBlocked => boolean()();
  BoolColumn get isReversible => boolean()();
  BoolColumn get isSaved => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
