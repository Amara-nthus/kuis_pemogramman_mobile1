import 'package:flutter/material.dart';
import 'hospital_detail_page.dart';


class HospitalListPage extends StatefulWidget {
  const HospitalListPage({Key? key}) : super(key: key);

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  String selectedFilter = 'Semua';

  final List<Map<String, dynamic>> hospitals = [
    {
      'name': 'RSUD Kabupaten X',
      'distance': '1,2 km',
      'type': 'RS Umum',
      'services': ['IGD', 'Poliklinik', 'Rawat Inap', 'Laboratorium', 'Radiologi'], //[cite: 9]
      'image': 'assets/image/rumah_sakit1.jpg',
      'rating': '4.5',
      'reviews': '120',
      'address': 'Jl. Raya Kabupaten X No.10, Desa Sukamaju', //[cite: 9]
      'phone': '(021) 1234 5678',
    },
    {
      'name': 'RS Harapan Bunda',
      'distance': '4,8 km',
      'type': 'RS Umum',
      'services': ['IGD', 'Poliklinik', 'Laboratorium'],
      'image': 'assets/image/rumah_sakit2.jpg',
    },
    {
      'name': 'RS Sumber Sehat',
      'distance': '7,6 km',
      'type': 'RS Khusus',
      'services': ['Mata', 'Bedah', 'Rawat Inap'],
      'image': 'assets/image/rumah_sakit3.jpg',
    },
    {
      'name': 'RS Mitra Keluarga',
      'distance': '10,2 km',
      'type': 'RS Umum',
      'services': ['IGD', 'Poliklinik', 'Laboratorium'],
      'image': 'assets/image/rumah_sakit4.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF1565C0)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Rumah Sakit',
          style: TextStyle(
            color: Color(0xFF1565C0),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari rumah sakit di Kabupaten X...',
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('Semua'),
                const SizedBox(width: 8),
                _buildFilterChip('RS Umum'),
                const SizedBox(width: 8),
                _buildFilterChip('RS Khusus'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView.separated(
              itemCount: hospitals.length,
              separatorBuilder: (context, index) => Divider(color: Colors.grey.shade200, thickness: 1),
              itemBuilder: (context, index) {
                final hospital = hospitals[index];
                return _buildHospitalCard(hospital);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    bool isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1565C0) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF1565C0) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildHospitalCard(Map<String, dynamic> hospital) {
    bool isUmum = hospital['type'] == 'RS Umum';

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HospitalDetailPage(hospitalData: hospital),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey.shade200,
                  child: Image.asset(
                    hospital['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.local_hospital, color: Colors.grey, size: 40);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),

          // Detail Informasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospital['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1565C0)),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey.shade600),
                    const SizedBox(width: 4),
                    Text(
                      hospital['distance'],
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isUmum ? Colors.green.shade50 : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    hospital['type'],
                    style: TextStyle(
                      color: isUmum ? Colors.green.shade700 : Colors.blue.shade700,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: (hospital['services'] as List<String>).map((service) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        service,
                        style: TextStyle(color: Colors.blue.shade700, fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
        ),
    );
  }
}