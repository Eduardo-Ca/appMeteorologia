import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tempo/modules/cidade/presenter/busca_tela.dart';
import 'package:tempo/modules/core/utils/constants/imagens_constantes.dart';
import 'package:tempo/stores/weather_store.dart';


class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late WeatherStore weatherStore;
  String chaveApi = "7959b50d48a990765057d3f21f32f1cc";

  @override
  void didChangeDependencies() async{

    weatherStore = Provider.of<WeatherStore>(context);
    pegarClima();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela principal")), //todo
      body: Stack(
        children: [
          imagemDeFundo(),
          weatherStore.clima == null
          ? carregandoGif()
          : card(),
        ],
      ),
      floatingActionButton: floatingButton()
    );
  }

  carregandoGif(){
    return  SizedBox(
      width: 370,
      height: 350,
      child: Lottie.network(ImagensConstantes.AVIAO));
  }

  card(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.2,
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Card(
          color: Colors.white.withOpacity(0.6),
          child: Column(
            children: [
               Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  weatherStore.clima!.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "${weatherStore.clima!.weatherMain.temp}°",
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud, color: Colors.grey[700]),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 14.0),
                    child: Text(
                      weatherStore.clima!.weather[0].description,
                      style: TextStyle(
                          color: Colors.grey[700], fontSize: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.sunny,color: Colors.grey[700],),
                    Text(
                      "temperatura máxima: ${weatherStore.clima!.weatherMain.tempMax}°",
                      style:  TextStyle(color: Colors.grey[700], fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.beach_access_outlined,color: Colors.grey[700]),
                    Text(
                      "temperatura mínima: ${weatherStore.clima!.weatherMain.tempMin}°",
                      style:  TextStyle(color: Colors.grey[700], fontSize: 20),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 135.0),
                child: Text(
                  "sensação de: ${weatherStore.clima!.weatherMain.feelsLike}°",
                  style:  TextStyle(color: Colors.grey[700], fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  imagemDeFundo(){
    return Image.asset(
      ImagensConstantes.NUVEM_BACK,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }

  floatingButton(){
    return  weatherStore.clima == null?  null: FloatingActionButton(
      onPressed: () async{
       
        await Navigator.push(context,MaterialPageRoute(builder: (context) =>  BuscaTela(nomeCidade: weatherStore.clima!.name,)),);
        setState(() {});
      },
      child: const Icon(Icons.navigation),
    );
  }

  pegarClima() async{
    if(weatherStore.clima == null){
      await weatherStore.pegarPosicao();
      await weatherStore.obterClima(chaveApi: chaveApi,lat: weatherStore.latitude,lon: weatherStore.longitude, lang:"pt_br",units: "metric");
      setState(() {});
    }
  }

}
