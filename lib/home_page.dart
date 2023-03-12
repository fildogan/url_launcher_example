import 'package:flutter/material.dart';

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
            children: const [
              UrlLauncherButton(
                text: 'Launch Email',
              ),
              UrlLauncherButton(
                text: 'Launch SMS',
              ),
              UrlLauncherButton(
                text: 'Launch Phone Call',
              ),
              UrlLauncherButton(
                text: 'Launch https url',
              ),
              UrlLauncherButton(
                text: 'Launch http url',
              ),
            ]),
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
      child: SizedBox(width: 150, child: Center(child: Text(text))),
    );
  }
}
