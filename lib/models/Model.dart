import 'package:ebook_jotter/import/imports.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dart:typed_data';
part 'Model.g.dart';

@HiveType(typeId: 30)
class pdfModels{
  @HiveField(0)
  final String? filepath;
  @HiveField(1)
  final Uint8List? imageFile;
  @HiveField(2)
  final int? pageNumber;
  @HiveField(3)
  final String? notePath;
  @HiveField(4)
  final String? bookName;

  pdfModels({this.filepath, this.imageFile, this.pageNumber, this.notePath,this.bookName});

}