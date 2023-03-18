import 'package:http/http.dart' as http;
import 'package:pokeman_app/Model/DetailModel.dart';
import 'package:pokeman_app/Model/PokeModel.dart';
class ApiServices {
  String url ='https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  Future<PokeModel?> FetchUserDetails()async{
    print('2nd call');
    var response = await http.get(Uri.parse(url));
    print(response);
    if (response.statusCode == 200) {
      print(response.body);
      return pokeModelFromJson(response.body);

    }
  return PokeModel(count: 0, next: '', previous: '', results: []);
  }
  Future<PokeDetail?> FetchAbilities(String url1)async{
    print('2nd call');
    var response = await http.get(Uri.parse(url1));
    //print(response);
    if (response.statusCode == 200) {
      print(response.body);
      return pokeDetailFromJson(response.body);

    }
    return null;
  }
}