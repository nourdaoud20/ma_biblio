import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../models/livre.dart';

// Q3.1 : StatefulWidget obligatoire car l'écran gère des états interactifs
// (cases cochées/décochées) qui modifient l'interface utilisateur en direct.
class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;

  final Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Histoire': true,
    'Jeunesse': true,
    'Informatique': true,
  };

  IconData _getGenreIcon(String genre) {
    switch (genre) {
      case 'Roman':
        return Icons.auto_stories;
      case 'Science':
        return Icons.science;
      case 'Histoire':
        return Icons.history_edu;
      case 'Jeunesse':
        return Icons.child_care;
      case 'Informatique':
        return Icons.computer;
      default:
        return Icons.book;
    }
  }

  bool? _getEtatTousGenres() {
    final tousCoches = _genres.values.every((v) => v);
    final aucunCoche = _genres.values.every((v) => !v);

    if (tousCoches) return true;
    if (aucunCoche) return false;
    return null; // Tiret intermédiaire
  }

  void _toggleTousGenres(bool? valeur) {
    setState(() {
      final nouvelleValeur = valeur ?? false;
      _genres.updateAll((key, val) => nouvelleValeur);
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Livre> livresFiltres = livres.where((livre) {
      final genreActif = _genres[livre.genre] ?? false;
      if (!genreActif) return false;
      if (_nouveautesSeulement && !livre.nouveaute) return false;
      return true;
    }).toList();

    final int nbLus = livresFiltres.where((l) => l.lu).length;
    final int nbAffiches = livresFiltres.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ma liste (Lus : $nbLus / $nbAffiches)'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            onChanged: (bool? valeur) {

              setState(() {
                _nouveautesSeulement = valeur ?? false;
              });
            },
          ),
          const Divider(height: 1),

          CheckboxListTile(
            tristate: true,
            title: const Text(
              'Tous les genres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: _getEtatTousGenres(),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: _toggleTousGenres,
          ),

          ..._genres.keys.map((genre) {
            // Nombre de livres du genre calculé depuis la liste
            final count = livres.where((l) => l.genre == genre).length;

            return CheckboxListTile(
              dense: true,
              controlAffinity: ListTileControlAffinity.leading, // Case à gauche
              activeColor: Colors.teal,
              secondary: Icon(_getGenreIcon(genre)),
              title: Text(genre),
              subtitle: Text('$count livre(s)'),
              value: _genres[genre],
              onChanged: (bool? valeur) {
                setState(() {
                  _genres[genre] = valeur ?? false;
                });
              },
            );
          }),

          const Divider(thickness: 2),

          Expanded(
            child: ListView.separated(
              itemCount: livresFiltres.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final livre = livresFiltres[index];
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    livre.titre,
                    style: TextStyle(
                      decoration: livre.lu ? TextDecoration.lineThrough : null,
                      color: livre.lu ? Colors.grey : Colors.black,
                    ),
                  ),
                  subtitle: Text('${livre.auteur} – ${livre.genre}'),
                  secondary: CircleAvatar(
                    backgroundColor: livre.couleur,
                    child: Text(
                      livre.titre.isNotEmpty ? livre.titre[0] : '?',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  value: livre.lu,
                  onChanged: (bool? valeur) {
                    setState(() {
                      livre.lu = valeur ?? false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}