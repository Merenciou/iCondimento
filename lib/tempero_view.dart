import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';

import 'package:i_condimento/homepage.dart';

class TemperoView extends StatefulWidget {
  const TemperoView({Key? key, required this.indexView}) : super(key: key);

  final int indexView;

  @override
  State<TemperoView> createState() => _TemperoView();
}

class _TemperoView extends State<TemperoView> {
  List<dynamic> condimentosView = [];
  List<dynamic> ervasView = [];

  Future<void> _loadListJson() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('lib/assets/temperos.json');
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    List<dynamic> condimentosListView = jsonResponse['condimentos'];
    List<dynamic> ervasListView = jsonResponse['ervas'];

    setState(() {
      condimentosView = condimentosListView;
      ervasView = ervasListView;
    });
  }

  List<String> temperoPath = ['condimentos', 'ervas'];

  final List<String> _condimentosImg = [
    'sal',
    'pimenta_reino_po',
    'pimenta_esmagada_graos',
    'oregano_seco',
    'manjericao_seco',
    'molho_soja'
  ];
  final List<String> _ervasImg = [
    'manjericao_fresco',
    'salsa_fresca',
    'cebolinha_fresca',
    'hortela_fresca',
    'louro_folhas',
    'erva_cidreira'
  ];

  @override
  void initState() {
    super.initState();
    _loadListJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'sal',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Align(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.asset(
                    'lib/assets/images/${temperosIndex ? temperoPath[0] : temperoPath[1]}/${temperosIndex ? _condimentosImg[widget.indexView] : _ervasImg[widget.indexView]}.png'),
              ),
              Text(
                temperosIndex
                    ? condimentosView[widget.indexView]['name']
                    : ervasView[widget.indexView]['name'],
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Para que serve:',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        temperosIndex
                            ? condimentosView[widget.indexView]['function']
                            : ervasView[widget.indexView]['function'],
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Como usar:',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          temperosIndex
                              ? condimentosView[widget.indexView]['how']
                              : ervasView[widget.indexView]['how'],
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
