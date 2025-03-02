import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import '../widgetss.dart';

class DetailHistorique extends StatefulWidget {
  String code_commande = "";
  DetailHistorique({required this.code_commande, super.key});

  @override
  State<DetailHistorique> createState() => _DetailHistoriqueState();
}

class _DetailHistoriqueState extends State<DetailHistorique> {
  getCommande() async {
    var url =
        "https://feisholadigital.com/backend_lavery_app/get_detail_commande.php?code_commande=${widget.code_commande}";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  getArticle() async {
    var url =
        "https://feisholadigital.com/backend_lavery_app/get_article.php?code_commande=${widget.code_commande}";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    var pub = await json.decode(response.body);
    return pub;
  }

  @override
  void initState() {
    print(widget.code_commande);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        shadowColor: Colors.black,
        elevation: 3,
        title: Text(
          "Detail Commande".tr,
          style:
              TextStyle(fontFamily: 'bold', fontSize: 18, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 191, 32, 21)),
                    ),
                    h(15),
                    Text(
                      "Collecte\ndes Linges",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'bold',
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Container(
                  height: 4,
                  width: 20,
                  color: Color.fromARGB(255, 191, 32, 21),
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Icon(
                          Icons.wash,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 191, 32, 21)),
                    ),
                    h(15),
                    Text(
                      "Lavage\ndes Linges",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'bold',
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Container(
                  height: 4,
                  width: 20,
                  color: Color.fromARGB(255, 191, 32, 21),
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Icon(
                          Icons.bus_alert_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color.fromARGB(255, 191, 32, 21)),
                    ),
                    h(15),
                    Text(
                      "Paiement\n&Livraison",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'bold',
                          fontSize: 15),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ],
            ),
            h(20),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "LES ARTICLES".tr,
                      style: TextStyle(
                          fontFamily: 'normal',
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    h(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Noms".tr,
                            style: TextStyle(
                                fontFamily: 'normal',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        Text("Quantité".tr,
                            style: TextStyle(
                                fontFamily: 'normal',
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 50),
                      margin: EdgeInsets.only(top: 10),
                      child: FutureBuilder(
                        future: getArticle(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  "Erreur de chargement. Veuillez relancer l'application"
                                      .tr),
                            );
                          }
                          if (snapshot.hasData) {
                            return Container(
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(snapshot.data![index]['nom'],
                                              style: TextStyle(
                                                  fontFamily: 'normal',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      Text(snapshot.data![index]['q'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                          return Container(
                              height: 50,
                              width: 50,
                              child: Center(
                                  child: Lottie.asset(
                                      "assets/images/auto_loading.json",
                                      height: 150)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 600,
              margin: EdgeInsets.only(top: 10),
              child: FutureBuilder(
                future: getCommande(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                          "Erreur de chargement. Veuillez relancer l'application"),
                    );
                  }
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    "INFOMATIONS SUPPLÉMENTAIRE".tr,
                                    style: TextStyle(
                                        color: mainColor,
                                        fontFamily: 'normal',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Type de Service : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(snapshot.data![index]['typeService'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Type Livraison : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['type_de_livraison'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Type Lavage : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['type_de_lavage'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Divider(),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Date de Collecte : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['date_collecte'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Heure de Collecte : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['heure_collecte'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Lieu de Collecte : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['quartier_collecte'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Divider(),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Date de Livraison : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Container(
                                          child: Text(
                                              snapshot.data![index]
                                                  ['date_livraison'],
                                              style: TextStyle(
                                                  fontFamily: 'normal',
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)))
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Heure de Livraison : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['heure_livraison'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                  h(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Lieu de Livraison : ".tr,
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      Text(
                                          snapshot.data![index]
                                              ['quartier_livraison'],
                                          style: TextStyle(
                                              fontFamily: 'normal',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index]['nom'],
                                      style: TextStyle(
                                          fontFamily: 'normal',
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ],
                              ),
                              Text(snapshot.data![index]['q'],
                                  style: TextStyle(
                                      fontFamily: 'normal',
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return Container(
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Lottie.asset("assets/images/auto_loading.json",
                              height: 150)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  lesArticles(String nom, q) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "LES ARTICLES".tr,
              style: TextStyle(
                  fontFamily: 'normal',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            h(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Noms".tr,
                    style: TextStyle(
                        fontFamily: 'normal',
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text("Quantité".tr,
                    style: TextStyle(
                        fontFamily: 'normal',
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nom,
                    style: TextStyle(
                        fontFamily: 'normal',
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                Text(q,
                    style: TextStyle(
                        fontFamily: 'normal',
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
