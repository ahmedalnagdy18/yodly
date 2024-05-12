import 'package:flutter/material.dart';
import 'package:yodly/core/colors/app_colors.dart';
import 'package:yodly/features/presentation/pages/drawer/about_app/about_app_page.dart';
import 'package:yodly/features/presentation/pages/drawer/contact_us/contact_us_page.dart';
import 'package:yodly/features/presentation/pages/drawer/logout/logout_page.dart';
import 'package:yodly/features/presentation/pages/drawer/privacy_terms/privacy_terms_page.dart';
import 'package:yodly/features/presentation/pages/drawer/settings/setting_page.dart';
import 'package:yodly/features/presentation/pages/drawer/usage_terms/usage_terms_page.dart';
import 'package:yodly/features/presentation/pages/home/myprofile_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  clipBehavior: Clip.antiAlias,
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'images/nagdi.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      'Ahmed Alnagdy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.n1,
                      ),
                    ),
                    const SizedBox(height: 3),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyProfilePage()));
                      },
                      child: Text(
                        'Show Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.n2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 30),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Settings'),
              leading: const Icon(
                Icons.settings_outlined,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutAppPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('About the app'),
              leading: const Icon(
                Icons.phone_android,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UsageTermsPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Usage Terms'),
              leading: const Icon(
                Icons.data_saver_off_outlined,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrivacyTermsPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Privacy Terms'),
              leading: const Icon(
                Icons.lock_outlined,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ContactUsPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Contact Us'),
              leading: const Icon(
                Icons.phone_outlined,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LogoutPage()));
              },
              contentPadding: const EdgeInsets.all(0),
              title: const Text('Logout'),
              leading: const Icon(
                Icons.logout,
                size: 20,
              ),
              minLeadingWidth: 10,
              iconColor: AppColors.p2,
            ),
          ],
        ),
      ),
    );
  }
}
