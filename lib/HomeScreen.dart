import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeman_app/CardDetail.dart';
import 'package:provider/provider.dart';

import 'Model/PokeModel.dart';
import 'ViewModel/ViewModel.dart';
import 'package:vector_math/vector_math.dart' as math;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = UserViewModel();
    PokeModel PokeModelList =
        PokeModel(count: 0, next: '', previous: '', results: []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'POKEMON',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 00.0),
            child: Image.asset("assets/pokki.gif", height: 40),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Consumer<UserViewModel>( // The UserViewModel change notifier provider is used to fetch pokemon list from API
            builder: (context, provider, child) {
              PokeModelList = provider.Poke_list;

              return provider.loading1 == false
                  ? GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 90 / 150,
                        crossAxisCount: 2,
                      ),
                      itemCount: PokeModelList.results.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          key: Key("button1"),
                          onTap: () {
                             Provider.of<UserViewModel>(context, listen: false).getAbility(PokeModelList.results[0].url);// Use UserViewModel change notifier provider to fetch abilities of each pokemon cards
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => const CardDetails()),);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.yellow[800],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text(
                              style: TextStyle(fontStyle: FontStyle.italic),
                              PokeModelList.results[index].name.toUpperCase(),
                            )),
                          ),
                        );
                      },
                    )
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );

  }
}
