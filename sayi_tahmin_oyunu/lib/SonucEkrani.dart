import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/main.dart';

class Sonucekrani extends StatefulWidget {
  bool sonuc;

  Sonucekrani({required this.sonuc});

  @override
  State<Sonucekrani> createState() => _SonucekraniState();
}

class _SonucekraniState extends State<Sonucekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Sonuç Ekranı"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.sonuc
                  ? Image.asset("resimler/mutlu_resim.png")
                  : Image.asset("resimler/uzgun_resim.png"),
              Text(
                widget.sonuc ? "Kazandınız" : "Kaybettiniz",
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Tekrar Dene",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
