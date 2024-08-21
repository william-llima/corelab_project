import 'package:corelab_project/searchHistory.dart';
import 'package:flutter/material.dart';
import 'package:corelab_project/custom_material/search2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final scaffoldkey;
  const NavBar({super.key, required this.scaffoldkey});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      color: Color.fromRGBO(0, 180, 204, 1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 65.0, 10.0, 10.0),
        child: Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: (){
                    showSearch2(context: context, delegate: CustomSearchDelegate(),);
                  },
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 0),
                child: Icon(
                  Icons.search,
                  weight: 30 ,
                  color: Color.fromRGBO(0, 180, 204, 1),
                  size: 24, // Ajuste o tamanho do ícone aqui
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomSearchDelegate extends SearchDelegate2{


  List<String> recentQueries = [];
  List<Map<String,dynamic>> data = [
    { 'title':'Condicionador Ácido',
      'desc':'Condicionador Ácido',
      'preco':'29,90',
      'parcela': '12',
      'valorParcela':'1,99',
      'dataPubicacao':'hoje',
      'pdesconto':10,
      'descontoAtivo':false,
      'lancamento':true,
      'categoria':'higiene',
      'urlImage':'https://s3-alpha-sig.figma.com/img/3ded/87b5/07c8c009afd033ee12f5c860c659db64?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mBNAQ7Fywqdaxx5ZsR7zHmYFFiHGZB4lqkk1UqLdMs66dXFrnsXpRSaJIejrHaeQ3QlC1NdTq3gEg5Ma0cveB0Bw0GGKLy0lJLRFsC0R7pM9zvHk5gqZxr0YslENLb5KyCIqiM4IUVSXffxZ92FHyMeChyUjiRo4gKcTMjCpJVmfv~gCHnYj89ZcZuRohhrmmmfBiOFnyy6judbZCm1moeCXpjxRXwB1dU42GUiK2D1HAkIYcf8KB4LOiZIWOZjjZDClCHCnX1amMNmMje-M68H-7-Rpas8sN6FpHeDG7gMpkcQ9Y32JLP-qTqlEGFh49H-XKN3XZeA5LRT0CzEpZg__'
    },
    {'title':'Condicionador Ácido',
      'desc':'Condicionador Ácido',
      'preco':'29,90',
      'parcela': '12',
      'valorParcela':'1,99',
      'dataPubicacao':'hoje',
      'lancamento':true,
      'pdesconto':10,
      'descontoAtivo':true,
      'categoria':'higiene',
      'urlImage':'https://s3-alpha-sig.figma.com/img/3ded/87b5/07c8c009afd033ee12f5c860c659db64?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mBNAQ7Fywqdaxx5ZsR7zHmYFFiHGZB4lqkk1UqLdMs66dXFrnsXpRSaJIejrHaeQ3QlC1NdTq3gEg5Ma0cveB0Bw0GGKLy0lJLRFsC0R7pM9zvHk5gqZxr0YslENLb5KyCIqiM4IUVSXffxZ92FHyMeChyUjiRo4gKcTMjCpJVmfv~gCHnYj89ZcZuRohhrmmmfBiOFnyy6judbZCm1moeCXpjxRXwB1dU42GUiK2D1HAkIYcf8KB4LOiZIWOZjjZDClCHCnX1amMNmMje-M68H-7-Rpas8sN6FpHeDG7gMpkcQ9Y32JLP-qTqlEGFh49H-XKN3XZeA5LRT0CzEpZg__'
    },
    {'title':'Mascara Protetora',
      'desc':'Mascara Protetora',
      'preco':'59,90',
      'parcela': '12',
      'valorParcela':'4,99',
      'dataPubicacao':'ontem',
      'lancamento':true,
      'descontoAtivo':true,
      'categoria':'proteção',
      'pdesconto':10,
      'urlImage':'https://s3-alpha-sig.figma.com/img/d56c/2671/cf797f31fdd77ef19dbe24818374720e?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qJ1O2xygSpYsm5ZKB6sI-r390aBYO1DvSNAUEe1OPHXihpHUrHbuEK500Wc~OmmDOb3VZJc93yVmAhn7j1u~dEBIUASEakKyS4GYuGNCRCLJyT0f6ZH1BNlLVkwXL9PcmtnHEJSyCMh~Nwm3wtnaETaj5dhmJ1t8e4diBKuoPKRG4jZ6wFGVHbiUOJk9YjHIGa0uQmt3EbnwPHkcZrcGImADzCWMz225erNBWuf5kwONqLgGA8Yy7Slnx6TjcQFuoZJrOud4OSJJdkvdfoOD--qY8VGfeLHoRdng6i2rQ2pEBFRWCCgQUe572ZciTIjL6VjOrSkzNzHYyKdW9zTzlg__'
    },
    {'title':'Condicionador Ácido',
    'desc':'Condicionador Ácido',
      'preco':'29,90',
      'parcela': '12',
      'valorParcela':'1,99',
      'descontoAtivo':false,
      'dataPubicacao':'hoje',
      'lancamento':true,
      'pdesconto':10,
      'categoria':'higiene',
      'urlImage':'https://s3-alpha-sig.figma.com/img/3ded/87b5/07c8c009afd033ee12f5c860c659db64?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mBNAQ7Fywqdaxx5ZsR7zHmYFFiHGZB4lqkk1UqLdMs66dXFrnsXpRSaJIejrHaeQ3QlC1NdTq3gEg5Ma0cveB0Bw0GGKLy0lJLRFsC0R7pM9zvHk5gqZxr0YslENLb5KyCIqiM4IUVSXffxZ92FHyMeChyUjiRo4gKcTMjCpJVmfv~gCHnYj89ZcZuRohhrmmmfBiOFnyy6judbZCm1moeCXpjxRXwB1dU42GUiK2D1HAkIYcf8KB4LOiZIWOZjjZDClCHCnX1amMNmMje-M68H-7-Rpas8sN6FpHeDG7gMpkcQ9Y32JLP-qTqlEGFh49H-XKN3XZeA5LRT0CzEpZg__'
    },
    {'title':'Mascara Protetora',
      'desc':'Mascara Protetora',
      'preco':'59,90',
      'parcela': '12',
      'descontoAtivo':false,
      'valorParcela':'4,99',
      'dataPubicacao':'ontem',
      'lancamento':true,
      'categoria':'proteção',
      'pdesconto':10,
      'urlImage':'https://s3-alpha-sig.figma.com/img/d56c/2671/cf797f31fdd77ef19dbe24818374720e?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qJ1O2xygSpYsm5ZKB6sI-r390aBYO1DvSNAUEe1OPHXihpHUrHbuEK500Wc~OmmDOb3VZJc93yVmAhn7j1u~dEBIUASEakKyS4GYuGNCRCLJyT0f6ZH1BNlLVkwXL9PcmtnHEJSyCMh~Nwm3wtnaETaj5dhmJ1t8e4diBKuoPKRG4jZ6wFGVHbiUOJk9YjHIGa0uQmt3EbnwPHkcZrcGImADzCWMz225erNBWuf5kwONqLgGA8Yy7Slnx6TjcQFuoZJrOud4OSJJdkvdfoOD--qY8VGfeLHoRdng6i2rQ2pEBFRWCCgQUe572ZciTIjL6VjOrSkzNzHYyKdW9zTzlg__'
    },
  ];

 @override
  List<Widget> buildActions(BuildContext context) {
    if(query != ''){
      return[
      IconButton(onPressed: (){
        query='';
      }, icon: Icon(Icons.close,size: 24,color:Colors.grey,)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Filtros',style: GoogleFonts.dmSans(fontWeight: FontWeight.w700,color:Colors.white,fontSize: 14),),
        )
      ];
    }else{
      return [];
    }

  }




  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context,null);
    }, icon: Icon(Icons.arrow_back,color:Colors.white,));

  }
  @override
  Widget buildResults(BuildContext context) {

    List<dynamic> datasearch=[];
    Provider.of<SearchHistory>(context,listen: false).adicionaHistory(query);

      for (var i in data){
        if(i['title'].toLowerCase().contains(query.toLowerCase()) && query !=''){
          datasearch.add(i);
        }else if(i['desc'].toLowerCase().contains(query.toLowerCase())&& query !=''){
          datasearch.add(i);
        }else if(i['preco'].toLowerCase().contains(query.toLowerCase())&& query !=''){
          datasearch.add(i);
        }else if(i['categoria'].toLowerCase().contains(query.toLowerCase())&& query !=''){
          datasearch.add(i);
        }
      }

    return datasearch.length != 0 ? ListView.builder(itemCount:datasearch.length,itemBuilder: (context,index){
      var result = datasearch[index];
      return Column(
        children: [
          index==0?Container(
            color: Color.fromRGBO(235, 241, 244, 1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 8, 0, 0),
              child: ListTile( title: Text(datasearch.length.toString()+' resultados encontrados',style: GoogleFonts.dmSans(fontSize:16,fontWeight:FontWeight.w400,color:Color.fromRGBO(0, 36, 41, 1)
              ),),),
            ),
          ):SizedBox.shrink(),
          Container(

            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(235, 241, 244, 1),width: 1),
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Container(
                    width:100,
                    height: 100,

                    child: Image.network(result['urlImage'])),
                SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    result['descontoAtivo']?Container(
                        padding: EdgeInsets.all(4.0),

                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 180, 204, 1),
                          borderRadius: BorderRadius.circular(5.0), // Bordas arredondadas
                        ),
                        child: Text(result['pdesconto'].toString()+'% OFF',style: GoogleFonts.dmSans(fontWeight: FontWeight.w700,fontSize:10,color:Colors.white),)):SizedBox(height: 0,),

                    Text(result['title'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:16,color:Color.fromRGBO(0, 36, 41, 1) ),),
                    SizedBox(height:5,),

                    result['descontoAtivo']?Text("R\$ "+result['preco'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:14,color:Color.fromRGBO(124, 144, 148, 1),decoration: TextDecoration.lineThrough,decorationColor:Color.fromRGBO(124, 144, 148, 1) ),):SizedBox(height: 0,),
                    SizedBox(height:5,),
                    Text('R\$'+result['preco'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight: FontWeight.w400,fontSize:20,color:Color.fromRGBO(0, 36, 41, 1)),),
                    SizedBox(height:5,),
                    Text('Em até '+result['parcela']+'x de R\$ '+result['valorParcela'],style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:14,color:Color.fromRGBO(0, 180, 204, 1)),),
                    SizedBox(height:5,),
                    Text(result['lancamento']?'NOVO':'Mais Vendido',style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize: 12,color:Color.fromRGBO(124, 144, 148, 1)),),
                  ],
                )
              ],
            ),
          ),

        ],
      );

    }):SingleChildScrollView(

      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image(image: AssetImage('images/rafiki.png'))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resultado não encontrado",style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize: 20,color: Color.fromRGBO(0, 36, 41, 1) ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width:MediaQuery.of(context).size.width*0.8 ,
                    child: Text("Não encontramos nenhum resultado parecido com '"+query+"'.",style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize: 16,color: Color.fromRGBO(74, 101, 105, 1) ),textAlign: TextAlign.center,))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> dataHistorico = Provider.of<SearchHistory>(context,listen:false).history;
    List<dynamic> datasearch=[];
    if(query != ''){
      for (var i in data){
        if(i['title'].toLowerCase().contains(query.toLowerCase())){
          datasearch.add(i);
        }else if(i['desc'].toLowerCase().contains(query.toLowerCase())){
          datasearch.add(i);
        }else if(i['preco'].toLowerCase().contains(query.toLowerCase())){
          datasearch.add(i);
        }else if(i['categoria'].toLowerCase().contains(query.toLowerCase())){
          datasearch.add(i);
        }
      }
    }else{
      datasearch = dataHistorico;
    }
    return ListView.builder(itemCount:datasearch.length,itemBuilder: (context,index){
      var result = datasearch[index];
      return query==''? Column(
        children: [
          index==0?ListTile(  title: Text('Pesquisas recentes',style: GoogleFonts.dmSans(fontSize:16,fontWeight:FontWeight.w400),),):SizedBox(height:0,),
          ListTile(   leading:Icon(Icons.history,color: Colors.grey,), title: Text(result,style: TextStyle(color: Colors.grey),),onTap: (){
            query = result;
          },),
        ],
      ):
      Column(
        children: [
          index==0?Container(
            color: Color.fromRGBO(235, 241, 244, 1),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2, 8, 0, 0),
              child: ListTile( title: Text(datasearch.length.toString()+' resultados encontrados',style: GoogleFonts.dmSans(fontSize:16,fontWeight:FontWeight.w400,color:Color.fromRGBO(0, 36, 41, 1)
                    ),),),
            ),
          ):SizedBox(height:0,),
          Container(

            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(235, 241, 244, 1),width: 1),
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Container(
                  width:100,
                    height: 100,

                    child: Image.network(result['urlImage'])),
                SizedBox(
                  width: 6,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    result['descontoAtivo']?Container(
                        padding: EdgeInsets.all(4.0),

                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 180, 204, 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(result['pdesconto'].toString()+'% OFF',style: GoogleFonts.dmSans(fontWeight: FontWeight.w700,fontSize:10,color:Colors.white),)):SizedBox(height: 0,),

                    Text(result['title'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:16,color:Color.fromRGBO(0, 36, 41, 1) ),),
                    SizedBox(height:5,),

                    result['descontoAtivo']?Text("R\$ "+result['preco'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:14,color:Color.fromRGBO(124, 144, 148, 1),decoration: TextDecoration.lineThrough,decorationColor:Color.fromRGBO(124, 144, 148, 1) ),):SizedBox(height: 0,),
                    SizedBox(height:5,),
                    Text('R\$'+result['preco'],textAlign: TextAlign.start,style:GoogleFonts.dmSans(fontWeight: FontWeight.w400,fontSize:20,color:Color.fromRGBO(0, 36, 41, 1)),),
                    SizedBox(height:5,),
                    Text('Em até '+result['parcela']+'x de R\$ '+result['valorParcela'],style:GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:14,color:Color.fromRGBO(0, 180, 204, 1)),),
                    SizedBox(height:5,),
                    Text(result['lancamento']?'NOVO':'Mais Vendido',style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize: 12,color:Color.fromRGBO(124, 144, 148, 1)),),
                  ],
                )
              ],
            ),
          ),

        ],
      );

    });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(0, 180, 204, 1),
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        titleSpacing: 0,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }


}
