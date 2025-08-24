// pages/legal_page.dart
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

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
                'Mentions Légales',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Ici, vous pouvez mettre le contenu légal de votre site, '
                'comme l\'identité de l\'éditeur, les conditions d\'utilisation, '
                'les responsabilités, etc.',
                style: TextStyle(fontSize: 16),
              ),
              // Ajoute ici plus de contenu selon tes besoins
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
