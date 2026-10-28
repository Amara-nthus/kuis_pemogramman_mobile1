import 'package:flutter/material.dart';
import '../widgets/CategoryCard.dart';
import 'hospital_list_page.dart';
import 'map_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/rumah_sakit.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Smart Village',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1565C0),
                                ),
                              ),
                              Text(
                                'Sehat Bersama, Desa Maju',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF1565C0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Cari lokasi Klinik, Puskesmas dan\nRumah Sakit terdekat di Kabupaten X',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1565C0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 290),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari nama fasilitas kesehatan...',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Grid Menu
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                    children: [
                      CategoryCard(
                        title: 'Rumah Sakit',
                        icon: Icons.local_hospital,
                        backgroundColor: const Color(0xFFE3F2FD),
                        iconAndTextColor: const Color(0xFF1565C0),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HospitalListPage()),
                          );
                        },
                      ),
                      CategoryCard(
                        title: 'Puskesmas',
                        icon: Icons.health_and_safety,
                        backgroundColor: const Color(0xFFE8F5E9),
                        iconAndTextColor: const Color(0xFF2E7D32),
                        onTap: () {},
                      ),
                      CategoryCard(
                        title: 'Klinik',
                        icon: Icons.medical_services,
                        backgroundColor: const Color(0xFFFCE4EC),
                        iconAndTextColor: const Color(0xFFC2185B),
                        onTap: () {},
                      ),
                      CategoryCard(
                        title: 'Peta Lokasi',
                        icon: Icons.location_on,
                        backgroundColor: const Color(0xFFFFF8E1),
                        iconAndTextColor: const Color(0xFFF57F17),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const MapPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Peta'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}