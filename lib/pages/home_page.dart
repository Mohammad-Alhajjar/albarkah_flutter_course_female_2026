import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization_example/i18n/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_page).tr(),
        actions: [
          Switch(
            value: context.locale.languageCode == "ar",
            onChanged: (value) {
              context.setLocale(
                context.locale.languageCode == "en"
                    ? Locale("ar")
                    : Locale("en"),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(LocaleKeys.welcome_back, style: TextStyle(fontSize: 30)).tr(),
            SizedBox(height: 10),
            Text(LocaleKeys.discover_my_app, style: TextStyle(fontSize: 20)).tr(),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text(LocaleKeys.create).tr()),
          ],
        ),
      ),
    );
  }
}
