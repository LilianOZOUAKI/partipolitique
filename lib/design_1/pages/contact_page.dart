import 'package:flutter/material.dart';
import 'dart:js_interop';

import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';

// Déclare la fonction JS emailjs.send
@JS('emailjs.send')
external JSPromise emailJsSend(
  String serviceId,
  String templateId,
  JSAny params,
);

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  bool _isSending = false;

  void _sendForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isSending = true);

      // Conversion Dart Map -> JSObject
      final templateParams = {
        'from_name': _nameCtrl.text,
        'from_email': _emailCtrl.text,
        'message': _messageCtrl.text,
      }.jsify();

      emailJsSend('service_sb5cbvn', 'template_tfes6q9', templateParams!)
          .toDart
          .then((_) {
        if (!mounted) return;
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message envoyé avec succès !')),
        );
        _nameCtrl.clear();
        _emailCtrl.clear();
        _messageCtrl.clear();
      }).catchError((error) {
        if (!mounted) return;
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : $error')),
        );
      });
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800 ? const AppDrawer() : null,
      bottomNavigationBar: const Footer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contactez-nous',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vous avez des questions, des suggestions ou souhaitez adhérer ? '
              'Remplissez le formulaire ci-dessous et nous vous répondrons rapidement.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nom complet',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Veuillez entrer votre nom' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Veuillez entrer votre email';
                      }
                      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!emailRegex.hasMatch(v.trim())) {
                        return 'Entrez un email valide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _messageCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.message),
                    ),
                    maxLines: 5,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Veuillez écrire un message' : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: _isSending
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.send),
                      label: Text(_isSending ? 'Envoi...' : 'Envoyer'),
                      onPressed: _isSending ? null : _sendForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Nos coordonnées',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('📍 Adresse : 123 Rue de la République, Libreville, Gabon'),
            const Text('📞 Téléphone : +241 01 23 45 67 89'),
            const Text('✉️ Email : contact@partipolitique.ga'),
          ],
        ),
      ),
    );
  }
}
