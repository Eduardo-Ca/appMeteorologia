import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tempo/modules/cidade/presenter/components/card_busca.dart';
import 'package:tempo/modules/core/utils/components/busca.componente.dart';
import 'package:tempo/modules/core/utils/constants/imagens_constantes.dart';
import 'package:tempo/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:tempo/stores/cidade_store.dart';
import 'package:tempo/stores/weather_store.dart';

class BuscaTela extends StatefulWidget {
  final String nomeCidade;
  const BuscaTela({super.key,required this.nomeCidade});

  @override
  State<BuscaTela> createState() => _BuscaTelaState();
}

class _BuscaTelaState extends State<BuscaTela> {
  final GlobalKey<BuscaComponenteState> _buscaKey = GlobalKey<BuscaComponenteState>();
  String? valorPesquisa = "";
  late WeatherStore wetherStore;
  late CidadeStore cidadeStore;
  String chaveApi = "7959b50d48a990765057d3f21f32f1cc";

  @override
  void didChangeDependencies() {
    cidadeStore = Provider.of<CidadeStore>(context);
    wetherStore = Provider.of<WeatherStore>(context);
    cidadeStore.obterCidades(cityname: widget.nomeCidade, limit: 6, chaveApi: chaveApi);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MensagensConstantes.BUSCA),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _barraDePesquisa(),
            _listaDeProdutos(),
            
            ],
        ),
      ),
    );
  }

  _barraDePesquisa() {
    return BuscaComponente(
      textoBranco: false,
      teclado: TextInputType.text,
      cor: Colors.black,
      autoFocus: false,
      key: _buscaKey,
      placeholder: MensagensConstantes.PROCURAR,
      funcao: () {
        valorPesquisa =  _buscaKey.currentState!.pesquisa;
        cidadeStore.obterCidades(cityname:valorPesquisa, limit: 6, chaveApi: chaveApi);
        setState(() {});
      },
    );
  }

  _listaDeProdutos() {
    return Observer(builder: (context) {
      if (cidadeStore.cidadesPendentesCarregando) {
        return Center(
          child: SizedBox(
            width: 370,
            height: 350,
            child: Lottie.network(ImagensConstantes.AVIAO))
        );
      } else if (cidadeStore.listaCidades.isEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.star,
              color: Colors.blue,
            ),
            Text(
             MensagensConstantes.SEM_RESULTADO,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.star,
              color: Colors.blue,
            ),
          ],
        );
      } else {
        return ListView.builder(
          scrollDirection:Axis.vertical,
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: cidadeStore.listaCidades.length,
          itemBuilder: (context, index) {
            var item = cidadeStore.listaCidades[index];
            return ListTile(
              //!=== Card ===
              title: CardBusca(item: item,),
              onTap: (() async{
                FocusScope.of(context).unfocus();
                await wetherStore.obterClima(chaveApi:chaveApi,lat: item.lat,lon: item.lon, lang:"pt_br",units: "metric");
                // ignore: use_build_context_synchronously
                Navigator.pop(context);

              }),
            );
          },
        );
      }
    });
  }
}
