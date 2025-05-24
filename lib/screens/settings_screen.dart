import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;

  Widget _buildSwitchTile(
    String title,
    bool currentValue,
    Function(bool) onChanged,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Switch.adaptive(value: currentValue, onChanged: onChanged),
    );
  }

  Widget _buildNavigationTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(title: Text(title), trailing: Icon(icon), onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Column(
        children: [
          _buildSwitchTile('Notificações', _notifications, (value) {
            setState(() {
              _notifications = value;
            });
          }),
          _buildSwitchTile('Modo Escuro', _darkMode, (value) {
            setState(() {
              _darkMode = value;
            });
          }),
          _buildNavigationTile('Termos de Uso', Icons.arrow_forward_ios, () {
            // Navegar para termos de uso
          }),
          _buildNavigationTile(
            'Política de Privacidade',
            Icons.arrow_forward_ios,
            () {
              // Navegar para política de privacidade
            },
          ),
          _buildNavigationTile('Sair', Icons.exit_to_app, () {
            showDialog(
              context: context,
              builder:
                  (ctx) => AlertDialog(
                    title: const Text('Sair'),
                    content: const Text('Tem certeza que deseja sair?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      TextButton(
                        child: const Text('Sair'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          // Implementar lógica de logout
                        },
                      ),
                    ],
                  ),
            );
          }),
        ],
      ),
    );
  }
}
