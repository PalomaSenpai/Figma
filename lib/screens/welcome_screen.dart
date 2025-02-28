import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState()=> _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex =0;
  final images = [
    "assets/Rock.jpg",
    "assets/Fit.jpg",
    "assets/Cuadritos.jpg"
  ];
  final icons = [
    "assets/Pesas.png",
    "assets/Fit.png",
    "assets/Juan.png"
  ];
  final message = [
    "Hola este debe ser un mensaje largo mostrado dentro del container gris y "
        "cambiara el texto en el siguiente container",
    "Hola este debe ser otro mensaje largo mostrado dentro del container gris y "
        "cambiara el texto en el siguiente container",
    "Hola este debe ser otro mensaje largo mostrado dentro del container gris y "
        "cambiara el texto en el ultimo container"
  ];

  @override
  // TODO: implement hashCode
  Widget build(BuildContext context) {
    // TODO: implement build
    /*SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark
        )
    );*/
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.5)
                ),
                onPressed: (){
                  print("Skip");
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16
                  ),
                )
            ),
          )
        ],
      ),
      body: Center(

        child: CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
              autoPlay: false,
              reverse: false,
              scrollPhysics: NeverScrollableScrollPhysics(),
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              onPageChanged: (index,reason){
              setState(() {
                _currentIndex = index;
              });
        }
          ),
          itemCount:  images.length,
          itemBuilder: (context,index,realIndex){
            final image = images[index];
            final icon = icons[index];
            final mensaje = message[index];
            return buildImage(image,index,icon,mensaje);
          }
        ),
      )
    );

  }

  Widget buildImage(String image, int index,String icon, String message){
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            )
          ),
        ),

        Align(
          child: Container(
            height: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:Color(0xFF4C4C4C),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5)
                )
              ],
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 2
              )
            ),
            child: Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        icon,
                        height: 50,
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18, // Tamaño de la fuente
                      fontWeight: FontWeight.bold, // Peso de la fuente (negrita)
                      color: Colors.white, // Color del texto
                      fontStyle: FontStyle.italic, // Estilo de la fuente (cursiva)
                      letterSpacing: 1.5, // Espaciado entre letras
                      wordSpacing: 2.0, // Espaciado entre palabras
                      height: 1.5,
                    )
                    
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.all(40),
                      child: buildIndicator(),
                    ),
                )
              ],
            ),
          ),
        ),
        
        Positioned(
          bottom: 275,
          left: 150,
          child: ElevatedButton(
              onPressed: (){
                int nextIndex =(_currentIndex+1) % images.length;
                if(_currentIndex<images.length-1){
                  _carouselController.animateToPage(
                      nextIndex,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut

                  );
                }else{

                }

              },
              child: const Text(
                style: TextStyle(
                  color: Colors.white
                ),
                "Continuar"

              ),

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(0.7),


              shadowColor: Colors.grey.withOpacity(0.5)
            ),
          ),
          
        ),

      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: images.length
  );
}


