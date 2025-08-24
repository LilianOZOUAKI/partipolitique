import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

// import '../design_1/widgets/custom_app_bar.dart';
import '../design_2/app_theme.dart';

import 'custom_app_bar_3.dart';
import 'last_section_3.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
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
              Section2(),
              Section3(),
              Section4(),
              Section5(),
              Section6(),
              LastSection(
                backgroundColor_1: Colors.black,
                backgroundColor_2: Colors.black54,
                textColor_1: Colors.white,
                textColor_2: Colors.white,
                dividerColor: Colors.white,
              ),
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
    return SizedBox(
      // 1 ere Section
      width: double.infinity,
      height: 768,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/lbv_5.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.white.withValues(alpha: .9),
            )
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: 400,
                height: 260,
                color: Colors.white10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: 20),
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
                            style: appTheme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Divider(color: Colors.green.shade900),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  40.0, vertical: 20),
          child: Text(
            'Notre idéal, construire',
            style: appTheme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              ),
            ),
        ),
        Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          runSpacing: 20,
          spacing: 20,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Icon(Icons.photo),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      """Un projet 100% tourné vers l’action locale, avec des résultats visibles dès la première année.\n"""
                """Contrairement aux programmes vagues ou uniquement """
                  """basés sur de grandes promesses, le vôtre :
                  Part de la réalité du terrain
                  Diagnostic précis des besoins de chaque quartier
                  Priorité aux urgences locales (eau, routes, propreté, santé)
                  Met les citoyens au cœur des décisions
                  Réunions publiques régulières
                  Budget et projets publiés en toute transparence
                  Consultation avant chaque grand investissement
                  """, textAlign: TextAlign.justify,),
                  ),
                  ElevatedButton(
                    onPressed: () => context.go('/projet3'), 
                    child: Text('En savoir plus'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: [
          Divider(color: Colors.blueAccent),
          Wrap(
            runAlignment: WrapAlignment.spaceEvenly,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 40,
            spacing: 40,
            children: [
              SizedBox(
                height: 300,
                width: 250,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            'Notre vision :',
                            style: appTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Divider(color: Colors.blueAccent),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('Une commune propre, sûre et prospère, où chaque habitant trouve sa place.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: 250, 
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Nos 5 priorités :',
                            style: appTheme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        ),
                      ),
                      Divider(color: Colors.blueAccent),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Travaux et propreté'),
                            Text('Économie locale'),
                            Text('Écoles rénovées'),
                            Text('Santé pour tous'),
                            Text('Citoyens au cœur des décisions'), 
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                width: 250, 
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Notre engagement',
                          style: appTheme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                      Divider(color: Colors.blueAccent),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Transparence totale, résultats concrets dès la première année.'), 
                                Text('Un mandat au service des habitants, pas des intérêts personnels',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(color: Colors.blueAccent),
        ],
      ),
    );
  }
}

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: 20,
          spacing: 20,
          runAlignment: WrapAlignment.spaceEvenly,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Événements à venir',
                  style: appTheme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 250,
                width: 200,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.photo),
                      Text('30 août 2030'),
                      Divider(),
                      Text('Forum Économie Locale',
                            style: appTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      Text('Parc harmonieux')
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 250,
                width: 200,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.photo),
                      Text('23 octobre 2030'),
                      Divider(),
                      Text('Soirée Débat Citoyen',
                            style: appTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      Text('Place communautaire')
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 250,
                width: 200,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.photo),
                      Text('20-22 novembre 2030'),
                      Divider(),
                      Text('Marche pour la Santé',
                            style: appTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      Text('Local de Style de vie moderne')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(color: Colors.white)
      ],
    );
  }
}

class Section5 extends StatelessWidget {
  const Section5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade900,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 500,
            width: double.infinity,
            child: Image.asset(
              'assets/images/pp2.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Divider(color: Colors.green.shade900),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              runSpacing: 20,
              spacing: 20,
              children: [
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Text('Local de Style de vie moderne',
                        style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text('01 23 45 67 89', style: TextStyle(color: Colors.white)), 
                      Text("Heures d'ouverture : 10 h - 21 h", style: TextStyle(color: Colors.white)),  
                      Text('tous les jours (sauf les jours fériés)', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Text('3É, centre commercial du nord-est',
                        style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text('01 23 45 67 89', style: TextStyle(color: Colors.white)), 
                      Text("Horaires d'ouverture : 10 h - 22 h", style: TextStyle(color: Colors.white)), 
                      Text('tous les jours (sauf les jours fériés)', style: TextStyle(color: Colors.white)), 
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.green.shade900),
        ],
      ),
    );
  }
}
class Section6 extends StatelessWidget {
  const Section6({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.spaceEvenly,
      runSpacing: 20,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: SizedBox(
            // height: 200,
            width: 300,
            child: Column(
              children: [
                Text('Question fréquentes',
                  style: appTheme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    ),
                  ),
                Divider(color: Colors.green),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Comment ',
                          style: appTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text('allez-vous financer vos  projets ?'),
                      ],
                    ),
                    Text('    En optimisant le budget communal, en réduisant les dépenses inutiles et en recherchant des partenariats avec l’État, les ONG et les investisseurs locaux. Chaque franc dépensé sera justifié et visible par tous.'),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Pourquoi ',
                          style: appTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text('devrions-nous vous faire confiance ?'),
                      ],
                    ),
                    Text('    Parce que je m’engage à travailler avec transparence, à rendre compte régulièrement aux citoyens et à impliquer chaque quartier dans les décisions importantes. Mon seul intérêt est celui de la commune.'),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Quand',
                          style: appTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text(' verrons-nous les premiers résultats ?'),
                      ],
                    ),
                    Text('    Dès la première année, avec des actions visibles : éclairage public, propreté, amélioration des points d’eau et routes prioritaires.'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
