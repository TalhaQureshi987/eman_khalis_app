import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../services/language_service.dart';
import '../constants/app_localizations.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'language_selection_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(localizations.settings),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryGreen,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 100,
        ),
        children: [
          // Login/Register section - only show if not logged in
          if (!_isLoggedIn) ...[
            _buildSettingsCard(
              context,
              localizations.login,
              localizations.signInToAccount,
              Icons.login,
              () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
                _checkLoginStatus();
              },
            ),
            const SizedBox(height: 16),
            _buildSettingsCard(
              context,
              localizations.register,
              localizations.createNewAccount,
              Icons.person_add,
              () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
                _checkLoginStatus();
              },
            ),
            const SizedBox(height: 32),
          ],
          _buildSettingsCard(
            context,
            localizations.locationSettings,
            localizations.manageLocation,
            Icons.location_on_outlined,
            () {},
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            localizations.notificationSettings,
            localizations.configureNotifications,
            Icons.notifications_outlined,
            () {},
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            localizations.languageSettings,
            localizations.changeAppLanguage,
            Icons.language_outlined,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageSelectionScreen(),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            localizations.themeSettings,
            localizations.customizeAppearance,
            Icons.palette_outlined,
            () {},
          ),
          const SizedBox(height: 16),
          _buildSettingsCard(
            context,
            localizations.about,
            localizations.appVersionInfo,
            Icons.info_outlined,
            () {},
          ),
          // Logout section - only show if logged in
          if (_isLoggedIn) ...[
            const SizedBox(height: 32),
            _buildLogoutCard(context),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        final languageService = Provider.of<LanguageService>(context);
        final localizations = AppLocalizations(languageService.currentLanguage);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            localizations.logout,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121),
            ),
          ),
          content: Text(
            localizations.areYouSureLogout,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF757575),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                localizations.cancel,
                style: const TextStyle(
                  color: Color(0xFF757575),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                localizations.logout,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      // Clear login state and user credentials
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', false);
      await prefs.remove('user_email');
      await prefs.remove('user_password');
      await prefs.remove('user_name');

      if (context.mounted) {
        // Update UI to show login/register options
        setState(() {
          _isLoggedIn = false;
        });
      }
    }
  }

  Widget _buildLogoutCard(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final localizations = AppLocalizations(languageService.currentLanguage);
    return Card(
      color: Colors.red.shade50,
      child: ListTile(
        leading: Icon(
          Icons.logout,
          color: Colors.red.shade700,
        ),
        title: Text(
          localizations.logout,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        subtitle: Text(
          localizations.areYouSureLogout,
          style: const TextStyle(color: Color(0xFF757575)),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.red.shade700,
          size: 16,
        ),
        onTap: () => _handleLogout(context),
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppColors.iconColor),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryText,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.secondaryText),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.iconSecondary,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
