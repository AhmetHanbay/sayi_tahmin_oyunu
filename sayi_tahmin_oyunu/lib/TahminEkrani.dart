import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/SonucEkrani.dart';

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print("Rastgele Sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Tahmin Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Kalan Hakkınız : $kalanHak",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 30),
              ),
              Text(
                "Yardım : $yonlendirme",
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfTahmin,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      labelText: "Tahmin",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "Tahmin Et",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent),
                  onPressed: () {
                    setState(() {
                      kalanHak = kalanHak - 1;
                    });
                    int tahmin = int.parse(tfTahmin.text);

                    if (tahmin == rastgeleSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sonucekrani(
                                    sonuc: true,
                                  )));
                      return;
                    }

                    if (tahmin > rastgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini Azalt";
                      });
                    }

                    if (tahmin < rastgeleSayi) {
                      setState(() {
                        yonlendirme = "Tahmini Arttır";
                      });
                    }

                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sonucekrani(
                                    sonuc: false,
                                  )));
                    }

                    tfTahmin.text = "";
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
