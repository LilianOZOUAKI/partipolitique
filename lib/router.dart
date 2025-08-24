// router.dart
import 'package:go_router/go_router.dart';

import 'design_3/home_page_3.dart';
import 'design_3/adhesion_don_page_3.dart';
import 'design_3/colistier_page_3.dart';
import 'design_3/parti_page_3.dart';
import 'design_3/projet_page_3.dart';

import 'design_2/home_page.dart';

import 'design_1/pages/contact_page.dart';
import 'design_1/pages/error_page.dart';
import 'design_1/pages/events_page.dart';
import 'design_1/pages/home_page.dart';
import 'design_1/pages/join_page.dart';
import 'design_1/pages/legal_page.dart';
import 'design_1/pages/news_page.dart';
import 'design_1/pages/party_page.dart';
import 'design_1/pages/privacy_page.dart';
import 'design_1/pages/program_page.dart';

import 'routes.dart'; // constants de chemins

final router = GoRouter(
  routes: [
    GoRoute(name: 'contact', path: AppRoutes.contact, builder: (context, state) => const ContactPage()),
    GoRoute(name: 'events', path: AppRoutes.events, builder: (context, state) => const EventsPage()),
    GoRoute(name: 'home', path: AppRoutes.home, builder: (context, state) => const HomePage1()),
    GoRoute(name: 'join', path: AppRoutes.join, builder: (context, state) => const JoinPage()),
    GoRoute(name: 'legal', path: AppRoutes.legal, builder: (context, state) => const LegalPage()),
    GoRoute(name: 'news', path: AppRoutes.news, builder: (context, state) => const NewsPage()),
    GoRoute(name: 'party', path: AppRoutes.party, builder: (context, state) => const PartyPage()),
    GoRoute(name: 'privacy', path: AppRoutes.privacy, builder: (context, state) => const PrivacyPage()),
    GoRoute(name: 'program', path: AppRoutes.program, builder: (context, state) => const ProgramPage()),

    GoRoute(name: 'home2', path: AppRoutes.home2, builder: (context, state) => const HomePage2()),

    GoRoute(name: 'home3', path: AppRoutes.home3, builder: (context, state) => const HomePage3()),
    GoRoute(name: 'parti3', path: AppRoutes.parti3, builder: (context, state) => const PartiPage3()),
    GoRoute(name: 'projet3', path: AppRoutes.projet3, builder: (context, state) => const ProjetPage3()),
    GoRoute(name: 'colistier3', path: AppRoutes.colistier3, builder: (context, state) => const ColistierPage3()),
    GoRoute(name: 'join3', path: AppRoutes.join3, builder: (context, state) => const JoinPage3()),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
