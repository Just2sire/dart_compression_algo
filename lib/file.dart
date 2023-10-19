import 'dart:io';

void main() {
    // String name = askName();
  // int age = askAge()
  // print("$name il vous reste ${100 - age} ans pour avoir 100 ans");

  // int nbre1 = getNumber("1er");
  // int nbre2 = getNumber("2eme")
  // print("""
  // L'addition des deux nombres donne: ${nbre1 + nbre2}
  // La multiplication des deux nombres donne: ${nbre1 * nbre2}
  // """);

  // int nbr = getNbr();
  // if ((nbr % 2) == 0) {
  //   print("Le nombre est pair");
  // } else {
  // }

  // List<int> a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 53, 23, 82, 100];
  // for (var nb in a) {
  //   nb > 5 ? print(nb) : null;
  // }

  // List<int> list = getDiviseur();
  // print(list);

  // var a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  // var b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  // List<int> sortedArray = sortArray(a, b);
  // print(sortedArray);

  // double moyenne = getMoyenne(a);
  // print(moyenne);

  // stderr.writeln("Entrer votre genre (M/F)");
  // String genre = stdin.readLineSync().toString();
  // stderr.writeln("Entrer votre age");
  // var age = int.parse(stdin.readLineSync()!);
  // bool isPregnant = false;
  // if (genre == "F") {
  //   stderr.writeln("Etes vous enceinte (o/n)");
  //   String pregnant = stdin.readLineSync().toString();
  //   isPregnant = pregnant == 'o' ? true : false;
  // }
  // String bilan = prescription(genre, age, isPregnant);
  // print(bilan);

}



/**
 * Méthode de récupération de la prescriptio 
 */
String prescription(String genre, int age, bool isPregnant) {
  if (genre == 'F' && isPregnant == true) {
    return "Le produit conseillé est le produit B et C";
  } else if (genre == 'M' && age > 50) {
    return "Le produit conseillé est le produit A et C";
  } else {
    return "Vous pouvez prendre le produit A, B comme C";
  }
  // return "";
}

/**
 * Méthode de calcul de la moyenne
 */
double getMoyenne(List<int> notes) {
  int somme = notes.reduce((value, element) => value += element);
  double moyenne = somme / notes.length;
  return moyenne;
}

/**
 * Méthode de tri de tableau
 */
List<int> sortArray(List<int> firstArray, List<int> secondArray) {
  List<int> allTables = firstArray + secondArray;
  List<int> finalArray = [];
  for (var elmt in allTables) {
    !finalArray.contains(elmt) ? finalArray.add(elmt) : null;
  }
  // List<int> sortedArray = finalArray.sort();
  return finalArray;
}

/**
 * Méthode de récupération des diviseurs
 */
List<int> getDiviseur() {
  stderr.writeln("Entrer un nombre");
  var nbre = int.parse(stdin.readLineSync()!);
  List<int> list = [];
  for (var i = nbre; i > 0; i--) {
    (nbre % i) == 0 ? list.add(i) : null;
  }
  return list;
}

/**
 * Méthode pour récupérer un nombre
 */
int getNbr() {
  stderr.writeln("Entrer un nombre");
  var nbre = stdin.readLineSync();
  return int.parse(nbre!);
}

/**
 * Méthode pour récupérer un nombre selon le ranf
 */
int getNumber(String rang) {
  stderr.writeln("Entrer le $rang nombre");
  var nbre = stdin.readLineSync();
  return int.parse(nbre!);
}

/**
 * Méthode pour demander le nom
 */
String askName() {
  stderr.writeln("Quel est votre nom ?");
  var nom = stdin.readLineSync();
  return nom.toString();
}

/**
 * Méthode pour demander l'age
 */
int askAge() {
  stderr.writeln("Quel est votre age ?");
  var age = stdin.readLineSync();
  return int.parse(age!);
}
