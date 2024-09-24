import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "language": "Language",
        },
        'bn_BN': {
          "language": "ভাষা",
        },
        'es_ES': { // Spanish
          "language": "Idioma",
        },
        'pt_PT': { // Portuguese
          "language": "Língua",
        },
        'fr_FR': { // French
          "language": "Langue",
        },
      };
}
