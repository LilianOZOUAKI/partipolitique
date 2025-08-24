import 'package:flutter/material.dart';

import '../design_2/app_theme.dart';
import 'custom_app_bar_3.dart';
import 'last_section_3.dart';

class JoinPage3 extends StatefulWidget {
  const JoinPage3({super.key});

  @override
  State<JoinPage3> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage3> {
  final _formKey = GlobalKey<FormState>();
  bool _isDonation = false;
  bool _isSending = false;

  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _messageCtrl = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isSending = true);

      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() => _isSending = false);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isDonation
                  ? 'Don envoyé avec succès !'
                  : 'Adhésion envoyée avec succès !',
            ),
            behavior: SnackBarBehavior.floating,
          ),
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
      appBar: CustomAppBar3(),
      drawer: MediaQuery.of(context).size.width < 800
          ? const AppDrawer3()
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  // padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Adhésion / Don',
                            style: appTheme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'Choisissez si vous souhaitez adhérer au parti ou faire un don pour le soutenir.',
                            style: appTheme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                  
                        // Sélecteur qui met à jour _isDonation
                        // ContributionSelector(
                        //   isDonation: _isDonation,
                        //   onChanged: (val) {
                        //     setState(() => _isDonation = val);
                        //   },
                        // ),
                        Center(
                          child: Wrap(
                            spacing: 40,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => setState(() => _isDonation = false),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  width: 180,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: _isDonation == false
                                        ? appTheme.primaryColor.withValues(alpha:.1)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: _isDonation == false
                                          ? appTheme.primaryColor
                                          : Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      if (_isDonation == false)
                                        BoxShadow(
                                          color: appTheme.primaryColor.withValues(alpha:.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.how_to_reg,
                                        size: 32,
                                        color: _isDonation == false
                                            ? appTheme.primaryColor
                                            : Colors.grey,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Adhérer",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: _isDonation == false
                                              ? appTheme.primaryColor
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => _isDonation = true),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  width: 180,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: _isDonation == true
                                        ? appTheme.primaryColor.withValues(alpha:.1)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: _isDonation == true
                                          ? appTheme.primaryColor
                                          : Colors.grey.shade300,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      if (_isDonation == true)
                                        BoxShadow(
                                          color: appTheme.primaryColor.withValues(alpha:.3),
                                          blurRadius: 12,
                                          offset: const Offset(0, 6),
                                        ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.volunteer_activism,
                                        size: 32,
                                        color: _isDonation == true
                                            ? appTheme.primaryColor
                                            : Colors.grey,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "Faire un don",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: _isDonation == true
                                              ? appTheme.primaryColor
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  
                        const SizedBox(height: 20),
                  
                        Center(
                          child: SizedBox(
                            width: 700,
                            child: TextFormField(
                              controller: _nameCtrl,
                              decoration: const InputDecoration(
                                labelText: 'Nom complet',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) => (value == null || value.trim().isEmpty)
                                  ? 'Veuillez entrer votre nom'
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        Center(
                          child: SizedBox(
                            width: 700,
                            child: TextFormField(
                              controller: _emailCtrl,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Veuillez entrer votre email';
                                }
                                final emailRegex =
                                    RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                                if (!emailRegex.hasMatch(value.trim())) {
                                  return 'Entrez un email valide';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                  
                        if (_isDonation) ...[
                          Center(
                            child: SizedBox(
                              width: 500,
                              child: TextFormField(
                                controller: _amountCtrl,
                                decoration: const InputDecoration(
                                  labelText: 'Montant du don (en €)',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.euro),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (!_isDonation) return null;
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Veuillez entrer un montant';
                                  }
                                  if (double.tryParse(value.trim()) == null) {
                                    return 'Entrez un montant valide';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                  
                        Center(
                          child: SizedBox(
                            width: 700,
                            child: TextFormField(
                              controller: _messageCtrl,
                              decoration: const InputDecoration(
                                labelText: 'Message (optionnel)',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.message),
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ),
                  
                        const SizedBox(height: 50),
                  
                        Center(
                          child: SizedBox(
                            width: 250,
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
                              label: Text(_isSending
                                  ? 'Envoi...'
                                  : (_isDonation
                                      ? 'Envoyer le don'
                                      : 'Envoyer l’adhésion')),
                              onPressed: _isSending ? null : _submit,
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                LastSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Sélecteur externe relié au parent
class ContributionSelector extends StatelessWidget {
  final bool isDonation;
  final ValueChanged<bool> onChanged;

  const ContributionSelector({
    super.key,
    required this.isDonation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 8,
      children: [
        _buildOption(
          title: "Adhérer",
          icon: Icons.group_add,
          value: false,
        ),
        _buildOption(
          title: "Faire un don",
          icon: Icons.volunteer_activism,
          value: true,
        ),
      ],
    );
  }

  Widget _buildOption({
    required String title,
    required IconData icon,
    required bool value,
  }) {
    return SizedBox(
      width: 220,
      child: RadioListTile<bool>(
        title: Row(
          children: [
            Icon(icon, color: Colors.green.shade700),
            const SizedBox(width: 8),
            Text(
              title,
              style: appTheme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        activeColor: Colors.green.shade800,
        value: value,
        groupValue: isDonation,
        onChanged: (val) => onChanged(val!),
      ),
    );
  }
}
