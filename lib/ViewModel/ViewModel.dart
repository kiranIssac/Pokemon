import 'package:flutter/cupertino.dart';
import 'package:pokeman_app/Model/DetailModel.dart';

import '../Model/PokeModel.dart';
import '../Model/PokeModel.dart';
import '../Repo/ApiServices.dart';

class UserViewModel extends ChangeNotifier{
  bool loading1=true;
  bool loading2=false;
  PokeModel Poke_list =PokeModel(count: 0, next: '', previous: '', results: []) ;
  var Url;
  List<String?> abilities=[];
  UserViewModel(){
   getDetails();
  }
  setloading1(bool status){
    loading1=status;
    notifyListeners();
  }
  setloading2(bool status){
    loading2=status;
    notifyListeners();
  }
  setdetails(PokeModel pokeModel){
   Poke_list = pokeModel ;
   print(Poke_list?.results[0].name);
   Url=Poke_list?.results[0].url;
   print('hey girl');
    notifyListeners();
  }
  getDetails()async{
    print('1st call');
    setloading1(true);
    var po= await ApiServices().FetchUserDetails();

    setdetails(po!);
    setloading1(false);
  }
  getAbility(String url)async{
    print('2nd call');
    setloading2(true);
    print('true');
   var ability= await ApiServices().FetchAbilities(url);
   setAbility(ability!);
    setloading2(false);
    print('false');
  }
  setAbility(PokeDetail pokeDetail){
    abilities=[];
   for(int i=0;i< pokeDetail.abilities!.length;i++){
abilities.add(pokeDetail.abilities![i].ability?.name);
print(pokeDetail.abilities![i].ability?.name);
print('haaaaaiii');
   }
    notifyListeners();
  }
}