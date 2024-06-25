import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/lokasi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_page.dart'; // Import ProfilePage jika belum
import 'detailPage.dart'; // Import DetailPage

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(), // Ganti ini dengan halaman utama yang diinginkan
    RiwayatPage(), // Placeholder untuk riwayat
    ProfilePage(), // Halaman Profil
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAEA),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(height: 140, width: double.infinity, color: Colors.brown),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 50, height: 100),
                              Text(
                                "Halo user selamat datang",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Menu warung MakByar",
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none, // Hilangkan border default
                            contentPadding: EdgeInsets.symmetric(vertical: 15), // Tambahkan padding vertikal
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(34.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryCard(
                            imagePath: "assets/rice.png",
                            label: "Makanan",
                          ),
                          CategoryCard(
                            imagePath: "assets/drink.png",
                            label: "Minuman",
                          ),
                          CategoryCard(
                            imagePath: "assets/hot-soup.png",
                            label: "Soup",
                          ),
                          CategoryCard(
                            imagePath: "assets/sate.png",
                            label: "Sate",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Rekomendasi Makanan",
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('foodRecommendations').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        var documents = snapshot.data!.docs;
                        return Column(
                          children: documents.map((doc) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => detailPage()),
                                );
                              },
                              child: FoodRecommendationCard(
                                imagePath: doc['imagePath'],
                                foodName: doc['foodName'],
                                rating: doc['rating'].toString(),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String label;

  CategoryCard({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5), // Tambahkan margin di sekitar kartu
      child: Card(
        elevation: 5, // Tambahkan elevasi untuk efek bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Tambahkan border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Kurangi padding di sini
          child: Container(
            width: 50,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Tambahkan penataan vertikal ke tengah
              children: [
                Image.asset(
                  imagePath,
                  width: 30,
                  height: 30,
                ),
                SizedBox(height: 8), // Kurangi jarak antar elemen
                Text(
                  label,
                  style: GoogleFonts.poppins(fontSize: 10), // Kurangi ukuran font
                  textAlign: TextAlign.center, // Tambahkan perataan teks ke tengah
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodRecommendationCard extends StatelessWidget {
  final String imagePath;
  final String foodName;
  final String rating;

  FoodRecommendationCard({
    required this.imagePath,
    required this.foodName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Tambahkan elevasi untuk efek bayangan
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Tambahkan border radius
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Tambahkan margin antar kartu
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Image.network(imagePath, fit: BoxFit.cover), // Ganti Image.asset ke Image.network untuk gambar dari URL
          ),
          Container(
            width: double.infinity,
            color: Colors.white, // Tambahkan warna background putih
            padding: EdgeInsets.all(10), // Tambahkan padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Supaya teks dimulai dari kiri
              children: [
                Text(
                  foodName,
                  style: GoogleFonts.poppins(
                    fontSize: 16, // Sedikit perbesar ukuran font
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // Tambahkan jarak antara foodName dan rating
                Text(
                  "Rating $rating ⭐",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
