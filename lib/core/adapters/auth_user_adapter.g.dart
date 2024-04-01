// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserHiveAdapter extends TypeAdapter<AuthUserHive> {
  @override
  final int typeId = 0;

  @override
  AuthUserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserHive(
      id: fields[0] as int?,
      username: fields[1] as String?,
      name: fields[2] as String?,
      email: fields[3] as String?,
      phone: fields[4] as String?,
      balance: fields[5] as int?,
      role: fields[6] as String?,
      isKundelik: fields[7] as bool?,
      parentPhone: fields[8] as String?,
      parentName: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserHive obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.balance)
      ..writeByte(6)
      ..write(obj.role)
      ..writeByte(7)
      ..write(obj.isKundelik)
      ..writeByte(8)
      ..write(obj.parentPhone)
      ..writeByte(9)
      ..write(obj.parentName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
