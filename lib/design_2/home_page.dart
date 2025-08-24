import 'package:flutter/material.dart';
import '../design_1/widgets/custom_app_bar.dart';
import 'app_theme.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});
  
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 900;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero section
                  _buildHeroSection(context, isWide),
                  const SizedBox(height: 48),

                  // About / Vision
                  _buildVisionSection(context, isWide),
                  const SizedBox(height: 48),

                  // Call to action buttons
                  _buildCallToAction(context, isWide),
                  const SizedBox(height: 48),

                  // Latest news preview (placeholder)
                  _buildNewsPreview(context, isWide),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: appTheme.primaryColor,
        padding: const EdgeInsets.all(12),
        child: Text(
          '© 2025 Parti Politique. Tous droits réservés.',
          textAlign: TextAlign.center,
          style: appTheme.textTheme.bodyMedium?.copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isWide) {
    return Flex(
      direction: isWide ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: isWide ? 5 : 0,
          child: Column(
            crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text(
                'Ensemble pour une nouvelle vision du pays',
                style: appTheme.textTheme.headlineLarge?.copyWith(
                  color: appTheme.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: isWide ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Unissons nos forces pour bâtir un Gabon plus juste, durable et prospère. '
                'Notre parti vous invite à rejoindre ce mouvement citoyen.',
                style: appTheme.textTheme.bodyLarge,
                textAlign: isWide ? TextAlign.left : TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.how_to_vote),
                label: const Text('Adhérez dès maintenant'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 6,
                ),
                onPressed: () {
                  // Navigate or do something
                },
              ),
            ],
          ),
        ),
        if (isWide) const SizedBox(width: 48),
        Expanded(
          flex: isWide ? 5 : 0,
          child: Container(
            margin: isWide ? null : const EdgeInsets.only(top: 40),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildVisionSection(BuildContext context, bool isWide) {
    final visionItems = [
      {
        'icon': Icons.verified_user,
        'title': 'Transparence',
        'desc': 'Nous agissons avec honnêteté et responsabilité envers tous les citoyens.',
      },
      {
        'icon': Icons.eco,
        'title': 'Développement durable',
        'desc': 'Protéger notre environnement est au cœur de notre programme.',
      },
      {
        'icon': Icons.group,
        'title': 'Participation citoyenne',
        'desc': 'Chaque voix compte dans la construction de notre avenir commun.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nos engagements', style: appTheme.textTheme.headlineMedium),
        const SizedBox(height: 16),
        isWide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: visionItems
                    .map((item) => Expanded(
                          child: _buildVisionCard(
                            icon: item['icon'] as IconData,
                            title: item['title'] as String,
                            description: item['desc'] as String,
                          ),
                        ))
                    .toList(),
              )
            : Column(
                children: visionItems
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: _buildVisionCard(
                            icon: item['icon'] as IconData,
                            title: item['title'] as String,
                            description: item['desc'] as String,
                          ),
                        ))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildVisionCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Icon(icon, size: 48, color: appTheme.colorScheme.secondary),
            const SizedBox(height: 12),
            Text(title,
                style: appTheme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text(description,
                style: appTheme.textTheme.bodyLarge,
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToAction(BuildContext context, bool isWide) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 24,
        runSpacing: 16,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.how_to_vote),
            label: const Text('Adhérer'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 5,
            ),
            onPressed: () {
              // Naviguer vers page adhésion
            },
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.volunteer_activism),
            label: const Text('Faire un don'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              side: BorderSide(color: appTheme.colorScheme.secondary, width: 2),
            ),
            onPressed: () {
              // Naviguer vers page don
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNewsPreview(BuildContext context, bool isWide) {
    // Placeholder pour section news avec 3 mini-cards
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dernières actualités', style: appTheme.textTheme.headlineMedium),
        const SizedBox(height: 16),
        isWide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) => _buildNewsCard(index)),
              )
            : Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: _buildNewsCard(index),
                  );
                }),
              ),
      ],
    );
  }

  Widget _buildNewsCard(int index) {
    final sampleTitles = [
      'Lancement de la campagne nationale',
      'Rencontre avec les jeunes leaders',
      'Programme en faveur de l’éducation',
    ];

    final sampleDates = [
      '2025-08-01',
      '2025-08-05',
      '2025-08-10',
    ];

    final sampleDescriptions = [
      'Notre parti lance officiellement sa campagne à travers le pays.',
      'Des échanges constructifs avec la nouvelle génération engagée.',
      'Focus sur l’amélioration du système éducatif et des infrastructures.',
    ];

    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sampleTitles[index],
                  style: appTheme.textTheme.headlineSmall?.copyWith(
                    color: appTheme.primaryColor,
                  )),
              const SizedBox(height: 8),
              Text(sampleDates[index],
                  style: appTheme.textTheme.bodyMedium
                      ?.copyWith(fontStyle: FontStyle.italic)),
              const SizedBox(height: 12),
              Text(sampleDescriptions[index], style: appTheme.textTheme.bodyLarge),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    // Ouvrir détails news
                  },
                  child: Text(
                    'Lire plus',
                    style: TextStyle(color: appTheme.colorScheme.secondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
