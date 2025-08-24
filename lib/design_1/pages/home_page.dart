// pages/home_page.dart
import 'package:flutter/material.dart';

import '../widgets/call_to_action_buttons.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/event_section.dart';
import '../widgets/footer.dart';
import '../widgets/hero_banner.dart';
import '../widgets/news_section.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 270,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/lbv_4.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                // Positioned.fill(
                //   child: Image.asset(
                //     'assets/images/1234.png',
                //     fit: BoxFit.fitHeight,
                //     scale: 2,
                //   ),
                // ),
              ],
            ),
          ),
          HeroBanner(
            title: "Ensemble pour une nouvelle vision du pays",
            subtitle: "Un programme ambitieux pour les jeunes et l'avenir du Gabon",
            icon: Icons.flag,
          ),
          NewsSection(),
          EventSection(),
          CallToActionButtons(),
          // Footer(),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
