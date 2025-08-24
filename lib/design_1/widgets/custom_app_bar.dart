import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      title: const Text('Parti Politique'),
      actions: isMobile
          ? null // pas d'actions directes, menu burger
          : _navItems(context),
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }

  List<Widget> _navItems(BuildContext context) {
    return [
      _navItem(context, '/', 'Accueil'),
      _navItem(context, '/parti', 'Le Parti'),
      _navItem(context, '/programme', 'Programme'),
      _navItem(context, '/actualites', 'Actualités'),
      _navItem(context, '/evenements', 'Événements'),
      // _navItem(context, '/contact', 'Contact'),
      _navItem(context, '/adhesion', 'Adhérer'),
      // _navItem(context, '/home2', 'Accueil2'),
    ];
  }

  Widget _navItem(BuildContext context, String route, String label) {
    return MaterialButton(
      onPressed: () => context.go(route),
      color: Colors.indigo,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo.shade900),
            child: Text('Parti Politique', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _drawerItem(context, '/', 'Accueil'),
          Divider(),
          _drawerItem(context, '/parti', 'Le Parti'),
          _drawerItem(context, '/programme', 'Programme'),
          _drawerItem(context, '/actualites', 'Actualités'),
          _drawerItem(context, '/evenements', 'Événements'),
          _drawerItem(context, '/contact', 'Contact'),
          _drawerItem(context, '/adhesion', 'Adhérer'),
          Divider(),
          _drawerItem(context, '/legal', 'Mentions Légales'),
          _drawerItem(context, '/privacy', 'Politique de Confidentialité'),
          Divider(),
          _drawerItem(context, '/home2', 'Accueil2'),
          Divider(),
          _drawerItem(context, '/home3', 'Accueil3'),
          _drawerItem(context, '/parti3', 'Parti3'),
          _drawerItem(context, '/projet3', 'Projet3'),
          _drawerItem(context, '/colistier3', 'Colistier3'),
          _drawerItem(context, '/join3', 'Adhérer3'),

        ],
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, String route, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // ferme le drawer
        context.go(route);
      },
    );
  }
}
