import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  getData() async {
    try{
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('test');
      DocumentSnapshot documentSnapshot = await collectionReference.doc('testid').get();
      var data = documentSnapshot.data();
      print(data);
    }catch(e){
      print("Error = $e");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test app'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
