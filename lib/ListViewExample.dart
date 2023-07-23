import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {

    // LIST DATA KELOMPOK ARRAY MULTI DIMENSION
    final List<List<String>> DataKelompok = [
      ['Derviska Adi Nugroho', '20104410079', 'https://smart.unisbablitar.ac.id/uploads/unisba/fotouser/thumb/120131.jpg','CODING SEMUA'],
      ['Krisna Giana Puta', '20104410050', 'https://smart.unisbablitar.ac.id/uploads/unisba/fotouser/thumb/119675.jpg','FASILITATOR'],
      ['Nanda Fatkhur Rohman', '20104410041', 'https://smart.unisbablitar.ac.id/uploads/unisba/fotouser/thumb/119811.jpg','SUPORTER 1'],
      ['Muhammad Verel Prisco Alfito Devani', '20104410009', 'https://unisba.siakadcloud.com/uploads/unisba/fotouser/thumb/118063.jpg','SUPORTER 2'],
      ['Agung Kriswanto', '20104410094', 'https://smart.unisbablitar.ac.id/uploads/unisba/fotouser/thumb/120627.jpg','SUPORTER 3'],
    ];

    // LIST DATA DataKelompok WITH ACTION TO ROUTE /detail
    final List<Widget> listMonthWithAction = List.generate(
      // PUSH DETAIL IN SCREENDEYAIL
      DataKelompok.length, (index) => ListTile(
        title: Text(DataKelompok[index][0]),
        subtitle: Text(DataKelompok[index][1]),
        leading: CachedNetworkImage(
          imageUrl: DataKelompok[index][2],
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(DataKelompok[index]),
            ),
          );
        },
      ),
    );


    // VIEW
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('ListView Example')),
        ),
        body: ListView(
          children: listMonthWithAction,
        ),
      ),
    );
  }
}

// DETAIL ROUTE
class DetailScreen extends StatelessWidget {
  const DetailScreen(this.mahasiswa, {Key? key}) : super(key: key);
  
  final List mahasiswa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mahasiswa[0]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[            
           
            // FOTO MAHASISWA
            CachedNetworkImage(
              imageUrl: mahasiswa[2],
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            // NAMA MAHASISWA
            Text(
              "Nama Mahasiswa : ${mahasiswa[0]}",
              textAlign: TextAlign.left,
              style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    )
            ),
            
            // NIM MAHASISWA
            Text("NIM            : ${mahasiswa[1]}",
            textAlign: TextAlign.left,
            style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    )
            ),

            //JOBDESK MAHASISWA
            Text("Jobdesk     : ${mahasiswa[3]}",
            textAlign: TextAlign.left,
            style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    )
            ),
          ],
        ),
      ),
    );
  }
}