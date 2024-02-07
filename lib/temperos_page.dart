import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:i_condimento/homepage.dart';
import 'package:i_condimento/tempero_view.dart';

class TemperosPage extends StatefulWidget {
  const TemperosPage({Key? key}) : super(key: key);

  @override
  State<TemperosPage> createState() => _TemperosPage();
}

class _TemperosPage extends State<TemperosPage> {
  List<dynamic> condimentos = [];
  List<dynamic> ervas = [];

  Future<void> _loadListTemperos() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('lib/assets/temperos.json');
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    List<dynamic> condimentosList = jsonResponse['condimentos'];
    List<dynamic> ervasList = jsonResponse['ervas'];

    setState(() {
      condimentos = condimentosList;
      ervas = ervasList;
    });
  }

  List<String> temperoPath = ['condimentos', 'ervas'];

  final List<String> _condimentosImg = ['sal', 'pimenta_reino_po', 'pimenta_esmagada_graos', 'oregano_seco', 'manjericao_seco', 'molho_soja'];
  final List<String> _ervasImg = ['manjericao_fresco', 'salsa_fresca', 'cebolinha_fresca', 'hortela_fresca', 'louro_folhas', 'erva_cidreira'];

  @override
  void initState() {
    super.initState();
    _loadListTemperos();
  }

  @override
  Widget build(BuildContext context) {
    //!! JAMAIS FAÇA FUNÇÕES DENTRO DO BUILD!!!!
    // void nextPage(BuildContext context, int index) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => TemperoView(tempero: {

    //           },)));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          temperosIndex ? 'Condimentos' : 'Ervas',
          style: GoogleFonts.montserrat(),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: condimentos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              height: 70,
              color: Colors.white,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TemperoView(
                                tempero: temperosIndex ? condimentos[index] : ervas[index],
                              )));
                },
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                      "lib/assets/images/${temperosIndex ? temperoPath[0] : temperoPath[1]}/${temperosIndex ? _condimentosImg[index] : _ervasImg[index]}.png"),
                ),
                title: Text(
                  temperosIndex ? condimentos[index]['name'] : ervas[index]['name'],
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  temperosIndex ? condimentos[index]['function'] : ervas[index]['function'],
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w200),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              ),
            );
          }),
    );
  }
}
