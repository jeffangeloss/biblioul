// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, deprecated_member_use

// lib/pages/sign_up/sign_up_page.dart
import 'package:biblioul/components/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpController control = Get.put(SignUpController());

  SignUpPage({super.key});

  Widget _form(BuildContext context, ColorScheme colors) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.background, // El color va aquí dentro
        border: Border.all(
          width: 1,
          color: Colors.grey, // Color del borde
        ),
      ),
      child: Column(
        children: [
          Text('CREAR CUENTA'),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Usuario',
              prefixIcon: Icon(Icons.person),
              border: UnderlineInputBorder(),
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Repetir Contraseña',
              prefixIcon: Icon(Icons.lock),
              border: UnderlineInputBorder(),
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Correo',
              prefixIcon: Icon(Icons.email),
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Usuario y contraseña no válidos',
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
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                'CREAR CUENTA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
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
            color: colors.surfaceContainerHighest, // otro color
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Stack(
        children: [
          _background(context, colors),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [LoginHeader()],
                  ),
                  _form(context, colors),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*
  Column(
    children:[
      SafeArea...
    ]
  )

   */

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
