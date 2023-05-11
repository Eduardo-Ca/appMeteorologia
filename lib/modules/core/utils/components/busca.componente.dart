import 'dart:async';

import 'package:flutter/material.dart';

class BuscaComponente extends StatefulWidget {
  final Function funcao;
  final String placeholder;
  final bool autoFocus;
  final Color cor;
  final bool textoBranco;
  final TextInputType teclado;
  const BuscaComponente(
      {required Key key,
      required this.funcao,
      required this.placeholder,
      required this.cor,
      required this.teclado,
      required this.textoBranco,
      this.autoFocus = true})
      : super(key: key);
  @override
  BuscaComponenteState createState() => BuscaComponenteState();
}

class BuscaComponenteState extends State<BuscaComponente> {
  final TextEditingController _busca = TextEditingController();
  final FocusNode _focusBusca = FocusNode();
  Timer? _debounce;
  String pesquisa = '';

  // Declaração da key em qualquer tela
  // final GlobalKey<BuscaComponenteState> _buscaKey = GlobalKey<BuscaComponenteState>();

  @override
  void initState() {
    super.initState();
    _busca.addListener(_buscaDebounce);
  }

  @override
  void dispose() {
    _busca.removeListener(_buscaDebounce);
    _busca.dispose();
    _focusBusca.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,                 
            width: 2.0,
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(15.0) //                 <--- border radius here
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            autofocus: widget.autoFocus,
            focusNode: _focusBusca,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              _focusBusca.unfocus();
            },
            style: TextStyle(fontSize: 20,color: widget.textoBranco == true? Colors.white:Theme.of(context).primaryColor) ,
            keyboardType: widget.teclado,
            controller: _busca,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeholder,
              hintStyle: TextStyle(fontSize: 20,color:widget.cor) ,
              suffixIcon: IconButton(
                  icon: (pesquisa == '')
                      ?  Icon(Icons.search,color:widget.cor,)
                      :  Icon(Icons.clear,color:widget.cor,),
                  onPressed: () {
                    if (pesquisa.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) => _busca.clear());
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }

  _buscaDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (alterouBusca()) {
        widget.funcao();
      }
    });
  }

  bool alterouBusca() {
    if (_busca.text != pesquisa) {
      pesquisa = _busca.text;
      return true;
    } else {
      return false;
    }
  }

  clearBusca() {
    _busca.clear();
  }
}
