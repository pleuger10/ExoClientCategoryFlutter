import 'dart:convert'; // Pour pouvoir utiliser jsonEncode et jsonDecode

import 'package:flutter/material.dart';

// Classe Category
class Category {
  String nom;

  Category(this.nom);

  @override
  String toString() {
    return nom;
  }
}

// Classe Client
class Client {
  String nom;
  String prenom;
  int age;
  Category category;

  Client(this.nom, this.prenom, this.age, this.category);

  // Convertir Client en JSON
  String toJson() {
    Map<String, dynamic> clientMap = {
      'nom': nom,
      'prenom': prenom,
      'age': age,
      'category': {'nom': category.nom},
    };
    return jsonEncode(clientMap);
  }

  // Convertir JSON en Client
  static Client fromJson(String jsonString) {
    Map<String, dynamic> clientMap = jsonDecode(jsonString);
    Category category = Category(clientMap['category']['nom']);
    return Client(clientMap['nom'], clientMap['prenom'], clientMap['age'], category);
  }

  @override
  String toString() {
    return 'Client[nom: $nom, prenom: $prenom, age: $age, category: ${category.nom}]';
  }
}

void main() {
  // Créer une liste de 10 catégories
  List<Category> categories = [
    Category('Category 1'),
    Category('Category 2'),
    Category('Category 3'),
    Category('Category 4'),
    Category('Category 5'),
    Category('Category 6'),
    Category('Category 7'),
    Category('Category 8'),
    Category('Category 9'),
    Category('Category 10'),
  ];

  // Créer des clients et les associer à des catégories
  List<Client> clients = [
    Client('Perez', 'Juan', 30, categories[0]),
    Client('Lemoine', 'Sophie', 25, categories[1]),
    Client('Dufresne', 'Marc', 28, categories[2]),
    Client('Dupont', 'Lucie', 35, categories[3]),
    Client('Martin', 'Pierre', 22, categories[4]),
    Client('Bernard', 'Claire', 40, categories[5]),
    Client('Lefevre', 'Antoine', 50, categories[6]),
    Client('Durand', 'Chloé', 29, categories[7]),
    Client('Pires', 'Franck', 33, categories[8]),
    Client('Gaultier', 'Nathalie', 44, categories[9]),
  ];

  // Afficher les clients dans la console
  for (var client in clients) {
    print(client);
  }

  // Lancer l'application Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
