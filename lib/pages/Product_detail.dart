import 'package:corelab_project/pages/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProducDetailState();
}

class _ProducDetailState extends State<ProductDetail> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Map<String,dynamic>> data = [
    { 'title':'Condicionador Ácido',
      'desc':'Condicionador Ácido',
      'preco':'29,90',
      'parcela': '12',
      'valorParcela':'1,99',
      'dataPubicacao':'Hoje',
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
      'dataPubicacao':'Hoje',
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
      'dataPubicacao':'Ontem',
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
      'dataPubicacao':'Ontem',
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
      'dataPubicacao':'Ontem',
      'lancamento':true,
      'categoria':'proteção',
      'pdesconto':10,
      'urlImage':'https://s3-alpha-sig.figma.com/img/d56c/2671/cf797f31fdd77ef19dbe24818374720e?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qJ1O2xygSpYsm5ZKB6sI-r390aBYO1DvSNAUEe1OPHXihpHUrHbuEK500Wc~OmmDOb3VZJc93yVmAhn7j1u~dEBIUASEakKyS4GYuGNCRCLJyT0f6ZH1BNlLVkwXL9PcmtnHEJSyCMh~Nwm3wtnaETaj5dhmJ1t8e4diBKuoPKRG4jZ6wFGVHbiUOJk9YjHIGa0uQmt3EbnwPHkcZrcGImADzCWMz225erNBWuf5kwONqLgGA8Yy7Slnx6TjcQFuoZJrOud4OSJJdkvdfoOD--qY8VGfeLHoRdng6i2rQ2pEBFRWCCgQUe572ZciTIjL6VjOrSkzNzHYyKdW9zTzlg__'
    },
  ];



  @override
  Widget build(BuildContext context) {
    bool imprimir = false;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        child: Column(
          children: [
            NavBar(scaffoldkey: scaffoldKey),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color:Color.fromRGBO(247, 249, 250, 1),
                  child:
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Últimos anúncios',style: GoogleFonts.dmSans(fontWeight:FontWeight.w400,fontSize:22,),),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(padding: EdgeInsets.zero,itemCount:data.length, itemBuilder: (context,index){
                  var result=data[index];
                  imprimir=false;
                  if(index==0 || data[index]['dataPubicacao'] != data[index-1]['dataPubicacao']  ){
                    imprimir=true;
                  }

                return    Column(
                  children: [
                    imprimir?
                    ListTile(title:Text(result['dataPubicacao'],style:GoogleFonts.dmSans(fontSize: 14,fontWeight:FontWeight.w400,color:Color.fromRGBO(124, 144, 148, 1)),),tileColor:Color.fromRGBO(247, 249, 250, 1),):SizedBox(height: 0,),
                    Container(

                        padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(235, 241, 244, 1),width: 1),
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(5.0), // Bordas arredondadas
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
                }),
              ),
            )
          ],
        )
      ),

    );

  }
}
