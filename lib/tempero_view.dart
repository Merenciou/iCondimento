import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_condimento/homepage.dart';
import 'package:i_condimento/temperos_page.dart';

class TemperoView extends StatefulWidget {
  const TemperoView({Key? key, required this.tempero}) : super(key: key);
  final Map<String, dynamic> tempero;

  @override
  State<TemperoView> createState() => _TemperoView();
}

class _TemperoView extends State<TemperoView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tempero['name'],
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
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.asset(
                    'lib/assets/images/${temperosIndex ? temperoPath[0] : temperoPath[1]}/${widget.tempero['imagePath']}.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.tempero['name'],
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Função',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      widget.tempero['function'],
                      style: GoogleFonts.montserrat(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Ideal',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(
                      widget.tempero['ideal'],
                      style: GoogleFonts.montserrat(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Como usar',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      widget.tempero['how'],
                      style: GoogleFonts.montserrat(),
                      textAlign: TextAlign.center,
                    ),
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
