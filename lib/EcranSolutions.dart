import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permis/Acceuil.dart';
import 'package:permis/ListeResultats.dart';
import 'package:provider/provider.dart';

import 'Dessiner.dart';
import 'EcranQuestions.dart';
import 'EcranResultats.dart';
import 'TrasitionPages.dart';


class EcranSolutions extends StatefulWidget {
    String TitreTheme;

    EcranSolutions({Key key, this.TitreTheme}) : super(key: key);


  @override
  EcranSolutionsState createState() => EcranSolutionsState();

}


class EcranSolutionsState extends State<EcranSolutions> {

List tampon ;
String nom ;
int total ;
int indice ;
int numeroEcran ;

  get _aChoisi => null;


  void chargerEcran() {
    setState(() {
    if (widget.TitreTheme == 'DEFINITION')  {


        numeroEcran = 1 ;


    }

    else if (widget.TitreTheme == 'CONDUCTEUR')  {


        numeroEcran = 1 ;


    }

    else if (widget.TitreTheme == 'FAVORIS')  {

      numeroEcran = 1 ;
    }

    else if (widget.TitreTheme == 'FAVORIS')  {

      numeroEcran = 1 ;


    }



    else if (widget.TitreTheme == 'Jeux_Panneaux')  {

      numeroEcran = 3 ;

    }

    else if (widget.TitreTheme == 'Question_Examen')  {


        numeroEcran = 2 ;


    }

    });

  }

  @override
  void initState() {
    super.initState();
    chargerEcran() ;
    tampon =  Provider.of<Resultats>(context , listen: false).listeCouleur();



  }

Icon _coeur = Icon(
  Icons.close,
  color: Colors.white,
  size : 50 ,

);

bool _likeBool = false;

void _likeThis() {
  BoutonSuivant();

}




void BoutonSuivant() {
print('-------------------numeroEcran ------------') ;
print(numeroEcran);
  Provider.of<Resultats>(context , listen: false).reset();

  Navigator.of(context, rootNavigator: true ).push(TransitionBas(

      page :   Accueil(numeroEcran )));


}


  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    chargerEcran() ;

    print('-------------------numeroEcran ------------') ;
    print(numeroEcran);
    return Scaffold(
      extendBody: true,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white ,
      ),

      body:  Container(
        child: Stack(

          children:<Widget> [
            Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 3,
                    colors: [Colors.white, Colors.blueAccent]
                ),
              ),

              /*decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                 BoutonPlayStop(context)

                      stops: [0.1, 0.3, 0.7, 1],
                      colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink])
              ),*/
              child: Column(
                children: <Widget> [


                  _BilanResultat(),
                  Center(

                    child: GridView.builder(
                        shrinkWrap: true,

                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemCount: tampon.length,
                        itemBuilder: (context, index) {
                          Color item = tampon[index];

                          return GestureDetector(

                            onTap: ()  {

                               Navigator.of(context, rootNavigator: true ).push(MaterialPageRoute(
                                  builder: (BuildContext context  ) =>
                                      EcranResultat(indexCourant: index ,  Titre : widget.TitreTheme )));


                            },

                            child: Container(
                              height: double.infinity,



                              child: Card(
                                //semanticContainer: false,
                                // color : Colors.black ,

                                color: item   ,
                                elevation: 5.0,
                                shadowColor : Colors.black26 ,
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

                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),

                  ),



                ],
              ),
            ),

            Container(
              child: Positioned(

                bottom: 0,
                child: Stack(
                  alignment :  AlignmentDirectional.topCenter,
                  overflow: Overflow.visible,

                  children:<Widget> [
                    Container(

                      child: CustomPaint(
                        size: Size(size.width, 80),
                        painter:  DessinBasBarNavigation(),
                      ),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.close),
                          elevation: 0.1,
                          onPressed: () {
                            BoutonSuivant();
                           Provider.of<Resultats>(context , listen: false).SuprimerLesResultat();

                          }),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget> [
                          Container(
                            width: size.width * 0.20,
                          ),


                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),

          ],

        ),
      ),



      backgroundColor: null,

      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,


    );

  }



Widget _BilanResultat() {
  return RawMaterialButton(
    elevation: 1.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),
          child: Text(

            'SCORE ',
            style: TextStyle(
              fontFamily: 'Spectral',
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          ),



        ),


        Container(
          margin: EdgeInsets.only(left: 0, right: 0, bottom: 1, top: 5),


          child: Text(
            ' 0 / 10 ',
            style: TextStyle(
              fontFamily: 'Spectral',
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
                backgroundColor : Colors.white ,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),

        Column(
          children:<Widget> [
            Container(
              child: Text(
                  ' Section : ${TitreTheme}' ,

  style: TextStyle(
  fontFamily: 'Spectral',
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.w300,
  ),
              ),

              /*decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,

              ),*/
            ),
            /*Text(
              '${context.watch<EcranQuestionsState>().total}',

              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),*/
          ],
        ),
      ],
    ),

  );
}

}


