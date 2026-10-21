import 'package:flutter/material.dart';
import '../models/livre.dart';

// Q4.8 : Doit être un StatefulWidget car l'état des favoris et de lecture change dynamiquement
class DetailScreen extends StatefulWidget {
  final Livre livre;

  const DetailScreen({super.key, required this.livre});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final livre = widget.livre;

    return Scaffold(
      appBar: AppBar(
        title: Text(livre.titre),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // En-tête de 200 px avec couleur de couverture et grand titre
              Container(
                height: 200,
                color: livre.couleur,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  livre.titre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Trois ListTile d'informations
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Auteur'),
                subtitle: Text(livre.auteur),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Année de publication'),
                subtitle: Text('${livre.annee}'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Genre'),
                subtitle: Text(livre.genre),
              ),
              const Divider(height: 1),

              // Rangée d'actions en bas (OverflowBar)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: OverflowBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Bouton Favoris qui bascule livre.favori
                    TextButton.icon(
                      icon: Icon(
                        livre.favori ? Icons.favorite : Icons.favorite_border,
                        color: livre.favori ? Colors.red : Colors.grey,
                      ),
                      label: Text(
                        livre.favori ? 'Favori' : 'Ajouter aux favoris',
                      ),
                      onPressed: () {
                        setState(() {
                          livre.favori = !livre.favori;
                        });
                      },
                    ),

                    // Bouton Marquer comme lu
                    TextButton.icon(
                      icon: Icon(
                        livre.lu ? Icons.check_circle : Icons.check_circle_outline,
                        color: livre.lu ? Colors.green : Colors.grey,
                      ),
                      label: Text(
                        livre.lu ? 'Déjà lu' : 'Marquer comme lu',
                      ),
                      onPressed: () {
                        setState(() {
                          livre.lu = !livre.lu;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}