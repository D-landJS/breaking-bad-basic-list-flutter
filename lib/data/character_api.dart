import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() =>
      http.get(Uri.parse("https://breakingbadapi.com/api/characters"));
}
