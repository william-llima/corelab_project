import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorias extends StatefulWidget {
  const Categorias({super.key});

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  List<String> Categorias = [
    'Higiene',
    'Proteção'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color:Color.fromRGBO(247, 249, 250, 1),
            child:
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,60,0,20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categorias',style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:24,color:Color.fromRGBO(0, 36, 41, 1)),),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(padding:EdgeInsets.all(0),itemCount:Categorias.length, itemBuilder: (context,index){
              String result = Categorias[index];
              return ListTile(title:Text(result,style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,color:Color.fromRGBO(0, 180, 204, 1),fontSize: 20),),tileColor: Color.fromRGBO(255, 255, 255, 1),shape: Border(
                bottom: BorderSide(width:1,color:Color.fromRGBO(235, 241, 244, 1)),
              ),);
            }),
          ),
        ],
      ),
    );
  }
}
