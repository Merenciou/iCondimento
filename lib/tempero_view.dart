import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperoView extends StatefulWidget {
  const TemperoView({Key? key, required this.tempero, imgIndex}) : super(key: key);
  final Map<String, dynamic> tempero;

  @override
  State<TemperoView> createState() => _TemperoView();
}

class _TemperoView extends State<TemperoView> {
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
                //todo: coloca a imagem aqui
                // child: Image.asset(
                //   widget.tempero['img'],
                // ),
              ),
              Text(
                widget.tempero['name'],
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
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        widget.tempero['function'],
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
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
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          widget.tempero['how'],
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
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
