import 'package:flutter/material.dart';
import 'package:tempo/modules/cidade/data/models/cidade_model.dart';

class CardBusca extends StatefulWidget {
  final CidadeModel item;
  const CardBusca({super.key,required this.item});

  @override
  State<CardBusca> createState() => _CardBuscaState();
}

class _CardBuscaState extends State<CardBusca> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.item.name,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.item.country,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Estado: ${widget.item.state}",
              style: const TextStyle(fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
