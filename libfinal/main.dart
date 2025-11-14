import 'package:flutter/material.dart';
import 'package:projet/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Définit une couleur principale (matériau) utilisée pour générer plusieurs nuances
        // Elle est utilisée par défaut dans beaucoup de composants (FloatingActionButton, ProgressBar, etc.)
        primarySwatch: Colors.deepOrange,

        // Définit la couleur de fond par défaut pour tous les écrans (Scaffold)
        scaffoldBackgroundColor: Colors.white,

        // Couleur par défaut pour tous les icônes de l'application (hors AppBar)
        iconTheme: IconThemeData(color: Colors.white),

        // Personnalisation du style de l'AppBar pour toute l'application
        appBarTheme: AppBarTheme(
          // Couleur de fond de l'AppBar
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          // Style du texte du titre de l'AppBar
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

          // Couleur des icônes dans l'AppBar (ex. menu, retour)
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // Personnalisation de la barre de navigation du bas (BottomNavigationBar)
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          // Couleur de fond de la barre
          backgroundColor: Colors.deepOrange,

          // Couleur de l'item sélectionné (icône + texte)
          selectedItemColor: Colors.white,

          // Couleur des items non sélectionnés
          unselectedItemColor: Colors.white70,

          // Style du texte de l'item sélectionné (ici, gras)
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: MainScreen(),
    );
  }
}
