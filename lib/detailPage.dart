import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(123, 190, 190, 190),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                                  width: double.infinity,
                                  height: 150,
                                  child: Image.asset("assets/nasiGoreng.jpeg", fit: BoxFit.cover,),
                                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: 400,
                child: Text(
                  "Nasi Goreng", 
                  style: GoogleFonts.poppins(
                    fontSize: 20,fontWeight:FontWeight.bold 
                    ),),
                
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:26.0),
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      "Harga : 20.000", 
                      style: GoogleFonts.poppins(
                        fontSize: 15, 
                        ),),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(color: Color.fromARGB(237, 147, 252, 115),
                    borderRadius: BorderRadius.circular(30)),
                    child:   Padding(
                      padding: const EdgeInsets.only(top: 14.0, left: 36.0),
                      child: SizedBox(
                      
                      child: Text("Beli sekarang", style: GoogleFonts.poppins(fontSize:15, color:Colors.white ),),
                    
                                        ),
                    ),
                  )
                  
                )
        
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 15),
              child: SizedBox(
                width: 400,
                child: Text(
                  "Rating 4.5 ⭐⭐⭐⭐", 
                  style: GoogleFonts.poppins(
                    fontSize: 14 
                    
                    ),),
                
              ),
            ),

                Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 20),
                          child: Column(
                            children: [
                              Text(
                                "Description", style: GoogleFonts.poppins(fontWeight:FontWeight.bold),),
                              Text(
                                "Mi goreng berarti  adalah hidangan mi yang dimasak dengan digoreng tumis khas Indonesia. Mi goreng juga populer dan juga digemari di Malaysia, dan Singapura.", style: GoogleFonts.poppins(fontSize: 14),),
                            ],
                          )
                        ),
                        
                        
                 ),
                
          ],

        )
        ),
    );
  }
}