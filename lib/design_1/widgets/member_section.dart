import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/member_model.dart';
import 'member_card.dart';

class MemberSection extends StatefulWidget {
  const MemberSection({super.key});

  @override
  State<MemberSection> createState() => _MemberSectionState();
}

class _MemberSectionState extends State<MemberSection> {
  List<MemberModel> _members = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadMembers();
  }

  Future<void> _loadMembers() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/members.json');
      final List<dynamic> jsonData = json.decode(jsonString);
      final members = jsonData.map((e) => MemberModel.fromJson(e)).toList();
      setState(() {
        _members = members;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      debugPrint('Erreur chargement membres: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_members.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Aucun membre disponible.', style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _members.length,
      itemBuilder: (context, index) {
        return MemberCard(member: _members[index]);
      },
    );
  }
}
