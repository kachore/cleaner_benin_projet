import 'package:cleanerbenin/pages/order.dart';
import 'package:cleanerbenin/pages/order_by_kg.dart';
import 'package:cleanerbenin/widgetss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Choix extends StatefulWidget {
  String typeService = "";
  Choix({required this.typeService, super.key});

  @override
  State<Choix> createState() => _ChoixState();
}

class _ChoixState extends State<Choix> {
  bool en = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: mainColor,
        title: Column(
          children: [
            Text(
              "GoPressing".tr,
              style: TextStyle(color: Colors.white, fontFamily: 'bold'),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                en = !en;
                if (en) {
                  var locale = Locale('en', 'US');
                  Get.updateLocale(locale);
                } else {
                  var locale = Locale('fr', 'FR');
                  Get.updateLocale(locale);
                }
              });
            },
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  en == true ? "Français" : "English",
                  style: TextStyle(
                      fontFamily: 'bold', color: Colors.white, fontSize: 16),
                ))),
          ),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Badge(
                  label: Text('5'),
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            h(20),
            Text(
              "Veuillez choisir un type de lavage",
              style:
                  TextStyle(fontFamily: 'bold', color: mainColor, fontSize: 20),
            ),
            h(180),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          typeLavage = "quantite";
                          print(typeLavage);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderPage(
                                      cagetorie: "linge",
                                      typeService: widget.typeService,
                                    )));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 200,
                          width: 160,
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/quantite-removebg-preview.png")),
                              SizedBox(height: 4),
                              Text(
                                "Lavage par\nquantité".tr,
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    color: mainColor,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  w(20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          typeLavage = "kg";
                          print(typeLavage);
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPageByKg(
                                typeService: widget.typeService,
                              ),
                            ));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: 200,
                          width: 160,
                          child: Column(
                            children: [
                              Container(
                                  height: 150,
                                  child: Image.asset(
                                      "assets/images/kg-removebg-preview.png")),
                              SizedBox(height: 4),
                              Text(
                                "Lavage par kilogramme".tr,
                                style: TextStyle(
                                    fontFamily: 'bold',
                                    color: mainColor,
                                    fontSize: 15),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
