import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class DappCard extends StatelessWidget {
  final String aName;
  final String cName;
  final String iconImage;
  final int dCount;

  const DappCard(
      {Key key, @required this.aName, @required this.cName, @required this.iconImage, @required this.dCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      height: MediaQuery.of(context).size.height/7,

      alignment: Alignment.center,
      child: Card(
        borderOnForeground: false,


        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //* Dapp

              Image.network(
                iconImage,
                width: 45,
                height: 45,
                alignment: Alignment.topRight,
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 1,
                  right: 15,
                  left: 5,
                ),

              ),

//              Text(
//                aName,
//                textAlign: TextAlign.justify,
//                style: TextStyle(
//                  color: Theme.of(context).primaryColor,
//                  fontSize: 13,
//                  fontWeight: FontWeight.bold,
//                  letterSpacing: 1,
//
//                ),
//
//              ),
//              Padding(
//                padding: EdgeInsets.only(
//                  top: 1,
//                  bottom: 1,
//                ),
//              ),

              //* category Name
              Text(
                  cName,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 0,
                    right: 30,
                  ),
                ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                children:   _check_dashboard(dCount),
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,

              )




            ],
          ),
        ),
      ),
    );
  }

 // ignore: non_constant_identifier_names
 List _check_dashboard(int dCount) {

      int num=0;
      Color colour;
       if(dCount>=25){
         num=5;
         colour=Color.fromRGBO(222, 72, 62, 1);
       }

       else if(dCount>=20 && dCount<=24){
         num=4;
         colour=Color.fromRGBO(222, 72, 62, 1);
       }

       else if(dCount>=15 && dCount<=19){
         num=3;
         colour=Color.fromRGBO(221, 209, 38, 1);
       }

       else if(dCount>=10 && dCount<=14){
         num=2;
         colour=Color.fromRGBO(221, 209, 38, 1);
       }

       else if(dCount>=5 && dCount<=9){
         num=1;
         colour=Color.fromRGBO(1, 242, 255, 1);
       }

       else if(dCount>=0 && dCount<=4){
         num=0;
         //colour="yellow";
       }

     List app = <Icon>[];
     for (int j = 0; j <= num; j++) {
       Icon t = Icon(
         MdiIcons.fire,
         color: colour,
         size: 30.0,
       );
       app.add(t);
       t=null;
     }
     return app;
   }


}