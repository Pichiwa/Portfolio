import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const Homepage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Single-Page Portfolio App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [Switch(value: isDarkMode, onChanged: onThemeToggle)],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 16),

            _buildShadowCard(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Janao, Van Halen",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("BSIT 3-B"),
                  SizedBox(height: 8),
                  Text(
                    "\"Data-driven strategist turning complex IT challenges into streamlined, innovative solutions.\"",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _buildShadowCard(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "• Projects",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Single-Page Portfolio App",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text("- Creating a personal portfolio using Flutter."),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _buildShadowCard(
              context,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "• Skills",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Programming"),
                  Text("Flexibility and Adaptability"),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook, size: 32),
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    _launchUrl('https://www.facebook.com/janaovanhalen5150');
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.email, size: 32),
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    _launchUrl('mailto:jongjans120gmail.com');
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github, size: 32),
                  color: theme.colorScheme.primary,
                  onPressed: () {
                    _launchUrl(
                      'https://github.com/Pichiwa/PROFILE_CODE--MASTER/tree/master',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🧱 Reusable Card Builder
  Widget _buildShadowCard(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border.all(color: theme.dividerColor, width: 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.3),
            offset: const Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
