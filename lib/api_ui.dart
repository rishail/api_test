
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_article.dart';


class APIUI extends StatefulWidget {

  @override
  _APIUIState createState() => _APIUIState();
}
class _APIUIState extends State<APIUI> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color golden = const Color.fromRGBO(231, 198, 142, 1.0);
    Color goldenDull = const Color.fromRGBO(231, 198, 142, 0.7);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("API Data", style: TextStyle(color: golden),),
        shape: Border(bottom: BorderSide(color: golden, width: 1)),
        iconTheme: IconThemeData(color: golden),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 10),
        child:FutureBuilder<List<Articles>>(
          future: fetchApiData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  Articles articles = snapshot.data![index];
                  const SizedBox(height: 150,);
                  return Container(
                    padding: const EdgeInsets.all(10),
                    foregroundDecoration: BoxDecoration(
                      border: Border.all(
                        color: golden,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 180,
                    height: 139,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(articles.urlToImage!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.length, separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10,);
              },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<Articles>> fetchApiData() async {
    var response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=dee40e91ae644e9d818dd88498534c71'));
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      List<Articles> api =
      (jsonResponse['articles'] as List<dynamic>).map((e) => Articles.fromJson(e)).toList();
      return api;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}