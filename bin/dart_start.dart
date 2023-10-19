import 'package:dart_start/dart_start.dart';

// import 'package:test/test.dart';

void main(List<String> arguments) {
  List compressedFile = archiveFile(
      r"C:\Users\Lenovo\Documents\Mobile\Dart\dart_start\file2.txt");
  String decompressedFile =
      desArchiveFile(compressedFile[0], compressedFile[1], compressedFile[2]);
  print(decompressedFile);
  // print(calculRedevanceOtr(unitPrice: 10, qte: 5));
}

num calculRedevanceOtr({
    required int unitPrice,
    required int qte,
    int tvaPercentage = 18,
    int reduction = 100
  }) {
  return ((unitPrice * qte) * tvaPercentage) / 100;
}
