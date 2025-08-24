// pages/join_page.dart
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/footer.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({super.key});

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isDonation = false;
  bool _isSending = false;

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _messageCtrl = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSending = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isSending = false;
        });
        if(!mounted)return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_isDonation ? 'Don envoyé avec succès !' : 'Adhésion envoyée avec succès !')),
        );
        _nameCtrl.clear();
        _emailCtrl.clear();
        _amountCtrl.clear();
        _messageCtrl.clear();
      });
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _amountCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer() 
          : null,
      bottomNavigationBar: const Footer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Adhésion / Don',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Choisissez si vous souhaitez adhérer au parti ou faire un don pour le soutenir.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Adhérer'),
                      value: false,
                      groupValue: _isDonation,
                      onChanged: (value) => setState(() => _isDonation = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Faire un don'),
                      value: true,
                      groupValue: _isDonation,
                      onChanged: (value) => setState(() => _isDonation = value!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nom complet',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => (value == null || value.trim().isEmpty) ? 'Veuillez entrer votre nom' : null,
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Veuillez entrer votre email';
                  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  if (!emailRegex.hasMatch(value.trim())) return 'Entrez un email valide';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              if (_isDonation) ...[
                TextFormField(
                  controller: _amountCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Montant du don (en €)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.euro),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (!_isDonation) return null;
                    if (value == null || value.trim().isEmpty) return 'Veuillez entrer un montant';
                    if (double.tryParse(value.trim()) == null) return 'Entrez un montant valide';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
              ],

              TextFormField(
                controller: _messageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Message (optionnel)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                ),
                maxLines: 4,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: _isSending
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Icon(Icons.send),
                  label: Text(_isSending ? 'Envoi...' : (_isDonation ? 'Envoyer le don' : 'Envoyer l’adhésion')),
                  onPressed: _isSending ? null : _submit,
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
