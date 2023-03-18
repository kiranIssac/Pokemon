import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ViewModel/ViewModel.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String?> ability=[];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Abilities',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 00.0),
            child: Image.asset("assets/pokgif.gif", height: 40),
          )
        ],
      ),
      body: Container(
          child: Consumer<UserViewModel>(  // Fetch abiities from UserViewModel change notifier provider
            builder: (context, provider, child) {

           ability=provider.abilities;

          return provider.loading2 == false
              ?  Column(
            mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  height: 100,
                  width: 150,

                    child: ListView.builder(key: Key('ListView'),

                      itemCount: ability.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  key: Key("AblityText"),
                                  ability[i].toString()),
                            ));
                      },
                    ),

                )
              ],

          ) : CircularProgressIndicator();
            },
          ),

      ),
    );
  }
}
