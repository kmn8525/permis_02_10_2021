import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sp_util/sp_util.dart';

import 'Constantes.dart';
import 'EcranQuestionExamen.dart';
import 'EcranQuestions.dart';
import 'EcranRoute.dart';
import 'ListeConducteurPassager.dart';
import 'ListeDefinition.dart';
import 'ListeFavoris.dart';
import 'Option.dart';
import 'Question.dart';
import 'TrasitionPages.dart';
import 'Utility.dart';

var tampon = null ;
String CleTheme ;

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
    height: 96,
    child: Card(
      child: Text(
        '$title a long title',
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
    ),
  );
}


class HorizontalItemQuestion extends StatefulWidget {
  final String NomImageSVG;
  final String nomTheme;

  const HorizontalItemQuestion({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);

  @override
  HorizontalItemQuestionState createState() => HorizontalItemQuestionState();



 }


class HorizontalItemQuestionState extends State<HorizontalItemQuestion> {
  Color c ;
  String etat ;

  int numQ_Definition = 0   ;
  int numQ_ConducteurPass = 0   ;

  int nbCD  ;
  int nbQCO  ;
  int nbQCCO  ;

  String RecuperCleQDefinion =" "  ;
  String RecuperCleQConducteurPass =" "  ;
  String RecuperCleListeFavoris=" " ;
  List  ListeFavoriSauver = [] ;

  int i = 0 ;
  int IdQuestion ;
bool verifExisteQuestion ;

  Future<void> recupereDonneSauvegarde() async {
    Utility.instance.getIntegerValue(RecuperCleQDefinion)
        .then((value) => setState(() {
       numQ_Definition = value ;

    }));

    Utility.instance.getIntegerValue(RecuperCleQConducteurPass)
        .then((value) => setState(() {
      numQ_ConducteurPass = value ;

    }));


    Utility.instance.getListData(RecuperCleListeFavoris)
        .then((value) => setState(() {
      ListeFavoriSauver = value ;

    }));
  }


  @override
  void initState() {
    RecuperCleQDefinion =  Provider.of<Definition>(context , listen: false).getCleNumQueDef ;
    RecuperCleQConducteurPass =  Provider.of<ConducteurPassager>(context , listen: false).getCleNumQueCondPass ;


    recupereDonneSauvegarde() ;


super.initState();

  }

  void chargeCouleur() {
    if  (widget.nomTheme == "DEFINITION" )
      {

        if ( numQ_Definition > 0) {

          setState(() {
            c = Colors.red ;
          });
        }

        else {
          c = Colors.black ;

        }
      }

    else if ( widget.nomTheme == "CONDUCTEUR" ) {
      if ( numQ_ConducteurPass > 0) {

        setState(() {
          c = Colors.red ;
        });
      }

      else {
        c = Colors.black ;

      }

    }
    else if ( widget.nomTheme == "FAVORIS" ) {



        c = Colors.black ;



    }

  }


  @override
  Widget build(BuildContext context) {


    chargeCouleur();
   return
        GestureDetector(

        onTap: () {

            if  (widget.nomTheme == "DEFINITION" )

              {


                if ( numQ_Definition > 0) {
                var alertStyle = AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: false,
                  isOverlayTapDismiss: true,
                  descStyle: TextStyle(fontWeight: FontWeight.bold),
                  descTextAlign: TextAlign.start,
                  animationDuration: Duration(milliseconds: 500),
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  titleStyle: TextStyle(
                    color: Colors.green,
                  ),
                  alertAlignment: Alignment.center,
                );
                Alert(
                  context: context,
                  style: alertStyle,
                  image: SvgPicture.asset(
                    'assets/emoji/happy.svg',
                    height: 43.0,
                    width: 43.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                  // type: AlertType.info,
                  title: "Ce Theme a deja ete Commencer voulez-vous reprendre",

                  // desc: "Voulez-vous continuez ?.",

                  buttons: [


                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "OUI",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {



                        Navigator.of(context, rootNavigator: true ).push(TransitionDroit(
                            page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_Definition)));

                      },


                      color: Colors.green,

                    ) ,
                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "NON",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {

                        Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                            page :   EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));



                      },


                      color: Colors.deepOrangeAccent,

                    ) ,


                  ],



                ).show();


              }

              else {



                  Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                      page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_Definition)));





                }


            }

            else if (widget.nomTheme == "CONDUCTEUR" ) {

              if ( numQ_ConducteurPass > 0) {


                var alertStyle = AlertStyle(
                  animationType: AnimationType.fromTop,
                  isCloseButton: false,
                  isOverlayTapDismiss: true,
                  descStyle: TextStyle(fontWeight: FontWeight.bold),
                  descTextAlign: TextAlign.start,
                  animationDuration: Duration(milliseconds: 500),
                  alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  titleStyle: TextStyle(
                    color: Colors.green,
                  ),
                  alertAlignment: Alignment.center,
                );
                Alert(
                  context: context,
                  style: alertStyle,
                  image: SvgPicture.asset(
                    'assets/emoji/happy.svg',
                    height: 43.0,
                    width: 43.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                  // type: AlertType.info,
                  title: "Ce Theme a deja ete Commencer voulez-vous reprendre",

                  // desc: "Voulez-vous continuez ?.",

                  buttons: [


                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "OUI",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {

                        Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                            page :   EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_ConducteurPass)));





                      },


                      color: Colors.green,

                    ) ,
                    DialogButton(
                      margin: EdgeInsets.all(15),

                      child: Text(

                        "NON",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),


                      onPressed:  () {

                        Navigator.of(context, rootNavigator: true ).push(TransitionDroit(
                            page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: 0)));




                      },


                      color: Colors.deepOrangeAccent,

                    ) ,


                  ],



                ).show();


              }

              else {

                Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                      page :  EcranQuestions(titrePage: '${ widget.nomTheme}' , NumImage: numQ_ConducteurPass)));






              }

            }
            else if (widget.nomTheme == "FAVORIS" ) {

              Navigator.of(context, rootNavigator: true ).push(TransitionDroit(

                    page :  EcranQuestions.C1(titrePage: '${ widget.nomTheme}' )));
            }

          // utilisateurTheme('${item.nomTheme}' ) ;

        },

        child: Container(
          height: double.infinity,

          child: Card(

            color: kCouleurBlancGeneral,
            elevation: 4.0,
            shadowColor : Colors.black ,
            margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),


            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),)) ,


            child: Container(

              alignment: Alignment.center ,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(4),

                    child: SvgPicture.asset(
                      'assets/iconTheme/${widget.NomImageSVG}.svg',
                      height: 43.0,
                      width: 43.0,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  Divider(
                    color: c,
                  ),
                  Expanded(
                    child: Text(
                      '${widget.nomTheme}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
  }
}


/////////////////////////////////////////////////////////////////////
           ///// ------  EFFET ECRAN COUR-ACCEUIL///////
 /////////////////////////////////////////////////////////////////////


class HorizontalItemCourAcceuil extends StatefulWidget {
  final String NomImageSVG;
  final String nomTheme;

  HorizontalItemCourAcceuil({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);

  @override
  HorizontalItemCourAcceuilState createState() => HorizontalItemCourAcceuilState();


}

class HorizontalItemCourAcceuilState extends State<HorizontalItemCourAcceuil> {

  Color c ;


  void chargeCouleur() {
    if  (widget.NomImageSVG == "A" )
    {

      setState(() {
        c = Colors.green ;
      });


    }

    else if ( widget.NomImageSVG == "B" ) {

      setState(() {
        c = Colors.red ;
      });



    }
    else if ( widget.NomImageSVG == "C" ) {

      setState(() {
        c = Colors.yellow ;
      });


    }

    else if ( widget.NomImageSVG == "D" ) {

      setState(() {
        c = Colors.blue ;
      });


    }

    else if ( widget.NomImageSVG == "E" ) {

      setState(() {
        c = Colors.orange ;
      });


    }

    else if ( widget.NomImageSVG == "F" ) {

      setState(() {
        c = Colors.black12 ;
      });


    }

    else if ( widget.NomImageSVG == "G" ) {

      setState(() {
        c = Colors.black ;
      });


    }
    else if ( widget.NomImageSVG == "H" ) {

      setState(() {
        c = Colors.tealAccent ;
      });


    }

    else if ( widget.NomImageSVG == "I" ) {

      setState(() {
        c = Colors.deepOrangeAccent;
      });


    }

  }

  @override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    chargeCouleur() ;

    return    GestureDetector(

        onTap: () {

          if  (widget.nomTheme == "ROUTE" )

          {


            Navigator.of(context, rootNavigator: true ).push(TransitionDroit( page:
                    EcranRoute(titrePage: '${ widget.nomTheme}'  )));


          }

        //  Navigator.push(context, SlideRightRoute(page: Screen2())),

        },


          child: Card(

            color: kCouleurBlancGeneral,
            elevation: 4.0,
            shadowColor : Colors.black ,
            margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),
              clipBehavior: Clip.antiAlias ,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                           child: Container(

                              child: SvgPicture.asset(
                              'assets/iconCours/${widget.NomImageSVG}.svg',
                              height: 80.0,
                              width: 80.0,
                               color: Colors.white,

                              allowDrawingOutsideViewBox: true,
                            ),
                            color: c,



                          ),
                        ),
                      ],
                    ),

                  /*Divider(
                    color: Colors.black45,
                  ),*/
                  Expanded(
                    child: Container(

                      child: Text(
                        '${widget.nomTheme}',
textAlign: TextAlign.center ,
                         style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15 ,
                             height : 2 ,
                         ),
                       ),
                     ),
                  ),

                ],
              ),

          ),

      );
  }
}



/////////////////////////////////////////////////////////////////////
         ///// ------  EFFET ECRAN  ROUTE///////
/////////////////////////////////////////////////////////////////////


class VerticalItemRoute extends StatefulWidget {
   final String nomTheme;

  VerticalItemRoute({Key key, this.nomTheme}) : super(key: key);

  @override
  VerticalItemRouteState createState() => VerticalItemRouteState();


}

class VerticalItemRouteState extends State<VerticalItemRoute> {




  @override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return    GestureDetector(

      child: Card(
        color: kCouleurBlancGeneral,
        elevation: 2.0,
        shadowColor : Colors.black ,
        margin: EdgeInsets.symmetric(vertical : 2 ,horizontal: 2),
        clipBehavior: Clip.antiAlias ,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '${widget.nomTheme}', style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.justify,
                ),

              ),

             Padding(
                padding: const EdgeInsets.only(  right: 20),

                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.blueAccent ,
                  size: 10,
                ),
              ),

          ],
        ),
      ),

    );
  }
}



/////////////////////////////////////////////////////////////////////
              ///// ------  EFFET ECRAN EXAMEN///////
/////////////////////////////////////////////////////////////////////



class HorizontalItemExamen extends StatelessWidget {

  final String NomImageSVG;
  final String nomTheme;

   const  HorizontalItemExamen({Key key, this.NomImageSVG, this.nomTheme}) : super(key: key);





  @override
  Widget build(BuildContext context) =>  Container(
    height: double.infinity,



    child:  GestureDetector(

      onTap: () {


        /*Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
            builder: (BuildContext context  ) =>
                EcranQuestionsExamen(titrePage: '${ nomTheme}' )));


        // utilisateurTheme('${item.nomTheme}' ) ;*/

      },



      child: Container(
        height: double.infinity,



        child: Card(
          //semanticContainer: false,

          color: kCouleurBlancGeneral,
          elevation: 6.0,
          shadowColor : Colors.black38 ,
          margin: EdgeInsets.symmetric(vertical : 8 ,horizontal: 8),


          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),)) ,


          child: Container(

            alignment: Alignment.center ,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.all(3),
                  padding: EdgeInsets.all(4),

                  child: SvgPicture.asset(
                    'assets/iconTheme/${NomImageSVG}.svg',
                    height: 43.0,
                    width: 43.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    '${nomTheme}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),


  );
}





/// Wrap Ui item with animation & padding
Widget Function(
    BuildContext context,
    int index,
    Animation<double> animation,
    ) animationItemBuilder(
    Widget Function(int index) child, {
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        int index,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );

Widget Function(
    BuildContext context,
    Animation<double> animation,
    ) animationBuilder(
    Widget child, {
      double xOffset = 0,
      EdgeInsets padding = EdgeInsets.zero,
    }) =>
        (
        BuildContext context,
        Animation<double> animation,
        ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(xOffset, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        );