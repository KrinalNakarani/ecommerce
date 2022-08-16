import 'package:ecommerce/apiclass/ApiClass.dart';
import 'package:ecommerce/apiclass/storeApi.dart';
import 'package:ecommerce/home/homeProvider.dart';
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
          child: Column(
            children: [
              FutureBuilder<StoreModel>(
                future: StoreApi().getApiData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.hasError}");
                  } else if (snapshot.hasData) {
                    StoreModel m1 = snapshot.data;

                    return Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.network("${m1.image![0]}"),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
