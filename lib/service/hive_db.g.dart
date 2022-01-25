// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAirportAdapter extends TypeAdapter<HiveAirport> {
  @override
  final int typeId = 0;

  @override
  HiveAirport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAirport(
      icao: fields[0] as String,
      iata: fields[1] as String,
      name: fields[2] as String,
      city: fields[3] as String,
      state: fields[4] as String,
      country: fields[5] as String,
      elevation: fields[6] as int,
      lat: fields[7] as dynamic,
      lon: fields[8] as dynamic,
      tz: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAirport obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.icao)
      ..writeByte(1)
      ..write(obj.iata)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.elevation)
      ..writeByte(7)
      ..write(obj.lat)
      ..writeByte(8)
      ..write(obj.lon)
      ..writeByte(9)
      ..write(obj.tz);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAirportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
