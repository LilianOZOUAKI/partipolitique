// pages/privacy_page.dart
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Politique de Confidentialité',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              Text(
                'Collecte des données',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Nous recueillons les données personnelles que vous nous fournissez '
                'volontairement lors de votre navigation sur notre site ou application. '
                'Cela peut inclure votre nom, votre adresse e-mail, ou toute autre '
                'information nécessaire à nos services.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Utilisation des données',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Vos données sont utilisées exclusivement pour améliorer votre expérience, '
                'traiter vos demandes, ou vous informer de nos actualités si vous y avez consenti.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Partage des données',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Nous ne vendons ni ne partageons vos données personnelles avec des tiers, '
                'sauf dans les cas prévus par la loi ou avec votre autorisation explicite.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Sécurité des données',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Nous mettons en œuvre toutes les mesures de sécurité appropriées pour '
                'protéger vos données personnelles contre tout accès non autorisé ou toute fuite.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Vos droits',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Conformément à la réglementation en vigueur, vous disposez d’un droit '
                'd’accès, de rectification, de suppression ou d’opposition à l’utilisation '
                'de vos données. Vous pouvez nous contacter pour exercer ces droits.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Mises à jour',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Cette politique peut être mise à jour à tout moment. Toute modification sera publiée '
                'sur cette page avec la date de mise à jour.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              SizedBox(height: 24),
              Text(
                'Dernière mise à jour : juillet 2025',
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
