import 'package:flutter/material.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: Column(
        children: [
          // Q1.1 & Q1.2 : Mon profil avec SnackBar
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon profil'),
            subtitle: const Text('Nom, e-mail, mot de passe'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profil sélectionné')),
              );
            },
          ),

          // Q1.5 : Notifications personnalisées
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            tileColor: Colors.grey.shade200,
            iconColor: Colors.blue,
            textColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {},
          ),

          // Q1.3 : Langue
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Langue'),
            subtitle: const Text('Français'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          // Q1.4 : À propos
          // dense: true -> réduit la hauteur du ListTile
          // isThreeLine: true -> permet d'avoir 2 lignes de sous-titre
          // enabled: false -> désactive le clic et grise le texte
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('À propos'),
            subtitle: Text(
              'Application MaBiblio v1.0\nDéveloppée avec Flutter',
            ),
            dense: true,
            isThreeLine: true,
            enabled: true,
          ),
        ],
      ),
    );
  }
}
