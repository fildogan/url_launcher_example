import 'package:flutter/material.dart';
import 'package:url_launcher_example/url_launches.dart';
import 'package:url_launcher_example/url_links.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UrlLauncherButton(
              text: 'Launch Email',
              onPressed: () => launchEmail(),
            ),
            UrlLauncherButton(
              text: 'Launch SMS',
              onPressed: () => launchSMS(phoneNumber: myPhoneNumber),
            ),
            UrlLauncherButton(
              text: 'Launch Phone Call',
              onPressed: () => launchCall(phoneNumber: myPhoneNumber),
            ),
            UrlLauncherButton(
              text: 'Launch url in app',
              onPressed: () => launchUrlSite(url: httpsLink),
            ),
            UrlLauncherButton(
              text: 'Launch url in external app',
              onPressed: () => launchUrlSiteBrowser(url: httpsLink),
            ),
          ],
        ),
      ),
    );
  }
}

class UrlLauncherButton extends StatelessWidget {
  const UrlLauncherButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SizedBox(width: 200, height: 40, child: Center(child: Text(text))),
    );
  }
}
