import 'package:flutter/material.dart';
import 'package:youth_development_app/classes/beneficiary_themes.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youth_development_app/web_services/call_api.dart';


class SetGoals extends StatefulWidget {
  BeneficiaryThemes test;
  
  @override
  _SetGoalsState createState() => _SetGoalsState();
}

class _SetGoalsState extends State<SetGoals> {
  Map data={};
  Future<List<BeneficiaryThemes>> _getThemes() async {
    List<BeneficiaryThemes> themes = List<BeneficiaryThemes>();

    //Call the API webserivice 
    var response=await CallApi().getData('themes/themesdata');

    List themesData = jsonDecode(response.body);

    print(themesData);

    for (var theme in themesData) {
      BeneficiaryThemes beneficiaryTheme = BeneficiaryThemes(
          theme_id:int.parse(theme["theme_id"]),
          themeName:theme["theme_name"],
          themeDescription:theme["theme_description"],
          leadingThemeImage:theme["leading_theme_image"],
          maxGoalsForTheme:theme["max_goals_for_theme"]
          );

      themes.add(beneficiaryTheme);
    }

    return themes;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Goals 4 Each Theme ${data['logged_in_user']}',
          style: TextStyle(fontSize: 22.0),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: FutureBuilder(
        future: _getThemes(),//CallApi().getData('themes'),//_getThemes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'images/${snapshot.data[index].leadingThemeImage}'),
                    ),
                    title: Text(snapshot.data[index].themeName,
                        style: TextStyle(
                          fontSize: 20.6,
                          //letterSpacing: 1.0,
                        )),

                    // Use Wrap widget to fit trailling Items in a card
                    trailing: Wrap(
                      spacing: 2.0,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.add),
                            iconSize: 30.0,
                            tooltip: 'Set Goal',
                            color: Colors.yellow,
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacementNamed(context, '/goal_setting_form',arguments: {
                                  'theme_id':snapshot.data[index].theme_id,
                                  'theme_name':snapshot.data[index].themeName,
                                  'theme_maxmum_goals':snapshot.data[index].maxGoalsForTheme,
                                  'loggedInUser':data['logged_in_user'],
                                });
                                //print( 'id:${snapshot.data[index].theme_id} goal name:${snapshot.data[index].themeName}');
                              });
                            }),
                        IconButton(
                            icon: Icon(Icons.view_headline),
                            iconSize: 30.0,
                            tooltip: 'Set Goal',
                            color: Colors.indigo[900],
                            onPressed: () {
                              setState(() {
                                print(
                                    'id:${snapshot.data[index].Id} goal name:${snapshot.data[index].themeName}');
                              });
                            }),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      )),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:youth_development_app/classes/beneficiary_themes.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:youth_development_app/screens/add_my_goals.dart';

// class SetGoals extends StatefulWidget {
//   BeneficiaryThemes test;
  
//   @override
//   _SetGoalsState createState() => _SetGoalsState();
// }

// class _SetGoalsState extends State<SetGoals> {

//   List<MyGoalDetail> goalDetails=List<MyGoalDetail>();
  

//   addGoal(){
   
//        //goalDetails.clear();
//        goalDetails.add(MyGoalDetail());
//        setState(() {
         
//        });
//   }
//   //Get data method
//   Future<List<BeneficiaryThemes>> _getThemes() async {
//     List<BeneficiaryThemes> themes = List<BeneficiaryThemes>();
//     String endPointUrl =
//          //192.168.43.48 -My Phone _isPressed
//          //192.168.100.4 -Safcom Box
//         'http://192.168.100.4/youthapp_api/index.php/api/goals';

//     http.Response response =
//         await http.get(Uri.encodeFull(endPointUrl), headers: {
//       "Accept": 'application/json',
//     });

//     List themesData = jsonDecode(response.body);

//     // for (var theme in themesData) {
//     //   BeneficiaryThemes beneficiaryTheme = BeneficiaryThemes(
//     //       theme["id"],
//     //       theme["themeName"],
//     //       theme["goal_description"],
//     //       theme["leading_goal_image"]);

//     //   themes.add(beneficiaryTheme);
//     // }

//     for (var theme in themesData) {
//       BeneficiaryThemes beneficiaryTheme = BeneficiaryThemes(
//           theme["id"],
//           theme["themeName"],
//           theme["goal_description"],
//           theme["leading_goal_image"]);

//       themes.add(beneficiaryTheme);
//     }

//     return themes;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Set My Goals',
//           style: TextStyle(fontSize: 25.0),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//           child: FutureBuilder(
//         future: _getThemes(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return ListView.builder(
//               shrinkWrap: true,
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: <Widget>[
//                     Card(
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: AssetImage(
//                               'images/${snapshot.data[index].leading_goal_image}'),
//                         ),
//                         title: Text(snapshot.data[index].themeName,
//                             style: TextStyle(
//                               fontSize: 20.6,
//                               //letterSpacing: 1.0,
//                             )),

//                         // Use Wrap widget to fit trailling Items in a card
//                         trailing: Wrap(
//                           spacing: 2.0,
//                           children: <Widget>[
//                             IconButton(
//                                 icon: Icon(Icons.add),
//                                 iconSize: 30.0,
//                                 tooltip: 'Set Goal',
//                                 color: Colors.yellow,
//                                 onPressed: () {
                                  
//                                   setState(() {
//                                     addGoal();

//                                     testList(goalDetails);
//                                     print('id:${snapshot.data[index].id} goal name:${snapshot.data[index].themeName}');
//                                  });
                                  
//                                   // setState(() {
//                                   //   // Navigator.pushReplacementNamed(context, '/add_goals',arguments: {
//                                   //   //   'theme_id':snapshot.data[index].id,
//                                   //   //   'theme_name':snapshot.data[index].themeName,
//                                   //   // });
//                                   //   print(
//                                   //       'id:${snapshot.data[index].id} goal name:${snapshot.data[index].themeName}');
//                                   // });
//                                 }),
//                             IconButton(
//                                 icon: Icon(Icons.view_headline),
//                                 iconSize: 30.0,
//                                 tooltip: 'Set Goal',
//                                 color: Colors.indigo[900],
//                                 onPressed: () {
                                  
//                                   setState(() {
//                                     print(
//                                         'id:${snapshot.data[index].id} goal name:${snapshot.data[index].themeName}');
//                                   });
//                                 }),
                         
                          
//                           ],
                          
//                         ),
                        
                        
//                       )
                    
//                     ),
//                     testList(goalDetails),
//                     // ListView.builder(
//                     //   itemCount: goalDetails.length,
//                     //   shrinkWrap: true,
//                     //   itemBuilder: (BuildContext context, int index){
//                     //     return goalDetails[index];
//                     //   }
//                     // )
//                   ],
//                 );
                
//               },
//             );
//           }
//         },
//       )),
//     );
//   }

//   Widget testList(List<MyGoalDetail> lst,){
//    return  ListView.builder(
//                       itemCount: lst.length,
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index){
//                         return lst[index];
//                       }
//                     );
//   }

//   _createFied(){

//   }



// }

// class MyGoalDetail extends StatelessWidget {
//   int _count=0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//       child: TextFormField(
//         decoration: InputDecoration(
//           hintText: 'Enter Your goals',
//         ),
//         ),
//       //child: Text('Text'),
      
//     );
//     //print(this._count);
//   }
// }




