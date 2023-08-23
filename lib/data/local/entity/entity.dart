import 'package:drift/drift.dart';

class InCommon extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get playerName => text()();
  TextColumn get roleName => text()(); // Column for role name
  IntColumn get heart => integer()();
  BoolColumn get isSaved => boolean().nullable()();
  TextColumn get type => text()();
  IntColumn get playerCode => integer().nullable()();
  IntColumn get order => integer()();
  BoolColumn get isAlive => boolean().withDefault(const Constant(true))();
  BoolColumn get isBlocked => boolean().nullable()();
  BoolColumn get isReversible => boolean().nullable()();
  BoolColumn get handCuffed => boolean().nullable()();
}

// Role-specific fields as nullable columns

// Kane
class KaneSection extends Table {
  IntColumn get id => integer().references(InCommon, #id)();
  TextColumn get kaneRightChoice =>
      text().nullable().withDefault(const Constant(''))();
  IntColumn get nightOfCorrectChoice => integer().nullable()();
  BoolColumn get kaneActionDone => boolean().nullable()();
  BoolColumn get kaneMustBeOut => boolean().nullable()();
}

// Konstantin
class KonstantinSection extends Table {
  IntColumn get id => integer().references(InCommon, #id)();
  TextColumn get nightOfReturning => text().nullable()();
  BoolColumn get konstantinActionDone => boolean().nullable()();
}

// Doctor
class DoctorSection extends Table {
  IntColumn get id => integer().references(InCommon, #id)();
  IntColumn get nightOfSavingDoctor => integer().nullable()();
  BoolColumn get isDoctorSavedOnce => boolean().nullable()();
}

// Leon
class LeonSection extends Table {
  IntColumn get id => integer().references(InCommon, #id)();
  TextColumn get leonHasShot => text().nullable()();
  IntColumn get leonBullets => integer().withDefault(const Constant(2))();
  BoolColumn get leonWrongShot => boolean().nullable()();
}

// Mafia
class MafiaSection extends Table {
  TextColumn get whoIsBlockedLastNight => text().nullable()();
  IntColumn get mafiaBullet => integer().withDefault(const Constant(1))();
  BoolColumn get mfiaHasShot => boolean().nullable()();
  // IntColumn get lastNight => integer().nullable()();
}
