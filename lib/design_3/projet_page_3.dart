import 'package:flutter/material.dart';

// import '../design_1/widgets/custom_app_bar.dart';
import '../design_2/app_theme.dart';

import 'custom_app_bar_3.dart';
import 'last_section_3.dart';

class ProjetPage3 extends StatelessWidget {
  const ProjetPage3({super.key});

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
              Section6(),
              Section7(),
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
    return SizedBox(
      // 1 ere Section
      width: double.infinity,
      height: 768,
      child: Stack(
        children: [
          // Positioned.fill(child: Placeholder()),
          Positioned.fill(
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 100,
              spacing: 50, 
              children: [
                // affiche
                SizedBox(
                  width: 400,
                  height: 350,
                  // child: Image.asset('assets/images/'),
                ),
                // Texte
                SizedBox(
                  width: 600,
                  height: 250,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Column(
                        children: [
                          Text('Vision',
                style: appTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                          Divider(color: Colors.green),
                          Text('Faire de [Nom de la commune] une ville dynamique, propre, sûre et solidaire, où chaque habitant bénéficie de services publics de qualité et d’opportunités économiques locales.'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
    return Wrap(
      runAlignment: WrapAlignment.spaceAround,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 50,
      spacing: 50,
      children: [
        SizedBox(
          height: 350,
          width: 300,
          child: Icon(Icons.photo),
        ),
        SizedBox(
          width: 700,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  Text('Valeurs',
                    style: appTheme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,)),
                  Divider(color: Colors.green),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('• Transparence dans la gestion des ressources publiques'),
                        Text('• Proximité avec les habitants'),
                        Text('• Solidarité pour ne laisser personne de côté'),
                        Text('• Innovation pour moderniser les services municipaux'),
                        Text('• Respect de l’environnement pour un cadre de vie sain'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 300,
        width: 700,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              children: [
                Text('Priorités stratégiques',
                  style: appTheme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                ),
                Divider(color: Colors.green),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Développement économique local'),
                      Text('Amélioration des infrastructures'),
                      Text('Éducation et jeunesse'),
                      Text('Santé et cadre de vie'),
                      Text('Gouvernance et participation citoyenne'),
                    ],
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

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 40,
        spacing: 10,
        children: [
          SizedBox(
            height:260,
            width: 500,
            child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Développement économique local',
                                style: appTheme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    Divider(color: Colors.blueAccent),
                    Text("""Soutien aux petites entreprises et aux artisans par des allègements fiscaux municipaux ou aides à l’installation
          
          Création d’un marché municipal rénové pour dynamiser le commerce local
          
          Promotion du tourisme local et de l’identité culturelle""", textAlign: TextAlign.justify,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 260,
            width: 500,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Amélioration des infrastructures',
                                style: appTheme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    Divider(color: Colors.blueAccent),
                    Text("""Réhabilitation des routes, éclairage public et réseaux d’eau
          
          Création ou rénovation d’espaces publics : parcs, aires de jeux, marchés
          
          Modernisation du service de collecte des déchets""", textAlign: TextAlign.justify,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 260,
            width: 500,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Éducation et jeunesse',
                                style: appTheme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    Divider(color: Colors.blueAccent),
                    Text("""Rénovation des écoles et amélioration des équipements scolaires
          
          Mise en place de bibliothèques de quartier et centres multimédias
          
          Programmes de soutien scolaire et bourses municipales pour élèves méritants""",  textAlign: TextAlign.justify,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: 500,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Santé et cadre de vie',
                                style: appTheme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    Divider(color: Colors.blueAccent),
                    Text("""Renforcement des centres de santé municipaux
            
            Campagnes régulières de propreté et d’assainissement
            
            Lutte contre l’insalubrité et amélioration de la gestion des eaux usées""", textAlign: TextAlign.justify,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            width: 500,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gouvernance et participation citoyenne',
                                style: appTheme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    Divider(color: Colors.blueAccent),
                    Text("""Conseil municipal ouvert une fois par trimestre pour écouter directement les habitants
            
            Publication en ligne du budget et des projets financés
            
            Mise en place d’un numéro vert pour signaler problèmes et suggestions""", textAlign: TextAlign.justify,),
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

class Section6 extends StatelessWidget {
  const Section6({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 6 eme Section
      width: double.infinity,
      height: 768,
      child: Stack(
        children: [
          Positioned.fill(child: Placeholder()),
          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: 600,
                width: 
                  MediaQuery.of(context).size.width < 1000 ? double.infinity : 900 ,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Plan d’action sur 5 ans',
                    style: appTheme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                        Divider(color: Colors.green),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('2025',style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Audit complet des finances et infrastructures, lancement des travaux prioritaires (routes, éclairage)'),
                    SizedBox(height: 20),
                    Text('2026',style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Modernisation des marchés, installation de points d’eau et poubelles publiques'),
                    SizedBox(height: 20),
                    Text('2027',style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Réhabilitation des écoles, lancement du programme bourses et soutien scolaire'),
                    SizedBox(height: 20),
                    Text('2028',style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Mise en place de programmes touristiques et événements culturels annuels'),
                    SizedBox(height: 20),
                    Text('2029',style: appTheme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Évaluation globale, ajustement et consolidation des acquis'),
                  ],
                ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Section7 extends StatelessWidget {
  const Section7({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 7 eme Section
      width: double.infinity,
      height: 768,
      child: Stack(
        children: [
          Positioned.fill(child: Placeholder()),
          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width < 800 ? double.infinity : 700 ,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Engagement personnel',
                    style: appTheme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
                        Divider(color: Colors.green),
                        Text("Je m’engage à travailler avec honnêteté, à rendre compte de chaque dépense, et à impliquer les habitants dans chaque grande décision. Ensemble, nous construirons une commune où il fait bon vivre.")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
