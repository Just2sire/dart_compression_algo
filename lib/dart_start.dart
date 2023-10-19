import 'dart:io';

int calculate() {
  return 6 * 7;
}

/**
 * Fonction pour lire un fichier avec gestion d'erreur
 */
String readFileText(String path) {
  File text = File(path);
  bool fileExist = text.existsSync();

  if (fileExist) {
    String content = text.readAsStringSync();
    return content;
  } else {
    return """
      Le fichier que vous avez spécifié n'a pas été reconnu du coup un texte générique a été crée pour faire le test de compression
      J'espère que vous avez compris le mode opératoire utilisé:
      Demain, dès l’aube, à l’heure où blanchit la campagne,
      Je partirai. Vois-tu, je sais que tu m’attends.
      J’irai par la forêt, j’irai par la montagne.
      Je ne puis demeurer loin de toi plus longtemps.

      Je marcherai les yeux fixés sur mes pensées,
      Sans rien voir au dehors, sans entendre aucun bruit,
      Seul, inconnu, le dos courbé, les mains croisées,
      Triste, et le jour pour moi sera comme la nuit.

      Je ne regarderai ni l’or du soir qui tombe,
      Ni les voiles au loin descendant vers Harfleur,
      Et quand j’arriverai, je mettrai sur ta tombe
      Un bouquet de houx vert et de bruyère en fleur.""";
  }
}

/**
 * Fonction pour écrire dans un fichier de manière sync avec gestion d'erreur
 */
bool writeTextInFile(String path, String content) {
  File text = File(path);
  bool exists = text.existsSync();

  if (!exists) {
    text.createSync();
  }
  text.writeAsStringSync(content);
  return true;
}

/**
 * Fonction qui compresse le fichier que l'on lui donne
 * @param path
 * @return list of strings
 */
List archiveFile(String path) {
  String text = readFileText(path);

  text = text.replaceAll("\n", " iln ");
  text = text.replaceAll("'", " aps ");
  text = text.replaceAll(".", " pt ");
  text = text.replaceAll(",", " vrg ");

  List<dynamic> textArray = text.split(' ');

  Map<dynamic, String> reference = {};

  for (var i = 0; i < textArray.length; i++) {
    if (textArray.indexOf(textArray[i]) != textArray.lastIndexOf(textArray[i])) {
      if (!reference.containsValue(textArray[i])) {
        // textArray[i] = reference[textArray[i]];
        // reference[textArray.indexOf(textArray[i])] = textArray[i];
        reference[i] = textArray[i];
      } else {
        int cle = 0;
        reference.forEach((key, value) {
          if (value == textArray[i]) {
            cle = key;
          }
        });
        textArray[i] = cle.toString();
      }
    }
  }
  String textCompressed = textArray.join(' ');
  print(reference);
  writeTextInFile(path, textCompressed);
  writeTextInFile(r"C:\Users\Lenovo\Documents\Mobile\Dart\dart_start\compressed.txt", textCompressed);
  return [textCompressed, reference, path];
}

/**
 * Fonction de décompression de texte
 */
String desArchiveFile(String compressedFile, Map reference, String path) {
  String text = "";
  List<dynamic> textArray = compressedFile.split(' ');
  for (var i = 0; i < textArray.length; i++) {
    int? key = int.tryParse(textArray[i]);
    if (reference.containsKey(key)) {
      textArray[i] = reference[key];
    }
    // textArray[i] = reference[i];
  }
  text = textArray.join(' ');
  text = text.replaceAll(' aps ', "'");
  text = text.replaceAll(' iln ', "\n");
  text = text.replaceAll(' pt ', ".");
  text = text.replaceAll(' vrg ', ",");
  text += "\n\nLe fichier a été compressé puis décompressé";
  bool done = writeTextInFile(path, text);
  return done
      ? "Le texte a bien été décompressé"
      : "Un problème est surevenu lors de la décompression";
}
/**/