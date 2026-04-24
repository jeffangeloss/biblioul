// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  final SignInController control = Get.put(SignInController());

  SignInPage({super.key});

  Widget _form(BuildContext context, ColorScheme colors) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.8, // ancho del 80% de la pantalla
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber,
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
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
          ),
          SizedBox(height: 10),
          Text(
            "Usuario y contraseña no válidos",
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.secondary,
                foregroundColor: colors.surface,
                padding: EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // sin bordes redondeados
                ),
              ),
              child: Text(
                'INCIAR SESIÓN',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No tienes una cuenta?'),
              SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: () {
                  print('Ir al registro');
                  // Acción al presionar "Creala aquí"
                },
                child: Text(
                  'Creala aquí',
                  style: TextStyle(
                      color: Colors.orange, 
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _recoverPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Olvidaste tu contraseña?'),
        SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: () {
            print('Ir a recuperar contraseña');
            // Acción al presionar "Recuperala aquí"
          },
          child: Text(
            'Recuperala aquí',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _header(BuildContext context, ColorScheme colors) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/images/ulises.png',
          width: 140,
          height: 140,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'BiblioApp ULima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _form(context, colors),
      ],
    );
  }

  Widget _background(BuildContext context, ColorScheme colors) {
    return Column(
      children: [
        // 30% superior
        Expanded(
          flex: 5, // 30%
          child: Container(
            width: double.infinity,
            color: colors.tertiaryContainer, // puedes cambiar color
          ),
        ),

        // 70% inferior
        Expanded(
          flex: 5, // 70%
          child: Container(
            width: double.infinity,
            color: colors.surfaceContainerHigh, // otro color
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Stack(children: [
      _background(context, colors),
      Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // centra horizontalmente
            children: [_header(context, colors)],
          ),
          Spacer(),
          _recoverPassword(context),
          SizedBox(
            height: 15,
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
