import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempo/modules/weather/presenter/tela_principal.dart';
import 'package:tempo/service_locator.dart';
import 'package:tempo/stores/cidade_store.dart';
import 'package:tempo/stores/weather_store.dart';

void main() async{
  setupLocator();

  runApp(MultiProvider(
    providers: [
      Provider<WeatherStore>(create: (_) => WeatherStore(), ),
      Provider<CidadeStore>(create: (_) => CidadeStore(), ),

    ],
    child: const Meteorologia(),
  ));
}

class Meteorologia extends StatelessWidget {
  const Meteorologia({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meteorologia',
      theme: ThemeData(
      
        primarySwatch: Colors.indigo,
      ),
      home: const TelaPrincipal(),
    );
  }
}
