import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../design_1/widgets/custom_app_bar.dart';
import '../design_2/app_theme.dart';

import 'custom_app_bar_3.dart';
import 'last_section_3.dart';

class ColistierPage3 extends StatelessWidget {
  const ColistierPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar3(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer3() 
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Section1(),
              ColistiersPage(),
              LastSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Notre Équipe – Ensemble pour [Nom de la Commune]',
            style: appTheme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 2),
          const SizedBox(height: 16),
          Text(
            'Mes colistiers et moi formons une équipe soudée, engagée et compétente, prête à travailler avec et pour les habitants. '
            'Notre force, c’est notre diversité et notre proximité avec le terrain.',
            style: appTheme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ColistiersPage extends StatefulWidget {
  const ColistiersPage({super.key});

  @override
  State<ColistiersPage> createState() => _ColistiersPageState();
}

class _ColistiersPageState extends State<ColistiersPage> {
  List<dynamic> _colistiers = [];

  @override
  void initState() {
    super.initState();
    _loadColistiers();
  }

  Future<void> _loadColistiers() async {
    final String response =
        await rootBundle.loadString('assets/data/colistiers.json');
    final data = json.decode(response);
    setState(() {
      _colistiers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_colistiers.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: Wrap(
          spacing: 40,
          runSpacing: 40,
          alignment: WrapAlignment.center,
          children: _colistiers.asMap().entries.map((entry) {
            final index = entry.key;
            final colistier = entry.value;
            return _ColistierCard(
              colistier: colistier,
              delay: Duration(milliseconds: 100 * index),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ColistierCard extends StatefulWidget {
  final Map<String, dynamic> colistier;
  final Duration delay;
  const _ColistierCard({required this.colistier, required this.delay});

  @override
  State<_ColistierCard> createState() => _ColistierCardState();
}

class _ColistierCardState extends State<_ColistierCard>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 500),
        offset: _visible ? Offset.zero : const Offset(0, 0.2),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            transform: _hovering
                ? (Matrix4.identity()..scale(1.05))
                : Matrix4.identity(),
            width: isSmallScreen ? double.infinity : 300,
            constraints: const BoxConstraints(maxWidth: 320),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: _hovering
                  ? LinearGradient(
                      colors: [
                        Colors.blue.shade50,
                        Colors.green.shade50,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: _hovering ? null : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:  _hovering ? 0.25 : 0.1),
                  blurRadius: _hovering ? 20 : 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.colistier['nom'],
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.colistier['role'],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.green[800],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.colistier['responsabilite'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all()
                    ),
                    height: 180,
                    width: 180,
                    // child: ,
                    ),
                ),
                const SizedBox(height: 12),
                Divider(),
                const SizedBox(height: 12),
                Text(
                  widget.colistier['citation'],
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
