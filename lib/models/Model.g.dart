// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class pdfModelsAdapter extends TypeAdapter<pdfModels> {
  @override
  final int typeId = 31;

  @override
  pdfModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return pdfModels(
      filepath: fields[0] as String?,
      imageFile: fields[1] as Uint8List?,
      pageNumber: fields[2] as int?,
      notePath: fields[3] as String?,
      bookName: fields[4] as String?,
      noteFile: (fields[5] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, pdfModels obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.filepath)
      ..writeByte(1)
      ..write(obj.imageFile)
      ..writeByte(2)
      ..write(obj.pageNumber)
      ..writeByte(3)
      ..write(obj.notePath)
      ..writeByte(4)
      ..write(obj.bookName)
      ..writeByte(5)
      ..write(obj.noteFile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is pdfModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
