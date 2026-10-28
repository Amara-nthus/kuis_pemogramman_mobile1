import 'package:flutter/material.dart';
import 'hospital_list_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1565C0), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Peta Lokasi',
          style: TextStyle(
            color: Color(0xFF1565C0),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.gps_fixed, color: Color(0xFF1565C0)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/map_background.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: MediaQuery.of(context).size.width * 0.25,
            child: _buildGeofenceArea(),
          ),


          Positioned(
            top: 60,
            left: 40,
            child: _buildMarker('RSUD Kabupaten X', Colors.red, Icons.local_hospital),
          ),
          Positioned(
            top: 200,
            left: 40,
            child: _buildMarker('Puskesmas Sukamaju', Colors.green, Icons.health_and_safety),
          ),
          Positioned(
            top: 400,
            left: 20,
            child: _buildMarker('RS Harapan Bunda', Colors.red, Icons.local_hospital),
          ),
          Positioned(
            top: 300,
            left: 220,
            child: _buildMarker('Klinik Sehat Mandiri', Colors.red, Icons.local_hospital),
          ),

          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari lokasi...',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 24,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.gps_fixed, color: Color(0xFF1565C0)),
              onPressed: () {},
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HospitalListPage()),
                  );
                },
                child: _buildLegendItem('Rumah Sakit', Colors.red, Icons.local_hospital),
              ),
              _buildLegendItem('Puskesmas', Colors.green, Icons.health_and_safety),
              _buildLegendItem('Klinik', Colors.purple, Icons.location_on),
              _buildLegendItem('Area Geofencing', Colors.blue, Icons.adjust),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarker(String title, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildGeofenceArea() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, Color color, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.black87),
        ),
      ],
    );
  }
}