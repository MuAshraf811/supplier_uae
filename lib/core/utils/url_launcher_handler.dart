import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHandler {
  UrlLauncherHandler._();

  static  go({required String url}) async {
    await launchUrl(
      Uri.parse(url), 
      mode: LaunchMode.externalApplication, 

    );
  }
}
