// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $InCommonTable extends InCommon
    with TableInfo<$InCommonTable, InCommonData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InCommonTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _heartMeta = const VerificationMeta('heart');
  @override
  late final GeneratedColumn<int> heart = GeneratedColumn<int>(
      'heart', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved =
      GeneratedColumn<bool>('is_saved', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_saved" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playerCodeMeta =
      const VerificationMeta('playerCode');
  @override
  late final GeneratedColumn<int> playerCode = GeneratedColumn<int>(
      'player_code', aliasedName, true,
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
      GeneratedColumn<bool>('is_alive', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_alive" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isBlockedMeta =
      const VerificationMeta('isBlocked');
  @override
  late final GeneratedColumn<bool> isBlocked =
      GeneratedColumn<bool>('is_blocked', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_blocked" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _isReversibleMeta =
      const VerificationMeta('isReversible');
  @override
  late final GeneratedColumn<bool> isReversible =
      GeneratedColumn<bool>('is_reversible', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_reversible" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        playerName,
        roleName,
        heart,
        isSaved,
        type,
        playerCode,
        order,
        isAlive,
        isBlocked,
        isReversible
      ];
  @override
  String get aliasedName => _alias ?? 'in_common';
  @override
  String get actualTableName => 'in_common';
  @override
  VerificationContext validateIntegrity(Insertable<InCommonData> instance,
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
    if (data.containsKey('heart')) {
      context.handle(
          _heartMeta, heart.isAcceptableOrUnknown(data['heart']!, _heartMeta));
    } else if (isInserting) {
      context.missing(_heartMeta);
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('player_code')) {
      context.handle(
          _playerCodeMeta,
          playerCode.isAcceptableOrUnknown(
              data['player_code']!, _playerCodeMeta));
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
    }
    if (data.containsKey('is_blocked')) {
      context.handle(_isBlockedMeta,
          isBlocked.isAcceptableOrUnknown(data['is_blocked']!, _isBlockedMeta));
    }
    if (data.containsKey('is_reversible')) {
      context.handle(
          _isReversibleMeta,
          isReversible.isAcceptableOrUnknown(
              data['is_reversible']!, _isReversibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InCommonData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InCommonData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      playerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}player_name'])!,
      roleName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role_name'])!,
      heart: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}heart'])!,
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      playerCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player_code']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      isAlive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_alive']),
      isBlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_blocked']),
      isReversible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_reversible']),
    );
  }

  @override
  $InCommonTable createAlias(String alias) {
    return $InCommonTable(attachedDatabase, alias);
  }
}

class InCommonData extends DataClass implements Insertable<InCommonData> {
  final int id;
  final String playerName;
  final String roleName;
  final int heart;
  final bool? isSaved;
  final String type;
  final int? playerCode;
  final int order;
  final bool? isAlive;
  final bool? isBlocked;
  final bool? isReversible;
  const InCommonData(
      {required this.id,
      required this.playerName,
      required this.roleName,
      required this.heart,
      this.isSaved,
      required this.type,
      this.playerCode,
      required this.order,
      this.isAlive,
      this.isBlocked,
      this.isReversible});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_name'] = Variable<String>(playerName);
    map['role_name'] = Variable<String>(roleName);
    map['heart'] = Variable<int>(heart);
    if (!nullToAbsent || isSaved != null) {
      map['is_saved'] = Variable<bool>(isSaved);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || playerCode != null) {
      map['player_code'] = Variable<int>(playerCode);
    }
    map['order'] = Variable<int>(order);
    if (!nullToAbsent || isAlive != null) {
      map['is_alive'] = Variable<bool>(isAlive);
    }
    if (!nullToAbsent || isBlocked != null) {
      map['is_blocked'] = Variable<bool>(isBlocked);
    }
    if (!nullToAbsent || isReversible != null) {
      map['is_reversible'] = Variable<bool>(isReversible);
    }
    return map;
  }

  InCommonCompanion toCompanion(bool nullToAbsent) {
    return InCommonCompanion(
      id: Value(id),
      playerName: Value(playerName),
      roleName: Value(roleName),
      heart: Value(heart),
      isSaved: isSaved == null && nullToAbsent
          ? const Value.absent()
          : Value(isSaved),
      type: Value(type),
      playerCode: playerCode == null && nullToAbsent
          ? const Value.absent()
          : Value(playerCode),
      order: Value(order),
      isAlive: isAlive == null && nullToAbsent
          ? const Value.absent()
          : Value(isAlive),
      isBlocked: isBlocked == null && nullToAbsent
          ? const Value.absent()
          : Value(isBlocked),
      isReversible: isReversible == null && nullToAbsent
          ? const Value.absent()
          : Value(isReversible),
    );
  }

  factory InCommonData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InCommonData(
      id: serializer.fromJson<int>(json['id']),
      playerName: serializer.fromJson<String>(json['playerName']),
      roleName: serializer.fromJson<String>(json['roleName']),
      heart: serializer.fromJson<int>(json['heart']),
      isSaved: serializer.fromJson<bool?>(json['isSaved']),
      type: serializer.fromJson<String>(json['type']),
      playerCode: serializer.fromJson<int?>(json['playerCode']),
      order: serializer.fromJson<int>(json['order']),
      isAlive: serializer.fromJson<bool?>(json['isAlive']),
      isBlocked: serializer.fromJson<bool?>(json['isBlocked']),
      isReversible: serializer.fromJson<bool?>(json['isReversible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerName': serializer.toJson<String>(playerName),
      'roleName': serializer.toJson<String>(roleName),
      'heart': serializer.toJson<int>(heart),
      'isSaved': serializer.toJson<bool?>(isSaved),
      'type': serializer.toJson<String>(type),
      'playerCode': serializer.toJson<int?>(playerCode),
      'order': serializer.toJson<int>(order),
      'isAlive': serializer.toJson<bool?>(isAlive),
      'isBlocked': serializer.toJson<bool?>(isBlocked),
      'isReversible': serializer.toJson<bool?>(isReversible),
    };
  }

  InCommonData copyWith(
          {int? id,
          String? playerName,
          String? roleName,
          int? heart,
          Value<bool?> isSaved = const Value.absent(),
          String? type,
          Value<int?> playerCode = const Value.absent(),
          int? order,
          Value<bool?> isAlive = const Value.absent(),
          Value<bool?> isBlocked = const Value.absent(),
          Value<bool?> isReversible = const Value.absent()}) =>
      InCommonData(
        id: id ?? this.id,
        playerName: playerName ?? this.playerName,
        roleName: roleName ?? this.roleName,
        heart: heart ?? this.heart,
        isSaved: isSaved.present ? isSaved.value : this.isSaved,
        type: type ?? this.type,
        playerCode: playerCode.present ? playerCode.value : this.playerCode,
        order: order ?? this.order,
        isAlive: isAlive.present ? isAlive.value : this.isAlive,
        isBlocked: isBlocked.present ? isBlocked.value : this.isBlocked,
        isReversible:
            isReversible.present ? isReversible.value : this.isReversible,
      );
  @override
  String toString() {
    return (StringBuffer('InCommonData(')
          ..write('id: $id, ')
          ..write('playerName: $playerName, ')
          ..write('roleName: $roleName, ')
          ..write('heart: $heart, ')
          ..write('isSaved: $isSaved, ')
          ..write('type: $type, ')
          ..write('playerCode: $playerCode, ')
          ..write('order: $order, ')
          ..write('isAlive: $isAlive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('isReversible: $isReversible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerName, roleName, heart, isSaved,
      type, playerCode, order, isAlive, isBlocked, isReversible);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InCommonData &&
          other.id == this.id &&
          other.playerName == this.playerName &&
          other.roleName == this.roleName &&
          other.heart == this.heart &&
          other.isSaved == this.isSaved &&
          other.type == this.type &&
          other.playerCode == this.playerCode &&
          other.order == this.order &&
          other.isAlive == this.isAlive &&
          other.isBlocked == this.isBlocked &&
          other.isReversible == this.isReversible);
}

class InCommonCompanion extends UpdateCompanion<InCommonData> {
  final Value<int> id;
  final Value<String> playerName;
  final Value<String> roleName;
  final Value<int> heart;
  final Value<bool?> isSaved;
  final Value<String> type;
  final Value<int?> playerCode;
  final Value<int> order;
  final Value<bool?> isAlive;
  final Value<bool?> isBlocked;
  final Value<bool?> isReversible;
  const InCommonCompanion({
    this.id = const Value.absent(),
    this.playerName = const Value.absent(),
    this.roleName = const Value.absent(),
    this.heart = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.type = const Value.absent(),
    this.playerCode = const Value.absent(),
    this.order = const Value.absent(),
    this.isAlive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    this.isReversible = const Value.absent(),
  });
  InCommonCompanion.insert({
    this.id = const Value.absent(),
    required String playerName,
    required String roleName,
    required int heart,
    this.isSaved = const Value.absent(),
    required String type,
    this.playerCode = const Value.absent(),
    required int order,
    this.isAlive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    this.isReversible = const Value.absent(),
  })  : playerName = Value(playerName),
        roleName = Value(roleName),
        heart = Value(heart),
        type = Value(type),
        order = Value(order);
  static Insertable<InCommonData> custom({
    Expression<int>? id,
    Expression<String>? playerName,
    Expression<String>? roleName,
    Expression<int>? heart,
    Expression<bool>? isSaved,
    Expression<String>? type,
    Expression<int>? playerCode,
    Expression<int>? order,
    Expression<bool>? isAlive,
    Expression<bool>? isBlocked,
    Expression<bool>? isReversible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerName != null) 'player_name': playerName,
      if (roleName != null) 'role_name': roleName,
      if (heart != null) 'heart': heart,
      if (isSaved != null) 'is_saved': isSaved,
      if (type != null) 'type': type,
      if (playerCode != null) 'player_code': playerCode,
      if (order != null) 'order': order,
      if (isAlive != null) 'is_alive': isAlive,
      if (isBlocked != null) 'is_blocked': isBlocked,
      if (isReversible != null) 'is_reversible': isReversible,
    });
  }

  InCommonCompanion copyWith(
      {Value<int>? id,
      Value<String>? playerName,
      Value<String>? roleName,
      Value<int>? heart,
      Value<bool?>? isSaved,
      Value<String>? type,
      Value<int?>? playerCode,
      Value<int>? order,
      Value<bool?>? isAlive,
      Value<bool?>? isBlocked,
      Value<bool?>? isReversible}) {
    return InCommonCompanion(
      id: id ?? this.id,
      playerName: playerName ?? this.playerName,
      roleName: roleName ?? this.roleName,
      heart: heart ?? this.heart,
      isSaved: isSaved ?? this.isSaved,
      type: type ?? this.type,
      playerCode: playerCode ?? this.playerCode,
      order: order ?? this.order,
      isAlive: isAlive ?? this.isAlive,
      isBlocked: isBlocked ?? this.isBlocked,
      isReversible: isReversible ?? this.isReversible,
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
    if (heart.present) {
      map['heart'] = Variable<int>(heart.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (playerCode.present) {
      map['player_code'] = Variable<int>(playerCode.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InCommonCompanion(')
          ..write('id: $id, ')
          ..write('playerName: $playerName, ')
          ..write('roleName: $roleName, ')
          ..write('heart: $heart, ')
          ..write('isSaved: $isSaved, ')
          ..write('type: $type, ')
          ..write('playerCode: $playerCode, ')
          ..write('order: $order, ')
          ..write('isAlive: $isAlive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('isReversible: $isReversible')
          ..write(')'))
        .toString();
  }
}

class $KaneSectionTable extends KaneSection
    with TableInfo<$KaneSectionTable, KaneSectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KaneSectionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES in_common (id)'));
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        kaneRightChoice,
        nightOfCorrectChoice,
        kaneActionDone,
        kaneMustBeOut
      ];
  @override
  String get aliasedName => _alias ?? 'kane_section';
  @override
  String get actualTableName => 'kane_section';
  @override
  VerificationContext validateIntegrity(Insertable<KaneSectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  KaneSectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KaneSectionData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kaneRightChoice: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}kane_right_choice']),
      nightOfCorrectChoice: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}night_of_correct_choice']),
      kaneActionDone: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}kane_action_done']),
      kaneMustBeOut: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}kane_must_be_out']),
    );
  }

  @override
  $KaneSectionTable createAlias(String alias) {
    return $KaneSectionTable(attachedDatabase, alias);
  }
}

class KaneSectionData extends DataClass implements Insertable<KaneSectionData> {
  final int id;
  final String? kaneRightChoice;
  final int? nightOfCorrectChoice;
  final bool? kaneActionDone;
  final bool? kaneMustBeOut;
  const KaneSectionData(
      {required this.id,
      this.kaneRightChoice,
      this.nightOfCorrectChoice,
      this.kaneActionDone,
      this.kaneMustBeOut});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
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
    return map;
  }

  KaneSectionCompanion toCompanion(bool nullToAbsent) {
    return KaneSectionCompanion(
      id: Value(id),
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
    );
  }

  factory KaneSectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KaneSectionData(
      id: serializer.fromJson<int>(json['id']),
      kaneRightChoice: serializer.fromJson<String?>(json['kaneRightChoice']),
      nightOfCorrectChoice:
          serializer.fromJson<int?>(json['nightOfCorrectChoice']),
      kaneActionDone: serializer.fromJson<bool?>(json['kaneActionDone']),
      kaneMustBeOut: serializer.fromJson<bool?>(json['kaneMustBeOut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kaneRightChoice': serializer.toJson<String?>(kaneRightChoice),
      'nightOfCorrectChoice': serializer.toJson<int?>(nightOfCorrectChoice),
      'kaneActionDone': serializer.toJson<bool?>(kaneActionDone),
      'kaneMustBeOut': serializer.toJson<bool?>(kaneMustBeOut),
    };
  }

  KaneSectionData copyWith(
          {int? id,
          Value<String?> kaneRightChoice = const Value.absent(),
          Value<int?> nightOfCorrectChoice = const Value.absent(),
          Value<bool?> kaneActionDone = const Value.absent(),
          Value<bool?> kaneMustBeOut = const Value.absent()}) =>
      KaneSectionData(
        id: id ?? this.id,
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
      );
  @override
  String toString() {
    return (StringBuffer('KaneSectionData(')
          ..write('id: $id, ')
          ..write('kaneRightChoice: $kaneRightChoice, ')
          ..write('nightOfCorrectChoice: $nightOfCorrectChoice, ')
          ..write('kaneActionDone: $kaneActionDone, ')
          ..write('kaneMustBeOut: $kaneMustBeOut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, kaneRightChoice, nightOfCorrectChoice, kaneActionDone, kaneMustBeOut);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KaneSectionData &&
          other.id == this.id &&
          other.kaneRightChoice == this.kaneRightChoice &&
          other.nightOfCorrectChoice == this.nightOfCorrectChoice &&
          other.kaneActionDone == this.kaneActionDone &&
          other.kaneMustBeOut == this.kaneMustBeOut);
}

class KaneSectionCompanion extends UpdateCompanion<KaneSectionData> {
  final Value<int> id;
  final Value<String?> kaneRightChoice;
  final Value<int?> nightOfCorrectChoice;
  final Value<bool?> kaneActionDone;
  final Value<bool?> kaneMustBeOut;
  final Value<int> rowid;
  const KaneSectionCompanion({
    this.id = const Value.absent(),
    this.kaneRightChoice = const Value.absent(),
    this.nightOfCorrectChoice = const Value.absent(),
    this.kaneActionDone = const Value.absent(),
    this.kaneMustBeOut = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KaneSectionCompanion.insert({
    required int id,
    this.kaneRightChoice = const Value.absent(),
    this.nightOfCorrectChoice = const Value.absent(),
    this.kaneActionDone = const Value.absent(),
    this.kaneMustBeOut = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<KaneSectionData> custom({
    Expression<int>? id,
    Expression<String>? kaneRightChoice,
    Expression<int>? nightOfCorrectChoice,
    Expression<bool>? kaneActionDone,
    Expression<bool>? kaneMustBeOut,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kaneRightChoice != null) 'kane_right_choice': kaneRightChoice,
      if (nightOfCorrectChoice != null)
        'night_of_correct_choice': nightOfCorrectChoice,
      if (kaneActionDone != null) 'kane_action_done': kaneActionDone,
      if (kaneMustBeOut != null) 'kane_must_be_out': kaneMustBeOut,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KaneSectionCompanion copyWith(
      {Value<int>? id,
      Value<String?>? kaneRightChoice,
      Value<int?>? nightOfCorrectChoice,
      Value<bool?>? kaneActionDone,
      Value<bool?>? kaneMustBeOut,
      Value<int>? rowid}) {
    return KaneSectionCompanion(
      id: id ?? this.id,
      kaneRightChoice: kaneRightChoice ?? this.kaneRightChoice,
      nightOfCorrectChoice: nightOfCorrectChoice ?? this.nightOfCorrectChoice,
      kaneActionDone: kaneActionDone ?? this.kaneActionDone,
      kaneMustBeOut: kaneMustBeOut ?? this.kaneMustBeOut,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KaneSectionCompanion(')
          ..write('id: $id, ')
          ..write('kaneRightChoice: $kaneRightChoice, ')
          ..write('nightOfCorrectChoice: $nightOfCorrectChoice, ')
          ..write('kaneActionDone: $kaneActionDone, ')
          ..write('kaneMustBeOut: $kaneMustBeOut, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KonstantinSectionTable extends KonstantinSection
    with TableInfo<$KonstantinSectionTable, KonstantinSectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KonstantinSectionTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns =>
      [nightOfReturning, konstantinActionDone];
  @override
  String get aliasedName => _alias ?? 'konstantin_section';
  @override
  String get actualTableName => 'konstantin_section';
  @override
  VerificationContext validateIntegrity(
      Insertable<KonstantinSectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  KonstantinSectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KonstantinSectionData(
      nightOfReturning: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}night_of_returning']),
      konstantinActionDone: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}konstantin_action_done']),
    );
  }

  @override
  $KonstantinSectionTable createAlias(String alias) {
    return $KonstantinSectionTable(attachedDatabase, alias);
  }
}

class KonstantinSectionData extends DataClass
    implements Insertable<KonstantinSectionData> {
  final String? nightOfReturning;
  final bool? konstantinActionDone;
  const KonstantinSectionData(
      {this.nightOfReturning, this.konstantinActionDone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || nightOfReturning != null) {
      map['night_of_returning'] = Variable<String>(nightOfReturning);
    }
    if (!nullToAbsent || konstantinActionDone != null) {
      map['konstantin_action_done'] = Variable<bool>(konstantinActionDone);
    }
    return map;
  }

  KonstantinSectionCompanion toCompanion(bool nullToAbsent) {
    return KonstantinSectionCompanion(
      nightOfReturning: nightOfReturning == null && nullToAbsent
          ? const Value.absent()
          : Value(nightOfReturning),
      konstantinActionDone: konstantinActionDone == null && nullToAbsent
          ? const Value.absent()
          : Value(konstantinActionDone),
    );
  }

  factory KonstantinSectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KonstantinSectionData(
      nightOfReturning: serializer.fromJson<String?>(json['nightOfReturning']),
      konstantinActionDone:
          serializer.fromJson<bool?>(json['konstantinActionDone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nightOfReturning': serializer.toJson<String?>(nightOfReturning),
      'konstantinActionDone': serializer.toJson<bool?>(konstantinActionDone),
    };
  }

  KonstantinSectionData copyWith(
          {Value<String?> nightOfReturning = const Value.absent(),
          Value<bool?> konstantinActionDone = const Value.absent()}) =>
      KonstantinSectionData(
        nightOfReturning: nightOfReturning.present
            ? nightOfReturning.value
            : this.nightOfReturning,
        konstantinActionDone: konstantinActionDone.present
            ? konstantinActionDone.value
            : this.konstantinActionDone,
      );
  @override
  String toString() {
    return (StringBuffer('KonstantinSectionData(')
          ..write('nightOfReturning: $nightOfReturning, ')
          ..write('konstantinActionDone: $konstantinActionDone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nightOfReturning, konstantinActionDone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KonstantinSectionData &&
          other.nightOfReturning == this.nightOfReturning &&
          other.konstantinActionDone == this.konstantinActionDone);
}

class KonstantinSectionCompanion
    extends UpdateCompanion<KonstantinSectionData> {
  final Value<String?> nightOfReturning;
  final Value<bool?> konstantinActionDone;
  final Value<int> rowid;
  const KonstantinSectionCompanion({
    this.nightOfReturning = const Value.absent(),
    this.konstantinActionDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KonstantinSectionCompanion.insert({
    this.nightOfReturning = const Value.absent(),
    this.konstantinActionDone = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<KonstantinSectionData> custom({
    Expression<String>? nightOfReturning,
    Expression<bool>? konstantinActionDone,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nightOfReturning != null) 'night_of_returning': nightOfReturning,
      if (konstantinActionDone != null)
        'konstantin_action_done': konstantinActionDone,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KonstantinSectionCompanion copyWith(
      {Value<String?>? nightOfReturning,
      Value<bool?>? konstantinActionDone,
      Value<int>? rowid}) {
    return KonstantinSectionCompanion(
      nightOfReturning: nightOfReturning ?? this.nightOfReturning,
      konstantinActionDone: konstantinActionDone ?? this.konstantinActionDone,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nightOfReturning.present) {
      map['night_of_returning'] = Variable<String>(nightOfReturning.value);
    }
    if (konstantinActionDone.present) {
      map['konstantin_action_done'] =
          Variable<bool>(konstantinActionDone.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KonstantinSectionCompanion(')
          ..write('nightOfReturning: $nightOfReturning, ')
          ..write('konstantinActionDone: $konstantinActionDone, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoctorSectionTable extends DoctorSection
    with TableInfo<$DoctorSectionTable, DoctorSectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorSectionTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns =>
      [nightOfSavingDoctor, isDoctorSavedOnce];
  @override
  String get aliasedName => _alias ?? 'doctor_section';
  @override
  String get actualTableName => 'doctor_section';
  @override
  VerificationContext validateIntegrity(Insertable<DoctorSectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DoctorSectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorSectionData(
      nightOfSavingDoctor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}night_of_saving_doctor']),
      isDoctorSavedOnce: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_doctor_saved_once']),
    );
  }

  @override
  $DoctorSectionTable createAlias(String alias) {
    return $DoctorSectionTable(attachedDatabase, alias);
  }
}

class DoctorSectionData extends DataClass
    implements Insertable<DoctorSectionData> {
  final int? nightOfSavingDoctor;
  final bool? isDoctorSavedOnce;
  const DoctorSectionData({this.nightOfSavingDoctor, this.isDoctorSavedOnce});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || nightOfSavingDoctor != null) {
      map['night_of_saving_doctor'] = Variable<int>(nightOfSavingDoctor);
    }
    if (!nullToAbsent || isDoctorSavedOnce != null) {
      map['is_doctor_saved_once'] = Variable<bool>(isDoctorSavedOnce);
    }
    return map;
  }

  DoctorSectionCompanion toCompanion(bool nullToAbsent) {
    return DoctorSectionCompanion(
      nightOfSavingDoctor: nightOfSavingDoctor == null && nullToAbsent
          ? const Value.absent()
          : Value(nightOfSavingDoctor),
      isDoctorSavedOnce: isDoctorSavedOnce == null && nullToAbsent
          ? const Value.absent()
          : Value(isDoctorSavedOnce),
    );
  }

  factory DoctorSectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorSectionData(
      nightOfSavingDoctor:
          serializer.fromJson<int?>(json['nightOfSavingDoctor']),
      isDoctorSavedOnce: serializer.fromJson<bool?>(json['isDoctorSavedOnce']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nightOfSavingDoctor': serializer.toJson<int?>(nightOfSavingDoctor),
      'isDoctorSavedOnce': serializer.toJson<bool?>(isDoctorSavedOnce),
    };
  }

  DoctorSectionData copyWith(
          {Value<int?> nightOfSavingDoctor = const Value.absent(),
          Value<bool?> isDoctorSavedOnce = const Value.absent()}) =>
      DoctorSectionData(
        nightOfSavingDoctor: nightOfSavingDoctor.present
            ? nightOfSavingDoctor.value
            : this.nightOfSavingDoctor,
        isDoctorSavedOnce: isDoctorSavedOnce.present
            ? isDoctorSavedOnce.value
            : this.isDoctorSavedOnce,
      );
  @override
  String toString() {
    return (StringBuffer('DoctorSectionData(')
          ..write('nightOfSavingDoctor: $nightOfSavingDoctor, ')
          ..write('isDoctorSavedOnce: $isDoctorSavedOnce')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nightOfSavingDoctor, isDoctorSavedOnce);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorSectionData &&
          other.nightOfSavingDoctor == this.nightOfSavingDoctor &&
          other.isDoctorSavedOnce == this.isDoctorSavedOnce);
}

class DoctorSectionCompanion extends UpdateCompanion<DoctorSectionData> {
  final Value<int?> nightOfSavingDoctor;
  final Value<bool?> isDoctorSavedOnce;
  final Value<int> rowid;
  const DoctorSectionCompanion({
    this.nightOfSavingDoctor = const Value.absent(),
    this.isDoctorSavedOnce = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorSectionCompanion.insert({
    this.nightOfSavingDoctor = const Value.absent(),
    this.isDoctorSavedOnce = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<DoctorSectionData> custom({
    Expression<int>? nightOfSavingDoctor,
    Expression<bool>? isDoctorSavedOnce,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nightOfSavingDoctor != null)
        'night_of_saving_doctor': nightOfSavingDoctor,
      if (isDoctorSavedOnce != null) 'is_doctor_saved_once': isDoctorSavedOnce,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorSectionCompanion copyWith(
      {Value<int?>? nightOfSavingDoctor,
      Value<bool?>? isDoctorSavedOnce,
      Value<int>? rowid}) {
    return DoctorSectionCompanion(
      nightOfSavingDoctor: nightOfSavingDoctor ?? this.nightOfSavingDoctor,
      isDoctorSavedOnce: isDoctorSavedOnce ?? this.isDoctorSavedOnce,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nightOfSavingDoctor.present) {
      map['night_of_saving_doctor'] = Variable<int>(nightOfSavingDoctor.value);
    }
    if (isDoctorSavedOnce.present) {
      map['is_doctor_saved_once'] = Variable<bool>(isDoctorSavedOnce.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorSectionCompanion(')
          ..write('nightOfSavingDoctor: $nightOfSavingDoctor, ')
          ..write('isDoctorSavedOnce: $isDoctorSavedOnce, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LeonSectionTable extends LeonSection
    with TableInfo<$LeonSectionTable, LeonSectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LeonSectionTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns =>
      [leonHasShot, leonBullets, leonWrongShot];
  @override
  String get aliasedName => _alias ?? 'leon_section';
  @override
  String get actualTableName => 'leon_section';
  @override
  VerificationContext validateIntegrity(Insertable<LeonSectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LeonSectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LeonSectionData(
      leonHasShot: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leon_has_shot']),
      leonBullets: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}leon_bullets']),
      leonWrongShot: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}leon_wrong_shot']),
    );
  }

  @override
  $LeonSectionTable createAlias(String alias) {
    return $LeonSectionTable(attachedDatabase, alias);
  }
}

class LeonSectionData extends DataClass implements Insertable<LeonSectionData> {
  final String? leonHasShot;
  final int? leonBullets;
  final bool? leonWrongShot;
  const LeonSectionData(
      {this.leonHasShot, this.leonBullets, this.leonWrongShot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || leonHasShot != null) {
      map['leon_has_shot'] = Variable<String>(leonHasShot);
    }
    if (!nullToAbsent || leonBullets != null) {
      map['leon_bullets'] = Variable<int>(leonBullets);
    }
    if (!nullToAbsent || leonWrongShot != null) {
      map['leon_wrong_shot'] = Variable<bool>(leonWrongShot);
    }
    return map;
  }

  LeonSectionCompanion toCompanion(bool nullToAbsent) {
    return LeonSectionCompanion(
      leonHasShot: leonHasShot == null && nullToAbsent
          ? const Value.absent()
          : Value(leonHasShot),
      leonBullets: leonBullets == null && nullToAbsent
          ? const Value.absent()
          : Value(leonBullets),
      leonWrongShot: leonWrongShot == null && nullToAbsent
          ? const Value.absent()
          : Value(leonWrongShot),
    );
  }

  factory LeonSectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LeonSectionData(
      leonHasShot: serializer.fromJson<String?>(json['leonHasShot']),
      leonBullets: serializer.fromJson<int?>(json['leonBullets']),
      leonWrongShot: serializer.fromJson<bool?>(json['leonWrongShot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'leonHasShot': serializer.toJson<String?>(leonHasShot),
      'leonBullets': serializer.toJson<int?>(leonBullets),
      'leonWrongShot': serializer.toJson<bool?>(leonWrongShot),
    };
  }

  LeonSectionData copyWith(
          {Value<String?> leonHasShot = const Value.absent(),
          Value<int?> leonBullets = const Value.absent(),
          Value<bool?> leonWrongShot = const Value.absent()}) =>
      LeonSectionData(
        leonHasShot: leonHasShot.present ? leonHasShot.value : this.leonHasShot,
        leonBullets: leonBullets.present ? leonBullets.value : this.leonBullets,
        leonWrongShot:
            leonWrongShot.present ? leonWrongShot.value : this.leonWrongShot,
      );
  @override
  String toString() {
    return (StringBuffer('LeonSectionData(')
          ..write('leonHasShot: $leonHasShot, ')
          ..write('leonBullets: $leonBullets, ')
          ..write('leonWrongShot: $leonWrongShot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(leonHasShot, leonBullets, leonWrongShot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LeonSectionData &&
          other.leonHasShot == this.leonHasShot &&
          other.leonBullets == this.leonBullets &&
          other.leonWrongShot == this.leonWrongShot);
}

class LeonSectionCompanion extends UpdateCompanion<LeonSectionData> {
  final Value<String?> leonHasShot;
  final Value<int?> leonBullets;
  final Value<bool?> leonWrongShot;
  final Value<int> rowid;
  const LeonSectionCompanion({
    this.leonHasShot = const Value.absent(),
    this.leonBullets = const Value.absent(),
    this.leonWrongShot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LeonSectionCompanion.insert({
    this.leonHasShot = const Value.absent(),
    this.leonBullets = const Value.absent(),
    this.leonWrongShot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<LeonSectionData> custom({
    Expression<String>? leonHasShot,
    Expression<int>? leonBullets,
    Expression<bool>? leonWrongShot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (leonHasShot != null) 'leon_has_shot': leonHasShot,
      if (leonBullets != null) 'leon_bullets': leonBullets,
      if (leonWrongShot != null) 'leon_wrong_shot': leonWrongShot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LeonSectionCompanion copyWith(
      {Value<String?>? leonHasShot,
      Value<int?>? leonBullets,
      Value<bool?>? leonWrongShot,
      Value<int>? rowid}) {
    return LeonSectionCompanion(
      leonHasShot: leonHasShot ?? this.leonHasShot,
      leonBullets: leonBullets ?? this.leonBullets,
      leonWrongShot: leonWrongShot ?? this.leonWrongShot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (leonHasShot.present) {
      map['leon_has_shot'] = Variable<String>(leonHasShot.value);
    }
    if (leonBullets.present) {
      map['leon_bullets'] = Variable<int>(leonBullets.value);
    }
    if (leonWrongShot.present) {
      map['leon_wrong_shot'] = Variable<bool>(leonWrongShot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LeonSectionCompanion(')
          ..write('leonHasShot: $leonHasShot, ')
          ..write('leonBullets: $leonBullets, ')
          ..write('leonWrongShot: $leonWrongShot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MafiaSectionTable extends MafiaSection
    with TableInfo<$MafiaSectionTable, MafiaSectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MafiaSectionTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns =>
      [whoIsBlockedLastNight, lastNight, mafiaBullet, mfiaHasShot];
  @override
  String get aliasedName => _alias ?? 'mafia_section';
  @override
  String get actualTableName => 'mafia_section';
  @override
  VerificationContext validateIntegrity(Insertable<MafiaSectionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MafiaSectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MafiaSectionData(
      whoIsBlockedLastNight: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}who_is_blocked_last_night']),
      lastNight: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_night']),
      mafiaBullet: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}mafia_bullet']),
      mfiaHasShot: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mfia_has_shot']),
    );
  }

  @override
  $MafiaSectionTable createAlias(String alias) {
    return $MafiaSectionTable(attachedDatabase, alias);
  }
}

class MafiaSectionData extends DataClass
    implements Insertable<MafiaSectionData> {
  final String? whoIsBlockedLastNight;
  final int? lastNight;
  final int? mafiaBullet;
  final bool? mfiaHasShot;
  const MafiaSectionData(
      {this.whoIsBlockedLastNight,
      this.lastNight,
      this.mafiaBullet,
      this.mfiaHasShot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    return map;
  }

  MafiaSectionCompanion toCompanion(bool nullToAbsent) {
    return MafiaSectionCompanion(
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
    );
  }

  factory MafiaSectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MafiaSectionData(
      whoIsBlockedLastNight:
          serializer.fromJson<String?>(json['whoIsBlockedLastNight']),
      lastNight: serializer.fromJson<int?>(json['lastNight']),
      mafiaBullet: serializer.fromJson<int?>(json['mafiaBullet']),
      mfiaHasShot: serializer.fromJson<bool?>(json['mfiaHasShot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'whoIsBlockedLastNight':
          serializer.toJson<String?>(whoIsBlockedLastNight),
      'lastNight': serializer.toJson<int?>(lastNight),
      'mafiaBullet': serializer.toJson<int?>(mafiaBullet),
      'mfiaHasShot': serializer.toJson<bool?>(mfiaHasShot),
    };
  }

  MafiaSectionData copyWith(
          {Value<String?> whoIsBlockedLastNight = const Value.absent(),
          Value<int?> lastNight = const Value.absent(),
          Value<int?> mafiaBullet = const Value.absent(),
          Value<bool?> mfiaHasShot = const Value.absent()}) =>
      MafiaSectionData(
        whoIsBlockedLastNight: whoIsBlockedLastNight.present
            ? whoIsBlockedLastNight.value
            : this.whoIsBlockedLastNight,
        lastNight: lastNight.present ? lastNight.value : this.lastNight,
        mafiaBullet: mafiaBullet.present ? mafiaBullet.value : this.mafiaBullet,
        mfiaHasShot: mfiaHasShot.present ? mfiaHasShot.value : this.mfiaHasShot,
      );
  @override
  String toString() {
    return (StringBuffer('MafiaSectionData(')
          ..write('whoIsBlockedLastNight: $whoIsBlockedLastNight, ')
          ..write('lastNight: $lastNight, ')
          ..write('mafiaBullet: $mafiaBullet, ')
          ..write('mfiaHasShot: $mfiaHasShot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(whoIsBlockedLastNight, lastNight, mafiaBullet, mfiaHasShot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MafiaSectionData &&
          other.whoIsBlockedLastNight == this.whoIsBlockedLastNight &&
          other.lastNight == this.lastNight &&
          other.mafiaBullet == this.mafiaBullet &&
          other.mfiaHasShot == this.mfiaHasShot);
}

class MafiaSectionCompanion extends UpdateCompanion<MafiaSectionData> {
  final Value<String?> whoIsBlockedLastNight;
  final Value<int?> lastNight;
  final Value<int?> mafiaBullet;
  final Value<bool?> mfiaHasShot;
  final Value<int> rowid;
  const MafiaSectionCompanion({
    this.whoIsBlockedLastNight = const Value.absent(),
    this.lastNight = const Value.absent(),
    this.mafiaBullet = const Value.absent(),
    this.mfiaHasShot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MafiaSectionCompanion.insert({
    this.whoIsBlockedLastNight = const Value.absent(),
    this.lastNight = const Value.absent(),
    this.mafiaBullet = const Value.absent(),
    this.mfiaHasShot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<MafiaSectionData> custom({
    Expression<String>? whoIsBlockedLastNight,
    Expression<int>? lastNight,
    Expression<int>? mafiaBullet,
    Expression<bool>? mfiaHasShot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (whoIsBlockedLastNight != null)
        'who_is_blocked_last_night': whoIsBlockedLastNight,
      if (lastNight != null) 'last_night': lastNight,
      if (mafiaBullet != null) 'mafia_bullet': mafiaBullet,
      if (mfiaHasShot != null) 'mfia_has_shot': mfiaHasShot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MafiaSectionCompanion copyWith(
      {Value<String?>? whoIsBlockedLastNight,
      Value<int?>? lastNight,
      Value<int?>? mafiaBullet,
      Value<bool?>? mfiaHasShot,
      Value<int>? rowid}) {
    return MafiaSectionCompanion(
      whoIsBlockedLastNight:
          whoIsBlockedLastNight ?? this.whoIsBlockedLastNight,
      lastNight: lastNight ?? this.lastNight,
      mafiaBullet: mafiaBullet ?? this.mafiaBullet,
      mfiaHasShot: mfiaHasShot ?? this.mfiaHasShot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MafiaSectionCompanion(')
          ..write('whoIsBlockedLastNight: $whoIsBlockedLastNight, ')
          ..write('lastNight: $lastNight, ')
          ..write('mafiaBullet: $mafiaBullet, ')
          ..write('mfiaHasShot: $mfiaHasShot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $InCommonTable inCommon = $InCommonTable(this);
  late final $KaneSectionTable kaneSection = $KaneSectionTable(this);
  late final $KonstantinSectionTable konstantinSection =
      $KonstantinSectionTable(this);
  late final $DoctorSectionTable doctorSection = $DoctorSectionTable(this);
  late final $LeonSectionTable leonSection = $LeonSectionTable(this);
  late final $MafiaSectionTable mafiaSection = $MafiaSectionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        inCommon,
        kaneSection,
        konstantinSection,
        doctorSection,
        leonSection,
        mafiaSection
      ];
}
