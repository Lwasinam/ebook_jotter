// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class pdfModelAdapter extends TypeAdapter<pdfModel> {
  @override
  final int typeId = 0;

  @override
  pdfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return pdfModel(
      filepath: fields[0] as String?,
      imagePath: fields[1] as String?,
      pageNumber: fields[2] as int?,
      notePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, pdfModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.filepath)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.pageNumber)
      ..writeByte(3)
      ..write(obj.notePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is pdfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
