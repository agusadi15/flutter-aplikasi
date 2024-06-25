import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class loginGooglePage extends StatelessWidget {
  const loginGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Stack( 
          alignment: Alignment.center,
          children: [
            Image.asset("backgroundMakanan.jpeg", 
            fit:BoxFit.cover ,
            height:double.infinity ,
            width: double.infinity,
            alignment: Alignment.center,
            ),

            //card bawah
            Positioned( 
              bottom: 50,
              left: 10,
              right: 10,
              child: Card(
                color: Colors.black.withOpacity(0.2),
                elevation: 8.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text("MAKAN SEPUASNYA DISINI",style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Nikmati makanan dengan penuh cita rasa", style: GoogleFonts.poppins(fontSize: 12, color:Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 140, right: 140, ),
                    child: Card(
                      child: Row(children: [
                        Image.asset("logo_google.jpg", width: 30,),
                        SizedBox(width: 50,),
                        Text("Login", style: GoogleFonts.poppins(fontSize: 15, color:Colors.black),)
                      ],),
                    ),
                  )
                ]),

              )),

            //judul apk
            Positioned(
            top: 50,
            child: Text("MAKBYAR",
            style:GoogleFonts.montserrat(
              color: Colors.white, 
              fontSize: 30,
              fontWeight:FontWeight.bold), 
            
            ))
          ],
         ),
      ),
    );
  }
}