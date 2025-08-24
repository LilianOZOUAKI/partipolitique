import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/event_model.dart';
import 'event_card.dart';

class EventSection extends StatefulWidget {
  const EventSection({super.key});

  @override
  State<EventSection> createState() => _EventSectionState();
}

class _EventSectionState extends State<EventSection> {
  List<EventModel> _allEvents = [];
  List<EventModel> _filteredEvents = [];
  bool _loading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final String jsonString = await rootBundle.loadString('assets/data/events.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final events = jsonData.map((e) => EventModel.fromJson(e)).toList();

    setState(() {
      _allEvents = events;
      _filteredEvents = events;
      _loading = false;
    });
  }

  void _filterEvents(String query) {
    final filtered = _allEvents.where((event) {
      final titleLower = event.title.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower);
    }).toList();

    setState(() {
      searchQuery = query;
      _filteredEvents = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titre dynamique
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Événements à venir (${_filteredEvents.length})',
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        // Barre de recherche
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Rechercher un événement',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: _filterEvents,
          ),
        ),
        const SizedBox(height: 16),

        // Liste
        _loading
            ? const Center(child: CircularProgressIndicator())
            : _filteredEvents.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Aucun événement trouvé.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 700; // seuil pour basculer en grille

                        if (isWide) {
                          // ✅ Grille pour écrans larges
                          return GridView.builder(
                            key: ValueKey('grid-${_filteredEvents.length}'),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredEvents.length,
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.5,
                            ),
                            itemBuilder: (context, index) {
                              final event = _filteredEvents[index];
                              return EventCard(event: event);
                            },
                          );
                        } else {
                          // ✅ Liste pour mobiles
                          return ListView.builder(
                            key: ValueKey('list-${_filteredEvents.length}'),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredEvents.length,
                            itemBuilder: (context, index) {
                              final event = _filteredEvents[index];
                              return EventCard(event: event);
                            },
                          );
                        }
                      },
                    ),
                  )

      ],
    );
  }
}
