import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  Widget _buildBody(BuildContext context) {
    return const SafeArea(
        child: Column(children: [
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
              Text(
                  'Imagen'), // Componentes hijos que se van uno abajo del otro (esto es inblock)
              SizedBox(
                height:
                    50, // como un padding para separar el texto de la imagen
              ),
              Text('BiblioApp Ulima'),
            ],
          )
        ],
      ),
    ]));
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
