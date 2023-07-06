import 'package:accent_service_app/common/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

whatsAppchat(context) async {
  String phoneNumber = '9880421360'; // Replace with the desired phone number
  String message = 'Hi'; // Replace with the desired message
  String url =
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    Utils.showSnackBar(context: context, text: 'Coud Not launch Whatsapp');
    throw 'Could not launch $url';
  }
}
