// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _playerNameMeta =
      const VerificationMeta('playerName');
  @override
  late final GeneratedColumn<String> playerName = GeneratedColumn<String>(
      'player_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleNameMeta =
      const VerificationMeta('roleName');
  @override
  late final GeneratedColumn<String> roleName = GeneratedColumn<String>(
      'role_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kaneRightChoiceMeta =
      const VerificationMeta('kaneRightChoice');
  @override
  late final GeneratedColumn<String> kaneRightChoice = GeneratedColumn<String>(
      'kane_right_choice', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nightOfCorrectChoiceMeta =
      const VerificationMeta('nightOfCorrectChoice');
  @override
  late final GeneratedColumn<int> nightOfCorrectChoice = GeneratedColumn<int>(
      'night_of_correct_choice', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _kaneActionDoneMeta =
      const VerificationMeta('kaneActionDone');
  @override
  late final GeneratedColumn<bool> kaneActionDone =
      GeneratedColumn<bool>('kane_action_done', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("kane_action_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _kaneMustBeOutMeta =
      const VerificationMeta('kaneMustBeOut');
  @override
  late final GeneratedColumn<bool> kaneMustBeOut =
      GeneratedColumn<bool>('kane_must_be_out', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("kane_must_be_out" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _nightOfReturningMeta =
      const VerificationMeta('nightOfReturning');
  @override
  late final GeneratedColumn<String> nightOfReturning = GeneratedColumn<String>(
      'night_of_returning', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _konstantinActionDoneMeta =
      const VerificationMeta('konstantinActionDone');
  @override
  late final GeneratedColumn<bool> konstantinActionDone =
      GeneratedColumn<bool>('konstantin_action_done', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("konstantin_action_done" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _nightOfSavingDoctorMeta =
      const VerificationMeta('nightOfSavingDoctor');
  @override
  late final GeneratedColumn<int> nightOfSavingDoctor = GeneratedColumn<int>(
      'night_of_saving_doctor', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isDoctorSavedOnceMeta =
      const VerificationMeta('isDoctorSavedOnce');
  @override
  late final GeneratedColumn<bool> isDoctorSavedOnce =
      GeneratedColumn<bool>('is_doctor_saved_once', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_doctor_saved_once" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _whoIsBlockedLastNightMeta =
      const VerificationMeta('whoIsBlockedLastNight');
  @override
  late final GeneratedColumn<String> whoIsBlockedLastNight =
      GeneratedColumn<String>('who_is_blocked_last_night', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNightMeta =
      const VerificationMeta('lastNight');
  @override
  late final GeneratedColumn<int> lastNight = GeneratedColumn<int>(
      'last_night', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mafiaBulletMeta =
      const VerificationMeta('mafiaBullet');
  @override
  late final GeneratedColumn<int> mafiaBullet = GeneratedColumn<int>(
      'mafia_bullet', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mfiaHasShotMeta =
      const VerificationMeta('mfiaHasShot');
  @override
  late final GeneratedColumn<bool> mfiaHasShot =
      GeneratedColumn<bool>('mfia_has_shot', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("mfia_has_shot" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _leonHasShotMeta =
      const VerificationMeta('leonHasShot');
  @override
  late final GeneratedColumn<String> leonHasShot = GeneratedColumn<String>(
      'leon_has_shot', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _leonBulletsMeta =
      const VerificationMeta('leonBullets');
  @override
  late final GeneratedColumn<int> leonBullets = GeneratedColumn<int>(
      'leon_bullets', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _leonWrongShotMeta =
      const VerificationMeta('leonWrongShot');
  @override
  late final GeneratedColumn<bool> leonWrongShot =
      GeneratedColumn<bool>('leon_wrong_shot', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("leon_wrong_shot" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _playerCodeMeta =
      const VerificationMeta('playerCode');
  @override
  late final GeneratedColumn<int> playerCode = GeneratedColumn<int>(
      'player_code', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nostradamousIdMeta =
      const VerificationMeta('nostradamousId');
  @override
  late final GeneratedColumn<int> nostradamousId = GeneratedColumn<int>(
      'nostradamous_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isAliveMeta =
      const VerificationMeta('isAlive');
  @override
  late final GeneratedColumn<bool> isAlive =
      GeneratedColumn<bool>('is_alive', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_alive" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isBlockedMeta =
      const VerificationMeta('isBlocked');
  @override
  late final GeneratedColumn<bool> isBlocked =
      GeneratedColumn<bool>('is_blocked', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_blocked" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isReversibleMeta =
      const VerificationMeta('isReversible');
  @override
  late final GeneratedColumn<bool> isReversible =
      GeneratedColumn<bool>('is_reversible', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_reversible" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved =
      GeneratedColumn<bool>('is_saved', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_saved" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        playerName,
        roleName,
        kaneRightChoice,
        nightOfCorrectChoice,
        kaneActionDone,
        kaneMustBeOut,
        nightOfReturning,
        konstantinActionDone,
        nightOfSavingDoctor,
        isDoctorSavedOnce,
        whoIsBlockedLastNight,
        lastNight,
        mafiaBullet,
        mfiaHasShot,
        leonHasShot,
        leonBullets,
        leonWrongShot,
        playerCode,
        nostradamousId,
        order,
        isAlive,
        isBlocked,
        isReversible,
        isSaved
      ];
  @override
  String get aliasedName => _alias ?? 'players';
  @override
  String get actualTableName => 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player_name')) {
      context.handle(
          _playerNameMeta,
          playerName.isAcceptableOrUnknown(
              data['player_name']!, _playerNameMeta));
    } else if (isInserting) {
      context.missing(_playerNameMeta);
    }
    if (data.containsKey('role_name')) {
      context.handle(_roleNameMeta,
          roleName.isAcceptableOrUnknown(data['role_name']!, _roleNameMeta));
    } else if (isInserting) {
      context.missing(_roleNameMeta);
    }
    if (data.containsKey('kane_right_choice')) {
      context.handle(
          _kaneRightChoiceMeta,
          kaneRightChoice.isAcceptableOrUnknown(
              data['kane_right_choice']!, _kaneRightChoiceMeta));
    }
    if (data.containsKey('night_of_correct_choice')) {
      context.handle(
          _nightOfCorrectChoiceMeta,
          nightOfCorrectChoice.isAcceptableOrUnknown(
              data['night_of_correct_choice']!, _nightOfCorrectChoiceMeta));
    }
    if (data.containsKey('kane_action_done')) {
      context.handle(
          _kaneActionDoneMeta,
          kaneActionDone.isAcceptableOrUnknown(
              data['kane_action_done']!, _kaneActionDoneMeta));
    }
    if (data.containsKey('kane_must_be_out')) {
      context.handle(
          _kaneMustBeOutMeta,
          kaneMustBeOut.isAcceptableOrUnknown(
              data['kane_must_be_out']!, _kaneMustBeOutMeta));
    }
    if (data.containsKey('night_of_returning')) {
      context.handle(
          _nightOfReturningMeta,
          nightOfReturning.isAcceptableOrUnknown(
              data['night_of_returning']!, _nightOfReturningMeta));
    }
    if (data.containsKey('konstantin_action_done')) {
      context.handle(
          _konstantinActionDoneMeta,
          konstantinActionDone.isAcceptableOrUnknown(
              data['konstantin_action_done']!, _konstantinActionDoneMeta));
    }
    if (data.containsKey('night_of_saving_doctor')) {
      context.handle(
          _nightOfSavingDoctorMeta,
          nightOfSavingDoctor.isAcceptableOrUnknown(
              data['night_of_saving_doctor']!, _nightOfSavingDoctorMeta));
    }
    if (data.containsKey('is_doctor_saved_once')) {
      context.handle(
          _isDoctorSavedOnceMeta,
          isDoctorSavedOnce.isAcceptableOrUnknown(
              data['is_doctor_saved_once']!, _isDoctorSavedOnceMeta));
    }
    if (data.containsKey('who_is_blocked_last_night')) {
      context.handle(
          _whoIsBlockedLastNightMeta,
          whoIsBlockedLastNight.isAcceptableOrUnknown(
              data['who_is_blocked_last_night']!, _whoIsBlockedLastNightMeta));
    }
    if (data.containsKey('last_night')) {
      context.handle(_lastNightMeta,
          lastNight.isAcceptableOrUnknown(data['last_night']!, _lastNightMeta));
    }
    if (data.containsKey('mafia_bullet')) {
      context.handle(
          _mafiaBulletMeta,
          mafiaBullet.isAcceptableOrUnknown(
              data['mafia_bullet']!, _mafiaBulletMeta));
    }
    if (data.containsKey('mfia_has_shot')) {
      context.handle(
          _mfiaHasShotMeta,
          mfiaHasShot.isAcceptableOrUnknown(
              data['mfia_has_shot']!, _mfiaHasShotMeta));
    }
    if (data.containsKey('leon_has_shot')) {
      context.handle(
          _leonHasShotMeta,
          leonHasShot.isAcceptableOrUnknown(
              data['leon_has_shot']!, _leonHasShotMeta));
    }
    if (data.containsKey('leon_bullets')) {
      context.handle(
          _leonBulletsMeta,
          leonBullets.isAcceptableOrUnknown(
              data['leon_bullets']!, _leonBulletsMeta));
    }
    if (data.containsKey('leon_wrong_shot')) {
      context.handle(
          _leonWrongShotMeta,
          leonWrongShot.isAcceptableOrUnknown(
              data['leon_wrong_shot']!, _leonWrongShotMeta));
    }
    if (data.containsKey('player_code')) {
      context.handle(
          _playerCodeMeta,
          playerCode.isAcceptableOrUnknown(
              data['player_code']!, _playerCodeMeta));
    }
    if (data.containsKey('nostradamous_id')) {
      context.handle(
          _nostradamousIdMeta,
          nostradamousId.isAcceptableOrUnknown(
              data['nostradamous_id']!, _nostradamousIdMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('is_alive')) {
      context.handle(_isAliveMeta,
          isAlive.isAcceptableOrUnknown(data['is_alive']!, _isAliveMeta));
    } else if (isInserting) {
      context.missing(_isAliveMeta);
    }
    if (data.containsKey('is_blocked')) {
      context.handle(_isBlockedMeta,
          isBlocked.isAcceptableOrUnknown(data['is_blocked']!, _isBlockedMeta));
    } else if (isInserting) {
      context.missing(_isBlockedMeta);
    }
    if (data.containsKey('is_reversible')) {
      context.handle(
          _isReversibleMeta,
          isReversible.isAcceptableOrUnknown(
              data['is_reversible']!, _isReversibleMeta));
    } else if (isInserting) {
      context.missing(_isReversibleMeta);
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    } else if (isInserting) {
      context.missing(_isSavedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      playerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_name'])!,
      roleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_name'])!,
      kaneRightChoice: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}kane_right_choice']),
      nightOfCorrectChoice: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}night_of_correct_choice']),
      kaneActionDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}kane_action_done']),
      kaneMustBeOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}kane_must_be_out']),
      nightOfReturning: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}night_of_returning']),
      konstantinActionDone: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}konstantin_action_done']),
      nightOfSavingDoctor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}night_of_saving_doctor']),
      isDoctorSavedOnce: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_doctor_saved_once']),
      whoIsBlockedLastNight: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}who_is_blocked_last_night']),
      lastNight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_night']),
      mafiaBullet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mafia_bullet']),
      mfiaHasShot: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mfia_has_shot']),
      leonHasShot: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leon_has_shot']),
      leonBullets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}leon_bullets']),
      leonWrongShot: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}leon_wrong_shot']),
      playerCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player_code']),
      nostradamousId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}nostradamous_id']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      isAlive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_alive'])!,
      isBlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_blocked'])!,
      isReversible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_reversible'])!,
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved'])!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final String playerName;
  final String roleName;
  final String? kaneRightChoice;
  final int? nightOfCorrectChoice;
  final bool? kaneActionDone;
  final bool? kaneMustBeOut;
  final String? nightOfReturning;
  final bool? konstantinActionDone;
  final int? nightOfSavingDoctor;
  final bool? isDoctorSavedOnce;
  final String? whoIsBlockedLastNight;
  final int? lastNight;
  final int? mafiaBullet;
  final bool? mfiaHasShot;
  final String? leonHasShot;
  final int? leonBullets;
  final bool? leonWrongShot;
  final int? playerCode;
  final int? nostradamousId;
  final int order;
  final bool isAlive;
  final bool isBlocked;
  final bool isReversible;
  final bool isSaved;
  const Player(
      {required this.id,
      required this.playerName,
      required this.roleName,
      this.kaneRightChoice,
      this.nightOfCorrectChoice,
      this.kaneActionDone,
      this.kaneMustBeOut,
      this.nightOfReturning,
      this.konstantinActionDone,
      this.nightOfSavingDoctor,
      this.isDoctorSavedOnce,
      this.whoIsBlockedLastNight,
      this.lastNight,
      this.mafiaBullet,
      this.mfiaHasShot,
      this.leonHasShot,
      this.leonBullets,
      this.leonWrongShot,
      this.playerCode,
      this.nostradamousId,
      required this.order,
      required this.isAlive,
      required this.isBlocked,
      required this.isReversible,
      required this.isSaved});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_name'] = Variable<String>(playerName);
    map['role_name'] = Variable<String>(roleName);
    if (!nullToAbsent || kaneRightChoice != null) {
      map['kane_right_choice'] = Variable<String>(kaneRightChoice);
    }
    if (!nullToAbsent || nightOfCorrectChoice != null) {
      map['night_of_correct_choice'] = Variable<int>(nightOfCorrectChoice);
    }
    if (!nullToAbsent || kaneActionDone != null) {
      map['kane_action_done'] = Variable<bool>(kaneActionDone);
    }
    if (!nullToAbsent || kaneMustBeOut != null) {
      map['kane_must_be_out'] = Variable<bool>(kaneMustBeOut);
    }
    if (!nullToAbsent || nightOfReturning != null) {
      map['night_of_returning'] = Variable<String>(nightOfReturning);
    }
    if (!nullToAbsent || konstantinActionDone != null) {
      map['konstantin_action_done'] = Variable<bool>(konstantinActionDone);
    }
    if (!nullToAbsent || nightOfSavingDoctor != null) {
      map['night_of_saving_doctor'] = Variable<int>(nightOfSavingDoctor);
    }
    if (!nullToAbsent || isDoctorSavedOnce != null) {
      map['is_doctor_saved_once'] = Variable<bool>(isDoctorSavedOnce);
    }
    if (!nullToAbsent || whoIsBlockedLastNight != null) {
      map['who_is_blocked_last_night'] =
          Variable<String>(whoIsBlockedLastNight);
    }
    if (!nullToAbsent || lastNight != null) {
      map['last_night'] = Variable<int>(lastNight);
    }
    if (!nullToAbsent || mafiaBullet != null) {
      map['mafia_bullet'] = Variable<int>(mafiaBullet);
    }
    if (!nullToAbsent || mfiaHasShot != null) {
      map['mfia_has_shot'] = Variable<bool>(mfiaHasShot);
    }
    if (!nullToAbsent || leonHasShot != null) {
      map['leon_has_shot'] = Variable<String>(leonHasShot);
    }
    if (!nullToAbsent || leonBullets != null) {
      map['leon_bullets'] = Variable<int>(leonBullets);
    }
    if (!nullToAbsent || leonWrongShot != null) {
      map['leon_wrong_shot'] = Variable<bool>(leonWrongShot);
    }
    if (!nullToAbsent || playerCode != null) {
      map['player_code'] = Variable<int>(playerCode);
    }
    if (!nullToAbsent || nostradamousId != null) {
      map['nostradamous_id'] = Variable<int>(nostradamousId);
    }
    map['order'] = Variable<int>(order);
    map['is_alive'] = Variable<bool>(isAlive);
    map['is_blocked'] = Variable<bool>(isBlocked);
    map['is_reversible'] = Variable<bool>(isReversible);
    map['is_saved'] = Variable<bool>(isSaved);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      playerName: Value(playerName),
      roleName: Value(roleName),
      kaneRightChoice: kaneRightChoice == null && nullToAbsent
          ? const Value.absent()
          : Value(kaneRightChoice),
      nightOfCorrectChoice: nightOfCorrectChoice == null && nullToAbsent
          ? const Value.absent()
          : Value(nightOfCorrectChoice),
      kaneActionDone: kaneActionDone == null && nullToAbsent
          ? const Value.absent()
          : Value(kaneActionDone),
      kaneMustBeOut: kaneMustBeOut == null && nullToAbsent
          ? const Value.absent()
          : Value(kaneMustBeOut),
      nightOfReturning: nightOfReturning == null && nullToAbsent
          ? const Value.absent()
          : Value(nightOfReturning),
      konstantinActionDone: konstantinActionDone == null && nullToAbsent
          ? const Value.absent()
          : Value(konstantinActionDone),
      nightOfSavingDoctor: nightOfSavingDoctor == null && nullToAbsent
          ? const Value.absent()
          : Value(nightOfSavingDoctor),
      isDoctorSavedOnce: isDoctorSavedOnce == null && nullToAbsent
          ? const Value.absent()
          : Value(isDoctorSavedOnce),
      whoIsBlockedLastNight: whoIsBlockedLastNight == null && nullToAbsent
          ? const Value.absent()
          : Value(whoIsBlockedLastNight),
      lastNight: lastNight == null && nullToAbsent
          ? const Value.absent()
          : Value(lastNight),
      mafiaBullet: mafiaBullet == null && nullToAbsent
          ? const Value.absent()
          : Value(mafiaBullet),
      mfiaHasShot: mfiaHasShot == null && nullToAbsent
          ? const Value.absent()
          : Value(mfiaHasShot),
      leonHasShot: leonHasShot == null && nullToAbsent
          ? const Value.absent()
          : Value(leonHasShot),
      leonBullets: leonBullets == null && nullToAbsent
          ? const Value.absent()
          : Value(leonBullets),
      leonWrongShot: leonWrongShot == null && nullToAbsent
          ? const Value.absent()
          : Value(leonWrongShot),
      playerCode: playerCode == null && nullToAbsent
          ? const Value.absent()
          : Value(playerCode),
      nostradamousId: nostradamousId == null && nullToAbsent
          ? const Value.absent()
          : Value(nostradamousId),
      order: Value(order),
      isAlive: Value(isAlive),
      isBlocked: Value(isBlocked),
      isReversible: Value(isReversible),
      isSaved: Value(isSaved),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      playerName: serializer.fromJson<String>(json['playerName']),
      roleName: serializer.fromJson<String>(json['roleName']),
      kaneRightChoice: serializer.fromJson<String?>(json['kaneRightChoice']),
      nightOfCorrectChoice:
          serializer.fromJson<int?>(json['nightOfCorrectChoice']),
      kaneActionDone: serializer.fromJson<bool?>(json['kaneActionDone']),
      kaneMustBeOut: serializer.fromJson<bool?>(json['kaneMustBeOut']),
      nightOfReturning: serializer.fromJson<String?>(json['nightOfReturning']),
      konstantinActionDone:
          serializer.fromJson<bool?>(json['konstantinActionDone']),
      nightOfSavingDoctor:
          serializer.fromJson<int?>(json['nightOfSavingDoctor']),
      isDoctorSavedOnce: serializer.fromJson<bool?>(json['isDoctorSavedOnce']),
      whoIsBlockedLastNight:
          serializer.fromJson<String?>(json['whoIsBlockedLastNight']),
      lastNight: serializer.fromJson<int?>(json['lastNight']),
      mafiaBullet: serializer.fromJson<int?>(json['mafiaBullet']),
      mfiaHasShot: serializer.fromJson<bool?>(json['mfiaHasShot']),
      leonHasShot: serializer.fromJson<String?>(json['leonHasShot']),
      leonBullets: serializer.fromJson<int?>(json['leonBullets']),
      leonWrongShot: serializer.fromJson<bool?>(json['leonWrongShot']),
      playerCode: serializer.fromJson<int?>(json['playerCode']),
      nostradamousId: serializer.fromJson<int?>(json['nostradamousId']),
      order: serializer.fromJson<int>(json['order']),
      isAlive: serializer.fromJson<bool>(json['isAlive']),
      isBlocked: serializer.fromJson<bool>(json['isBlocked']),
      isReversible: serializer.fromJson<bool>(json['isReversible']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerName': serializer.toJson<String>(playerName),
      'roleName': serializer.toJson<String>(roleName),
      'kaneRightChoice': serializer.toJson<String?>(kaneRightChoice),
      'nightOfCorrectChoice': serializer.toJson<int?>(nightOfCorrectChoice),
      'kaneActionDone': serializer.toJson<bool?>(kaneActionDone),
      'kaneMustBeOut': serializer.toJson<bool?>(kaneMustBeOut),
      'nightOfReturning': serializer.toJson<String?>(nightOfReturning),
      'konstantinActionDone': serializer.toJson<bool?>(konstantinActionDone),
      'nightOfSavingDoctor': serializer.toJson<int?>(nightOfSavingDoctor),
      'isDoctorSavedOnce': serializer.toJson<bool?>(isDoctorSavedOnce),
      'whoIsBlockedLastNight':
          serializer.toJson<String?>(whoIsBlockedLastNight),
      'lastNight': serializer.toJson<int?>(lastNight),
      'mafiaBullet': serializer.toJson<int?>(mafiaBullet),
      'mfiaHasShot': serializer.toJson<bool?>(mfiaHasShot),
      'leonHasShot': serializer.toJson<String?>(leonHasShot),
      'leonBullets': serializer.toJson<int?>(leonBullets),
      'leonWrongShot': serializer.toJson<bool?>(leonWrongShot),
      'playerCode': serializer.toJson<int?>(playerCode),
      'nostradamousId': serializer.toJson<int?>(nostradamousId),
      'order': serializer.toJson<int>(order),
      'isAlive': serializer.toJson<bool>(isAlive),
      'isBlocked': serializer.toJson<bool>(isBlocked),
      'isReversible': serializer.toJson<bool>(isReversible),
      'isSaved': serializer.toJson<bool>(isSaved),
    };
  }

  Player copyWith(
          {int? id,
          String? playerName,
          String? roleName,
          Value<String?> kaneRightChoice = const Value.absent(),
          Value<int?> nightOfCorrectChoice = const Value.absent(),
          Value<bool?> kaneActionDone = const Value.absent(),
          Value<bool?> kaneMustBeOut = const Value.absent(),
          Value<String?> nightOfReturning = const Value.absent(),
          Value<bool?> konstantinActionDone = const Value.absent(),
          Value<int?> nightOfSavingDoctor = const Value.absent(),
          Value<bool?> isDoctorSavedOnce = const Value.absent(),
          Value<String?> whoIsBlockedLastNight = const Value.absent(),
          Value<int?> lastNight = const Value.absent(),
          Value<int?> mafiaBullet = const Value.absent(),
          Value<bool?> mfiaHasShot = const Value.absent(),
          Value<String?> leonHasShot = const Value.absent(),
          Value<int?> leonBullets = const Value.absent(),
          Value<bool?> leonWrongShot = const Value.absent(),
          Value<int?> playerCode = const Value.absent(),
          Value<int?> nostradamousId = const Value.absent(),
          int? order,
          bool? isAlive,
          bool? isBlocked,
          bool? isReversible,
          bool? isSaved}) =>
      Player(
        id: id ?? this.id,
        playerName: playerName ?? this.playerName,
        roleName: roleName ?? this.roleName,
        kaneRightChoice: kaneRightChoice.present
            ? kaneRightChoice.value
            : this.kaneRightChoice,
        nightOfCorrectChoice: nightOfCorrectChoice.present
            ? nightOfCorrectChoice.value
            : this.nightOfCorrectChoice,
        kaneActionDone:
            kaneActionDone.present ? kaneActionDone.value : this.kaneActionDone,
        kaneMustBeOut:
            kaneMustBeOut.present ? kaneMustBeOut.value : this.kaneMustBeOut,
        nightOfReturning: nightOfReturning.present
            ? nightOfReturning.value
            : this.nightOfReturning,
        konstantinActionDone: konstantinActionDone.present
            ? konstantinActionDone.value
            : this.konstantinActionDone,
        nightOfSavingDoctor: nightOfSavingDoctor.present
            ? nightOfSavingDoctor.value
            : this.nightOfSavingDoctor,
        isDoctorSavedOnce: isDoctorSavedOnce.present
            ? isDoctorSavedOnce.value
            : this.isDoctorSavedOnce,
        whoIsBlockedLastNight: whoIsBlockedLastNight.present
            ? whoIsBlockedLastNight.value
            : this.whoIsBlockedLastNight,
        lastNight: lastNight.present ? lastNight.value : this.lastNight,
        mafiaBullet: mafiaBullet.present ? mafiaBullet.value : this.mafiaBullet,
        mfiaHasShot: mfiaHasShot.present ? mfiaHasShot.value : this.mfiaHasShot,
        leonHasShot: leonHasShot.present ? leonHasShot.value : this.leonHasShot,
        leonBullets: leonBullets.present ? leonBullets.value : this.leonBullets,
        leonWrongShot:
            leonWrongShot.present ? leonWrongShot.value : this.leonWrongShot,
        playerCode: playerCode.present ? playerCode.value : this.playerCode,
        nostradamousId:
            nostradamousId.present ? nostradamousId.value : this.nostradamousId,
        order: order ?? this.order,
        isAlive: isAlive ?? this.isAlive,
        isBlocked: isBlocked ?? this.isBlocked,
        isReversible: isReversible ?? this.isReversible,
        isSaved: isSaved ?? this.isSaved,
      );
  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('playerName: $playerName, ')
          ..write('roleName: $roleName, ')
          ..write('kaneRightChoice: $kaneRightChoice, ')
          ..write('nightOfCorrectChoice: $nightOfCorrectChoice, ')
          ..write('kaneActionDone: $kaneActionDone, ')
          ..write('kaneMustBeOut: $kaneMustBeOut, ')
          ..write('nightOfReturning: $nightOfReturning, ')
          ..write('konstantinActionDone: $konstantinActionDone, ')
          ..write('nightOfSavingDoctor: $nightOfSavingDoctor, ')
          ..write('isDoctorSavedOnce: $isDoctorSavedOnce, ')
          ..write('whoIsBlockedLastNight: $whoIsBlockedLastNight, ')
          ..write('lastNight: $lastNight, ')
          ..write('mafiaBullet: $mafiaBullet, ')
          ..write('mfiaHasShot: $mfiaHasShot, ')
          ..write('leonHasShot: $leonHasShot, ')
          ..write('leonBullets: $leonBullets, ')
          ..write('leonWrongShot: $leonWrongShot, ')
          ..write('playerCode: $playerCode, ')
          ..write('nostradamousId: $nostradamousId, ')
          ..write('order: $order, ')
          ..write('isAlive: $isAlive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('isReversible: $isReversible, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        playerName,
        roleName,
        kaneRightChoice,
        nightOfCorrectChoice,
        kaneActionDone,
        kaneMustBeOut,
        nightOfReturning,
        konstantinActionDone,
        nightOfSavingDoctor,
        isDoctorSavedOnce,
        whoIsBlockedLastNight,
        lastNight,
        mafiaBullet,
        mfiaHasShot,
        leonHasShot,
        leonBullets,
        leonWrongShot,
        playerCode,
        nostradamousId,
        order,
        isAlive,
        isBlocked,
        isReversible,
        isSaved
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.playerName == this.playerName &&
          other.roleName == this.roleName &&
          other.kaneRightChoice == this.kaneRightChoice &&
          other.nightOfCorrectChoice == this.nightOfCorrectChoice &&
          other.kaneActionDone == this.kaneActionDone &&
          other.kaneMustBeOut == this.kaneMustBeOut &&
          other.nightOfReturning == this.nightOfReturning &&
          other.konstantinActionDone == this.konstantinActionDone &&
          other.nightOfSavingDoctor == this.nightOfSavingDoctor &&
          other.isDoctorSavedOnce == this.isDoctorSavedOnce &&
          other.whoIsBlockedLastNight == this.whoIsBlockedLastNight &&
          other.lastNight == this.lastNight &&
          other.mafiaBullet == this.mafiaBullet &&
          other.mfiaHasShot == this.mfiaHasShot &&
          other.leonHasShot == this.leonHasShot &&
          other.leonBullets == this.leonBullets &&
          other.leonWrongShot == this.leonWrongShot &&
          other.playerCode == this.playerCode &&
          other.nostradamousId == this.nostradamousId &&
          other.order == this.order &&
          other.isAlive == this.isAlive &&
          other.isBlocked == this.isBlocked &&
          other.isReversible == this.isReversible &&
          other.isSaved == this.isSaved);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<String> playerName;
  final Value<String> roleName;
  final Value<String?> kaneRightChoice;
  final Value<int?> nightOfCorrectChoice;
  final Value<bool?> kaneActionDone;
  final Value<bool?> kaneMustBeOut;
  final Value<String?> nightOfReturning;
  final Value<bool?> konstantinActionDone;
  final Value<int?> nightOfSavingDoctor;
  final Value<bool?> isDoctorSavedOnce;
  final Value<String?> whoIsBlockedLastNight;
  final Value<int?> lastNight;
  final Value<int?> mafiaBullet;
  final Value<bool?> mfiaHasShot;
  final Value<String?> leonHasShot;
  final Value<int?> leonBullets;
  final Value<bool?> leonWrongShot;
  final Value<int?> playerCode;
  final Value<int?> nostradamousId;
  final Value<int> order;
  final Value<bool> isAlive;
  final Value<bool> isBlocked;
  final Value<bool> isReversible;
  final Value<bool> isSaved;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.playerName = const Value.absent(),
    this.roleName = const Value.absent(),
    this.kaneRightChoice = const Value.absent(),
    this.nightOfCorrectChoice = const Value.absent(),
    this.kaneActionDone = const Value.absent(),
    this.kaneMustBeOut = const Value.absent(),
    this.nightOfReturning = const Value.absent(),
    this.konstantinActionDone = const Value.absent(),
    this.nightOfSavingDoctor = const Value.absent(),
    this.isDoctorSavedOnce = const Value.absent(),
    this.whoIsBlockedLastNight = const Value.absent(),
    this.lastNight = const Value.absent(),
    this.mafiaBullet = const Value.absent(),
    this.mfiaHasShot = const Value.absent(),
    this.leonHasShot = const Value.absent(),
    this.leonBullets = const Value.absent(),
    this.leonWrongShot = const Value.absent(),
    this.playerCode = const Value.absent(),
    this.nostradamousId = const Value.absent(),
    this.order = const Value.absent(),
    this.isAlive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    this.isReversible = const Value.absent(),
    this.isSaved = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required String playerName,
    required String roleName,
    this.kaneRightChoice = const Value.absent(),
    this.nightOfCorrectChoice = const Value.absent(),
    this.kaneActionDone = const Value.absent(),
    this.kaneMustBeOut = const Value.absent(),
    this.nightOfReturning = const Value.absent(),
    this.konstantinActionDone = const Value.absent(),
    this.nightOfSavingDoctor = const Value.absent(),
    this.isDoctorSavedOnce = const Value.absent(),
    this.whoIsBlockedLastNight = const Value.absent(),
    this.lastNight = const Value.absent(),
    this.mafiaBullet = const Value.absent(),
    this.mfiaHasShot = const Value.absent(),
    this.leonHasShot = const Value.absent(),
    this.leonBullets = const Value.absent(),
    this.leonWrongShot = const Value.absent(),
    this.playerCode = const Value.absent(),
    this.nostradamousId = const Value.absent(),
    required int order,
    required bool isAlive,
    required bool isBlocked,
    required bool isReversible,
    required bool isSaved,
  })  : playerName = Value(playerName),
        roleName = Value(roleName),
        order = Value(order),
        isAlive = Value(isAlive),
        isBlocked = Value(isBlocked),
        isReversible = Value(isReversible),
        isSaved = Value(isSaved);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<String>? playerName,
    Expression<String>? roleName,
    Expression<String>? kaneRightChoice,
    Expression<int>? nightOfCorrectChoice,
    Expression<bool>? kaneActionDone,
    Expression<bool>? kaneMustBeOut,
    Expression<String>? nightOfReturning,
    Expression<bool>? konstantinActionDone,
    Expression<int>? nightOfSavingDoctor,
    Expression<bool>? isDoctorSavedOnce,
    Expression<String>? whoIsBlockedLastNight,
    Expression<int>? lastNight,
    Expression<int>? mafiaBullet,
    Expression<bool>? mfiaHasShot,
    Expression<String>? leonHasShot,
    Expression<int>? leonBullets,
    Expression<bool>? leonWrongShot,
    Expression<int>? playerCode,
    Expression<int>? nostradamousId,
    Expression<int>? order,
    Expression<bool>? isAlive,
    Expression<bool>? isBlocked,
    Expression<bool>? isReversible,
    Expression<bool>? isSaved,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerName != null) 'player_name': playerName,
      if (roleName != null) 'role_name': roleName,
      if (kaneRightChoice != null) 'kane_right_choice': kaneRightChoice,
      if (nightOfCorrectChoice != null)
        'night_of_correct_choice': nightOfCorrectChoice,
      if (kaneActionDone != null) 'kane_action_done': kaneActionDone,
      if (kaneMustBeOut != null) 'kane_must_be_out': kaneMustBeOut,
      if (nightOfReturning != null) 'night_of_returning': nightOfReturning,
      if (konstantinActionDone != null)
        'konstantin_action_done': konstantinActionDone,
      if (nightOfSavingDoctor != null)
        'night_of_saving_doctor': nightOfSavingDoctor,
      if (isDoctorSavedOnce != null) 'is_doctor_saved_once': isDoctorSavedOnce,
      if (whoIsBlockedLastNight != null)
        'who_is_blocked_last_night': whoIsBlockedLastNight,
      if (lastNight != null) 'last_night': lastNight,
      if (mafiaBullet != null) 'mafia_bullet': mafiaBullet,
      if (mfiaHasShot != null) 'mfia_has_shot': mfiaHasShot,
      if (leonHasShot != null) 'leon_has_shot': leonHasShot,
      if (leonBullets != null) 'leon_bullets': leonBullets,
      if (leonWrongShot != null) 'leon_wrong_shot': leonWrongShot,
      if (playerCode != null) 'player_code': playerCode,
      if (nostradamousId != null) 'nostradamous_id': nostradamousId,
      if (order != null) 'order': order,
      if (isAlive != null) 'is_alive': isAlive,
      if (isBlocked != null) 'is_blocked': isBlocked,
      if (isReversible != null) 'is_reversible': isReversible,
      if (isSaved != null) 'is_saved': isSaved,
    });
  }

  PlayersCompanion copyWith(
      {Value<int>? id,
      Value<String>? playerName,
      Value<String>? roleName,
      Value<String?>? kaneRightChoice,
      Value<int?>? nightOfCorrectChoice,
      Value<bool?>? kaneActionDone,
      Value<bool?>? kaneMustBeOut,
      Value<String?>? nightOfReturning,
      Value<bool?>? konstantinActionDone,
      Value<int?>? nightOfSavingDoctor,
      Value<bool?>? isDoctorSavedOnce,
      Value<String?>? whoIsBlockedLastNight,
      Value<int?>? lastNight,
      Value<int?>? mafiaBullet,
      Value<bool?>? mfiaHasShot,
      Value<String?>? leonHasShot,
      Value<int?>? leonBullets,
      Value<bool?>? leonWrongShot,
      Value<int?>? playerCode,
      Value<int?>? nostradamousId,
      Value<int>? order,
      Value<bool>? isAlive,
      Value<bool>? isBlocked,
      Value<bool>? isReversible,
      Value<bool>? isSaved}) {
    return PlayersCompanion(
      id: id ?? this.id,
      playerName: playerName ?? this.playerName,
      roleName: roleName ?? this.roleName,
      kaneRightChoice: kaneRightChoice ?? this.kaneRightChoice,
      nightOfCorrectChoice: nightOfCorrectChoice ?? this.nightOfCorrectChoice,
      kaneActionDone: kaneActionDone ?? this.kaneActionDone,
      kaneMustBeOut: kaneMustBeOut ?? this.kaneMustBeOut,
      nightOfReturning: nightOfReturning ?? this.nightOfReturning,
      konstantinActionDone: konstantinActionDone ?? this.konstantinActionDone,
      nightOfSavingDoctor: nightOfSavingDoctor ?? this.nightOfSavingDoctor,
      isDoctorSavedOnce: isDoctorSavedOnce ?? this.isDoctorSavedOnce,
      whoIsBlockedLastNight:
          whoIsBlockedLastNight ?? this.whoIsBlockedLastNight,
      lastNight: lastNight ?? this.lastNight,
      mafiaBullet: mafiaBullet ?? this.mafiaBullet,
      mfiaHasShot: mfiaHasShot ?? this.mfiaHasShot,
      leonHasShot: leonHasShot ?? this.leonHasShot,
      leonBullets: leonBullets ?? this.leonBullets,
      leonWrongShot: leonWrongShot ?? this.leonWrongShot,
      playerCode: playerCode ?? this.playerCode,
      nostradamousId: nostradamousId ?? this.nostradamousId,
      order: order ?? this.order,
      isAlive: isAlive ?? this.isAlive,
      isBlocked: isBlocked ?? this.isBlocked,
      isReversible: isReversible ?? this.isReversible,
      isSaved: isSaved ?? this.isSaved,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerName.present) {
      map['player_name'] = Variable<String>(playerName.value);
    }
    if (roleName.present) {
      map['role_name'] = Variable<String>(roleName.value);
    }
    if (kaneRightChoice.present) {
      map['kane_right_choice'] = Variable<String>(kaneRightChoice.value);
    }
    if (nightOfCorrectChoice.present) {
      map['night_of_correct_choice'] =
          Variable<int>(nightOfCorrectChoice.value);
    }
    if (kaneActionDone.present) {
      map['kane_action_done'] = Variable<bool>(kaneActionDone.value);
    }
    if (kaneMustBeOut.present) {
      map['kane_must_be_out'] = Variable<bool>(kaneMustBeOut.value);
    }
    if (nightOfReturning.present) {
      map['night_of_returning'] = Variable<String>(nightOfReturning.value);
    }
    if (konstantinActionDone.present) {
      map['konstantin_action_done'] =
          Variable<bool>(konstantinActionDone.value);
    }
    if (nightOfSavingDoctor.present) {
      map['night_of_saving_doctor'] = Variable<int>(nightOfSavingDoctor.value);
    }
    if (isDoctorSavedOnce.present) {
      map['is_doctor_saved_once'] = Variable<bool>(isDoctorSavedOnce.value);
    }
    if (whoIsBlockedLastNight.present) {
      map['who_is_blocked_last_night'] =
          Variable<String>(whoIsBlockedLastNight.value);
    }
    if (lastNight.present) {
      map['last_night'] = Variable<int>(lastNight.value);
    }
    if (mafiaBullet.present) {
      map['mafia_bullet'] = Variable<int>(mafiaBullet.value);
    }
    if (mfiaHasShot.present) {
      map['mfia_has_shot'] = Variable<bool>(mfiaHasShot.value);
    }
    if (leonHasShot.present) {
      map['leon_has_shot'] = Variable<String>(leonHasShot.value);
    }
    if (leonBullets.present) {
      map['leon_bullets'] = Variable<int>(leonBullets.value);
    }
    if (leonWrongShot.present) {
      map['leon_wrong_shot'] = Variable<bool>(leonWrongShot.value);
    }
    if (playerCode.present) {
      map['player_code'] = Variable<int>(playerCode.value);
    }
    if (nostradamousId.present) {
      map['nostradamous_id'] = Variable<int>(nostradamousId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (isAlive.present) {
      map['is_alive'] = Variable<bool>(isAlive.value);
    }
    if (isBlocked.present) {
      map['is_blocked'] = Variable<bool>(isBlocked.value);
    }
    if (isReversible.present) {
      map['is_reversible'] = Variable<bool>(isReversible.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('playerName: $playerName, ')
          ..write('roleName: $roleName, ')
          ..write('kaneRightChoice: $kaneRightChoice, ')
          ..write('nightOfCorrectChoice: $nightOfCorrectChoice, ')
          ..write('kaneActionDone: $kaneActionDone, ')
          ..write('kaneMustBeOut: $kaneMustBeOut, ')
          ..write('nightOfReturning: $nightOfReturning, ')
          ..write('konstantinActionDone: $konstantinActionDone, ')
          ..write('nightOfSavingDoctor: $nightOfSavingDoctor, ')
          ..write('isDoctorSavedOnce: $isDoctorSavedOnce, ')
          ..write('whoIsBlockedLastNight: $whoIsBlockedLastNight, ')
          ..write('lastNight: $lastNight, ')
          ..write('mafiaBullet: $mafiaBullet, ')
          ..write('mfiaHasShot: $mfiaHasShot, ')
          ..write('leonHasShot: $leonHasShot, ')
          ..write('leonBullets: $leonBullets, ')
          ..write('leonWrongShot: $leonWrongShot, ')
          ..write('playerCode: $playerCode, ')
          ..write('nostradamousId: $nostradamousId, ')
          ..write('order: $order, ')
          ..write('isAlive: $isAlive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('isReversible: $isReversible, ')
          ..write('isSaved: $isSaved')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $PlayersTable players = $PlayersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [players];
}
