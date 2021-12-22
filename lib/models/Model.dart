import 'package:ebook_jotter/import/imports.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'Model.g.dart';

@HiveType(typeId: 1)
class pdfModel{
  @HiveField(0)
  final String? filepath;
  @HiveField(1)
  final String? imagePath;
  @HiveField(2)
  final int? pageNumber;
  @HiveField(3)
  final String? notePath;
  @HiveField(4)
  final String? bookName;

  pdfModel({this.filepath, this.imagePath, this.pageNumber, this.notePath,this.bookName});

}