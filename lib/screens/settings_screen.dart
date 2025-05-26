import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen({
    super.key,
    required this.onSettingsChanged,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
    );
  }

  Widget _buildNavigationTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(title: Text(title), trailing: Icon(icon), onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      drawer: const MainDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _createSwitch(
            'Sem Glúten',
            'Só exibe refeições sem glúten!',
            settings!.isGlutenFree,
            (value) => setState(() => settings?.isGlutenFree = value),
          ),
          _createSwitch(
            'Sem Lactose',
            'Só exibe refeições sem lactose!',
            settings!.isLactoseFree,
            (value) => setState(() => settings?.isLactoseFree = value),
          ),
          _createSwitch(
            'Vegana',
            'Só exibe refeições veganas!',
            settings!.isVegan,
            (value) => setState(() => settings!.isVegan = value),
          ),
          _createSwitch(
            'Vegetariana',
            'Só exibe refeições vegetarianas!',
            settings!.isVegetarian,
            (value) => setState(() => settings!.isVegetarian = value),
          ),
          _createSwitch(
            'Modo Escuro',
            'Ativa ou desativa o modo escuro!',
            settings!.isDarkMode,
            (value) => setState(() => settings!.isDarkMode = value),
          ),
          _createSwitch(
            'Notificações',
            'Ativa ou desativa notificações!',
            settings!.isNotificationsEnabled,
            (value) => setState(() => settings!.isNotificationsEnabled = value),
          ),
          const Divider(),
          _buildNavigationTile('Termos de Uso', Icons.arrow_forward_ios, () {
            //TODO: Navegar para termos de uso
          }),
          _buildNavigationTile(
            'Política de Privacidade',
            Icons.arrow_forward_ios,
            () {
              //TODO: Navegar para política de privacidade
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
                          //TODO: Implementar lógica de logout
                        },
                      ),
                    ],
                  ),
            );
          }),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              setState(() {
                settings = Settings();
              });
            },
            icon: const Icon(Icons.restore),
            label: const Text('Resetar Configurações'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Preferências salvas!')),
              );
            },
            icon: const Icon(Icons.save),
            label: const Text('Salvar Preferências'),
          ),
        ],
      ),
    );
  }
}
