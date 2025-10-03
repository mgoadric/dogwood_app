// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// ----------------ask about this license stuff---------------------

import 'package:dogwood_app/animal_dialog.dart';
import 'package:dogwood_app/animal_list.dart';
import 'package:dogwood_app/detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart' 
    hide EmailAuthProvider, PhoneAuthProvider;    
import 'package:flutter/material.dart';       
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';         

import 'app_state.dart';                          
import 'src/authentication.dart';  


class HomePage extends StatefulWidget {
  HomePage({super.key});

  final AnimalListController controller = AnimalListController();
  final TextEditingController textController = TextEditingController();

   @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnimalListController controller = AnimalListController();

  void handleNewAnimal(String animalName) {
    setState(() {
      controller.addAnimal(animalName);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Consumer<ApplicationState>(
        builder: (context, appState, _) => ListView(
          children: [
            const SizedBox(height: 8),
            AuthFunc(
              loggedIn: appState.loggedIn,
              signOut: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            if (appState.loggedIn) ...[  //make sure only people who are logged in can see the animal information
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  child: Column(
                  children: controller.animals.map((animal) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                    ),
                    title: Text(animal.name),
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(title: animal.name)),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ], 
        ),
      ),
      floatingActionButton: Consumer<ApplicationState>(
    builder: (context, appState, _) => appState.loggedIn //make sure only people who are loggin in can add animals
        ? FloatingActionButton(
            key: const Key("AddButton"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AnimalDialog(onListAdded: handleNewAnimal),
              );
            },
          )
        : SizedBox.shrink(),), //this is so it doesn't yell at me for returning null
    );
  }
}


