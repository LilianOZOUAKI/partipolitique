import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon, FontAwesomeIcons;
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;

import '../design_2/app_theme.dart' show appTheme;

class LastSection extends StatelessWidget {
  final Color backgroundColor_1;
  final Color backgroundColor_2;
  final Color textColor_1;
  final Color textColor_2;
  final Color iconColor_1;
  final Color iconColor_2;
  final Color iconColor_3;
  final Color iconColor_4;
  final Color dividerColor;

  const LastSection({
    super.key,
    this.backgroundColor_1 = Colors.white,
    this.backgroundColor_2 = Colors.white,
    this.textColor_1 = Colors.black87,
    this.textColor_2 = Colors.black87,
    this.iconColor_1 = Colors.blueAccent,
    this.iconColor_2 = Colors.white,
    this.iconColor_3 = Colors.pinkAccent,
    this.iconColor_4 = Colors.red,
    this.dividerColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    Widget socialIcon(IconData icon, String url, Color colori) {
      return IconButton(
        icon: FaIcon(icon, color: colori),
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      );
    }

    return Container(
      width: double.infinity,
      height: 768,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor_1,
            backgroundColor_2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 123.4,
                    height: 123.4,
                    child: CircleAvatar(
                      child: Text('Logo'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'NOM\n''PARTI\n''POLITIQUE',
                    style: appTheme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor_1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            runSpacing: 20,
            spacing: 100,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Siège',
                    style: appTheme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor_2,
                    ),
                  ),
                  Text(
                    "123, rue de n'importe où, n'importe quelle ville",
                    style: TextStyle(color: textColor_2),
                  ),
                  Text(
                    '01 23 45 67 89 ',
                    style: TextStyle(color: textColor_2),
                  ),
                  Text(
                    'bonjour@canvasupersite.fr',
                    style: TextStyle(color: textColor_2),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Heures d'ouverture",
                    style: appTheme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor_2,
                    ),
                  ),
                  Text(
                    'Lundi - Vendredi : 9h - 18h ',
                    style: TextStyle(color: textColor_2),
                  ),
                  Text(
                    'Samedi : 9h - 12h',
                    style: TextStyle(color: textColor_2),
                  ),
                ],
              ),
              const SizedBox(height: 10, width: 50),
            ],
          ),
          Column(
            children: [
              Divider(color: dividerColor),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Suivez-nous',
                    style: appTheme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor_1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  socialIcon(FontAwesomeIcons.facebookF, 'https://facebook.com', iconColor_1),
                  socialIcon(FontAwesomeIcons.xTwitter, 'https://twitter.com', iconColor_2),
                  socialIcon(FontAwesomeIcons.instagram, 'https://instagram.com', iconColor_3),
                  socialIcon(FontAwesomeIcons.youtube, 'https://youtube.com', iconColor_4),
                  // socialIcon(FontAwesomeIcons.google, 'https://google.com', iconColor_4),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: dividerColor),
            ],
          ),
        ],
      ),
    );
  }
}
