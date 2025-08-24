// pages/events_page.dart
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/event_section.dart';
import '../widgets/footer.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      bottomNavigationBar: const Footer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Événements à venir',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 20),
            EventSection(),
          ],
        ),
      ),
    );
  }
}
