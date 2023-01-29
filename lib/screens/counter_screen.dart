import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 10;

  void increase(){
    counter++;
    setState(() {});
  }

  void decrease(){
    counter--;
    setState(() {});
  }
  void reset(){
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle(fontSize: 30);

    

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 0.0,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Numero de Clicks', style: fontSize30),
              Text( '$counter' , style: fontSize30)
            ],
          ),
        ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatinActions(
        increaseFn: increase,
        decreaseFn: decrease,
        reseatFn: reset,
      ),
    );
  }
}

class CustomFloatinActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function reseatFn;

  const CustomFloatinActions({
    super.key, required this.increaseFn, required this.decreaseFn, required this.reseatFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [

        FloatingActionButton(
          child: const Icon( Icons.exposure_plus_1_outlined ),
          onPressed: () => increaseFn(),
        ),
        

        FloatingActionButton(
          child: const Icon( Icons.refresh_outlined ),
          onPressed: () => reseatFn(),
        ),


          FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1_outlined ),
          onPressed: () => decreaseFn(),
        ),
      ],
    );
  }
}