import 'package:url_launcher/url_launcher.dart' as urlLauncher;

void launchSite(String? website) async {
  if (website == null) return;
  try {
    if (!website.startsWith("http://") || !website.startsWith("https://"))
      website = "https://$website";
    await urlLauncher.launch(website);
  } catch (e) {
    print(e);
  }
}

void launchMap(String? lat, String? long) async {
  try {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await urlLauncher.launch(googleUrl);
  } catch (e) {
    print(e);
  }
}

void call(String? phone) async {
  try {
    await urlLauncher.launch('tel:$phone');
  } catch (e) {
    print(e);
  }
}
