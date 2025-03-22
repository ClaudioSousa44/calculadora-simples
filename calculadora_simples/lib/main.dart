import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

enum Calculo { somar, subtrair, multiplicar, dividir}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController controladorV1 = TextEditingController();
  TextEditingController controladorV2 = TextEditingController();
  dynamic resultado = 0;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: controladorV1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Valor 1"),
                  ),
                ),
                TextField(
                  controller: controladorV2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Valor 2"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () => calcular(Calculo.somar), child: Text("+", style: TextStyle(fontSize: 25),)),
                    ElevatedButton(onPressed: () => calcular(Calculo.subtrair), child: Text("-", style: TextStyle(fontSize: 25),)),
                    ElevatedButton(onPressed: () => calcular(Calculo.multiplicar), child: Text("*", style: TextStyle(fontSize: 25),)),
                    ElevatedButton(onPressed: () => calcular(Calculo.dividir), child: Text("/", style: TextStyle(fontSize: 25),)),
                  ],
                ),
                Text("Resultado: $resultado")
              ],
            ),
          ),
        ),
      ),
    );
  }
  
    void calcular(Calculo calculo){
      double? v1 = double.tryParse(controladorV1.text);
      double? v2 = double.tryParse(controladorV2.text);

      if(v1 == null || v2 == null){
          setState(() {
            resultado = "Valores Inválidos";
          });
          return;
      }

      switch(calculo){
        case Calculo.somar:
          resultado = v1 + v2;
          break;

        case Calculo.subtrair:
          resultado = v1 - v2;
          break;
        
        case Calculo.multiplicar:
          resultado = v1 * v2;
          break;

        case Calculo.dividir:
          resultado = v1 / v2;
          break;

        default:
         throw Exception("Operação inválida");
      }

      setState(() {});

    }
}
