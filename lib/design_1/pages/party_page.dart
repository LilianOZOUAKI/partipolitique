import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/party_section_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';
import '../widgets/member_section.dart';

class PartyPage extends StatefulWidget {
  const PartyPage({super.key});

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  List<PartySectionModel> sections = [];
  bool loading = true;
  bool editMode = false;

  @override
  void initState() {
    super.initState();
    _loadSections();
  }

  Future<void> _loadSections() async {
    final prefs = await SharedPreferences.getInstance();
    final savedJson = prefs.getString('party_content');

    String jsonString;
    if (savedJson != null) {
      jsonString = savedJson;
    } else {
      jsonString = await rootBundle.loadString('assets/data/party.json');
    }

    final List<dynamic> jsonData = json.decode(jsonString);

    setState(() {
      sections = jsonData.map((e) => PartySectionModel.fromJson(e)).toList();
      loading = false;
    });
  }

  // Future<void> _saveSections() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final jsonString = jsonEncode(
  //     sections
  //         .map((s) => {'title': s.title, 'content': s.content})
  //         .toList(),
  //   );
  //   await prefs.setString('party_content', jsonString);
  // }

  // void _toggleEdit() {
  //   setState(() {
  //     editMode = !editMode;
  //   });
  // }

  void _updateSectionContent(int index, String newContent) {
    setState(() {
      sections[index] = PartySectionModel(
        title: sections[index].title,
        content: newContent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      // appBar: AppBar(
      //   title: const Text('Le Parti'),
      //   actions: [
      //     IconButton(
      //       icon: Icon(editMode ? Icons.check : Icons.edit),
      //       tooltip: editMode ? 'Sauvegarder' : 'Modifier',
      //       onPressed: () async {
      //         if (editMode) {
      //           await _saveSections();
      //           ScaffoldMessenger.of(context).showSnackBar(
      //             const SnackBar(content: Text('Modifications sauvegardées')),
      //           );
      //         }
      //         _toggleEdit();
      //       },
      //     ),
      //   ],
      // ),
      bottomNavigationBar: const Footer(),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Le Parti',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 24),
                  ...sections.asMap().entries.map(
                    (entry) {
                      final idx = entry.key;
                      final section = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              section.title,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            editMode
                                ? TextFormField(
                                    initialValue: section.content,
                                    maxLines: null,
                                    onChanged: (value) => _updateSectionContent(idx, value),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  )
                                : Text(
                                    section.content,
                                    style: const TextStyle(fontSize: 16, height: 1.5),
                                  ),
                          ],
                        ),
                      );
                    },
                  ),
                  MemberSection(),
                ],
              ),
            ),
    );
  }
}
