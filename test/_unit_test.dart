import 'package:flutter_test/flutter_test.dart';
import 'package:pokeman_app/Repo/ApiServices.dart';

void main(){
  test('fetch api', ()async {
bool done= false;
var fetch =await ApiServices().FetchUserDetails();
if(fetch !=null){
  done=true;
}
expect(done, true);
  });
}