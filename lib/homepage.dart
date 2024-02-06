import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool temperosIndex = true;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFEC),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/temperos_page');
                  setState(() {
                    temperosIndex = true;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image.asset(
                          'lib/assets/images/condimento.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                          child: Text(
                        'Condimentos',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            shadows: [
                              const Shadow(
                                  blurRadius: 0.5,
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0))
                            ]),
                      )),
                    )),
                  ],
                ),
              ),
              InkWell(
                onTapDown: (details) {
                  Navigator.pushNamed(context, '/temperos_page');
                  setState(() {
                    temperosIndex = false;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image.asset(
                          'lib/assets/images/erva.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Text(
                          'Ervas',
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              shadows: [
                                const Shadow(
                                    blurRadius: 1.0,
                                    color: Colors.grey,
                                    offset: Offset(1.0, 1.0))
                              ]),
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
