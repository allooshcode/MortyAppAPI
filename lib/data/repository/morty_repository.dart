import 'package:morty_app/data/models/morty_model.dart';
import 'package:morty_app/data/web_services/dio_services.dart';

class MortyRepository {
  final DioService _dioService;
  MortyRepository(this._dioService);

  Future<List<Character>> getCharacters() async {
    try {
      final result = await _dioService.getCharacters();

      final MortyModel mortyModel = MortyModel.fromJson(result);
      return mortyModel.characters;
    } catch (err) {
      throw err.toString();
    }
  }
}
