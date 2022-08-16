import 'package:ecommerce/apiclass/ApiClass.dart';
import 'package:ecommerce/apiclass/storeApi.dart';
import 'package:ecommerce/Screen/home/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var providertrue;
  var providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    providerfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade400,
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: StoreApi().getApiData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<dynamic> m1 = snapshot.data;
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Expanded(
                          child: GridView.builder(
                            itemCount: m1.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '');
                                },
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.white,
                                  margin: EdgeInsets.all(3),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 120,
                                        child: Image.network(
                                          "${m1[index].image}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("${m1[index].category}"),
                                          Spacer(),
                                          Container(
                                            height: 25,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.green,
                                            ),
                                            child: Row(
                                              children: [
                                                Spacer(),
                                                Text("${m1[index].rating.rate}"),
                                                Icon(
                                                  Icons.star,
                                                  size: 20,
                                                  color: Colors.yellow,
                                                ),
                                                Spacer(),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Rs ${m1[index].price}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
