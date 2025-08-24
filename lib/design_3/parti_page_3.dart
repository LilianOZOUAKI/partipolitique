import 'package:flutter/material.dart';

// import '../design_1/widgets/custom_app_bar.dart';
import '../design_2/app_theme.dart';

import 'custom_app_bar_3.dart';
import 'last_section_3.dart';

class PartiPage3 extends StatelessWidget {
  const PartiPage3({super.key});

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 180,
          // color: Colors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/lbv_4.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.white54,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.greenAccent.shade700.withValues(alpha: .45),
                ),
              ),
              Positioned.fill(child: Padding(
                padding: EdgeInsets.only(left: 50, top: 50),
                child: Text('Notre idéal, construire',
                style: appTheme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 800,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text('Présentation',
                          style: appTheme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("""Notre parti politique est né d'une volonté forte de promouvoir la justice, la démocratie et le développement durable pour notre pays. Nous croyons en un avenir où chaque citoyen a une voix et des opportunités égales, dans une société fondée sur la solidarité, la responsabilité et la liberté. Nous plaçons l'humain et la dignité au cœur de notre action politique."""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(color: Colors.green),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  width: 800,
                  child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text('Historique',
                          style: appTheme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text("""Fondé en 2010 par un collectif de citoyens engagés issus de divers horizons, notre parti a su fédérer les forces progressistes autour d’un idéal commun : la transformation sociale par une gouvernance inclusive et éthique. Depuis notre première participation aux élections locales en 2011, nous avons multiplié les initiatives citoyennes et consolidé notre présence sur le terrain à travers des campagnes, des forums populaires et des actions solidaires."""),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 100,
      children: [
        Column(
          children: [
            Text('Valeurs',
              style: appTheme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 500,
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("""Nos valeurs fondamentales guident chacune de nos décisions et reflètent notre vision d'une nation équitable et résiliente :
                                    
                                    • Justice sociale : pour que chacun accède aux droits fondamentaux.
                                    
                                    • Transparence et intégrité : dans la gestion des affaires publiques.
                                    
                                    • Écologie et développement durable : pour préserver notre environnement.
                                    
                                    • Participation citoyenne : renforcer la démocratie de proximité.
                                    
                                    • Unité et paix nationale : au-dessus des divisions partisanes ou ethniques.
                                    
                                    • Égalité des chances : en particulier pour les femmes, les jeunes et les minorités.""",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 400,
          width: 200,
          child: Icon(Icons.photo),
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
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 40,
        children: [
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Text('Organisation',
                      style: appTheme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                      )),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Text(
                        'Notre parti est structuré de manière décentralisée avec des antennes régionales, des comités locaux et des cellules thématiques. Chaque membre peut s’impliquer dans les organes de décision selon des règles claires et démocratiques. Le Congrès National se tient tous les 3 ans pour fixer les grandes orientations stratégiques.',
                                style: appTheme.textTheme.bodyMedium,
                                textAlign: TextAlign.center),
                  )),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Text('LeaderShip',
                      style: appTheme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                      )),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Text(
                      'Le leadership du parti repose sur une direction collégiale, composée de membres élus démocratiquement. La Présidence du parti est assurée par un(e) président(e) assisté(e) d’un Bureau Politique et d’un Secrétariat Exécutif. Nous encourageons le renouvellement générationnel et l’égalité de représentation dans nos instances dirigeantes.',
                                style: appTheme.textTheme.bodyMedium,
                                textAlign: TextAlign.center),
                  )),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Text('Statuts',
                      style: appTheme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                      )),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Text(
                      "Les statuts du parti définissent l'organisation interne, les droits et devoirs des membres, ainsi que les procédures pour les prises de décision, les candidatures, les cotisations et les sanctions disciplinaires. Ces statuts sont accessibles en version intégrale sur notre site web ou sur simple demande auprès du secrétariat national."
                      ,
                                style: appTheme.textTheme.bodyMedium,
                                textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Text('Engagement Citoyen',
                  style: appTheme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child:  Text('Nous croyons que le changement durable vient de la base. C’est pourquoi nous valorisons la mobilisation citoyenne, la formation politique, et l’implication des communautés locales dans la définition des politiques publiques.'),
                  )),
              ],
            ),
          ),
          SizedBox(
            width: 500,
            child: Column(
              children: [
                Text('Perspectives',
                                style: appTheme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                                )),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Text("Notre ambition est de construire un Gabon plus solidaire, plus innovant et plus souverain. Nous croyons en une économie au service de l'humain, en une école pour l’émancipation, et en une justice impartiale pour tous. Ensemble, nous écrivons une nouvelle page de notre histoire."),
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

