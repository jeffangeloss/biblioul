// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  Widget _form(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.8, // ancho del 80% de la pantalla
      padding: EdgeInsets.all(16),
      color: Colors.white,
      // Column: In block elements vertically, Row: In block elements horizontally, Stack: In block elements on top of each other
      child: Column(
        children: [
          Text('INGRESA ESTA INFORMACIÓN'),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Usuario',
              hintText: 'Usuario',
              prefixIcon: Icon(Icons.person),
              border: UnderlineInputBorder(),
            ),
          ),
          TextField(
            obscureText: true, // para ocultar el texto de la contraseña,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              hintText: 'Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            // Row para centrar horizontalmente
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                // sino le pones el column, se van a poner uno al lado del otro (esto es inline)
                children: [
                  SizedBox(
                    height:
                        50, // como un padding para separar el texto de la imagen
                  ),
                  Image.asset(
                    'assets/images/ulises.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height:
                        15, // como un padding para separar el texto de la imagen
                  ),
                  Text(
                    'BiblioApp Ulima!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _form(context),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }
}
