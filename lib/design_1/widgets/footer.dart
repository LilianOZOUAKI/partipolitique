import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;

    Widget link(String label, String route) {
      return TextButton(
        onPressed: () => context.go(route),
        child: Text(label, style: const TextStyle(color: Colors.white70)),
      );
    }

    Widget socialIcon(IconData icon, String url) {
      return IconButton(
        icon: FaIcon(icon, color: Colors.white70),
        onPressed:() async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      );
    }

    return Container(
      color: Colors.indigo.shade900,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: isWide ? 40 : 20,
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '© 2025 Parti Politique. Tous droits réservés.',
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          isWide
              ? Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 8,
                  children: [
                    link('Mentions légales', '/legal'),
                    link('Politique de confidentialité', '/privacy'),
                    link('Contact', '/contact'),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    link('Mentions légales', '/legal'),
                    link('Politique de confidentialité', '/privacy'),
                    link('Contact', '/contact'),
                  ],
                ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon(FontAwesomeIcons.facebookF, 'https://facebook.com'),
              socialIcon(FontAwesomeIcons.twitter, 'https://twitter.com'),
              socialIcon(FontAwesomeIcons.instagram, 'https://instagram.com'),
              socialIcon(FontAwesomeIcons.youtube, 'https://youtube.com'),
            ],
          ),
        ],
      ),
    );
  }
}
