import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar3({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      title: SizedBox(child: const Text('Parti Politique')),
      actions: isMobile
          ? null // pas d'actions directes, menu burger
          : _navItems(context),
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }

  List<Widget> _navItems(BuildContext context) {
    return [
      
      _navItem(context, '/', 'Accueil'),
      // _navItem(context, '/home2', 'Accueil2'),
      _navItem(context, '/home3', 'Accueil3'),
      
      _navItem(context, '/parti3', 'Le Parti3'),
      _navItem(context, '/projet3', 'Projet3'),
      _navItem(context, '/colistier3', 'Colistier3'),
      _navItem(context, '/join3', 'Adhérer3'),
      // _navItem(context, '/actualites', 'Actualités'),
      // _navItem(context, '/evenements', 'Événements'),
    ];
  }

  Widget _navItem(BuildContext context, route, String label) {
    return MaterialButton(
      onPressed: () => context.go(route),
      color: Colors.indigo,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}

class AppDrawer3 extends StatelessWidget {
  const AppDrawer3({super.key});

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
          // _drawerItem(context, '/home2', 'Accueil2'),
          _drawerItem(context, '/home3', 'Accueil3'),
          Divider(),
          _drawerItem(context, '/parti3', 'Le Parti3'),
          _drawerItem(context, '/projet3', 'Projet3'),
          _drawerItem(context, '/colistier3', 'Colistier3'),
          _drawerItem(context, '/join3', 'Adhérer3'),
          Divider(),
          // _drawerItem(context, '/legal', 'Mentions Légales'),
          // _drawerItem(context, '/privacy', 'Politique de Confidentialité'),
        ],
      ),
    );
  }

  ListTile _drawerItem(BuildContext context,  route, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // ferme le drawer
        context.go(route);
        // Navigator.push(context, route);
      },
    );
  }
}
