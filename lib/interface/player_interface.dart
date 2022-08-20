import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import 'package:pac/main.dart';

class PlayerInterface extends StatefulWidget {

  static const overlayKey = 'playerInterface';

  final BonfireGame game;
  const PlayerInterface({Key? key, required this.game}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {

  double life = 0;
  final double maxWidth = 100;
  double widthCurrent = 100;

  late async.Timer _lifeTime;
  late async.Timer _moedas;
  @override
  void initState() {
    _lifeTime = async.Timer.periodic(const Duration(milliseconds: 100), _verifyLife);
    _moedas = async.Timer.periodic(const Duration(milliseconds: 100), _verifyMoedas);
    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
      child: Row(
        children: [
          //life Player
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  child: Image.asset('./assets/images/ihero.png'),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 100,
                  height: 15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2, style: BorderStyle.solid)
                  ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                         //margin: const EdgeInsets.all(20),
                         width: widthCurrent,
                         height: 10,
                         color: Colors.green,
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
          //moedas
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              children: [
                Container(
                  child: Image.asset('./assets/images/points.png'),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                   // color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
               Container(
                 child: Text(' $moedas', style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),),
                    //margin: const EdgeInsets.all(20),
                    width: 50,
                    height: 20,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _verifyLife(async.Timer timer) {
    if (life != (widget.game.player?.life ?? 0)) {
      setState(() {
        life = widget.game.player?.life ?? 0;

        final percent = life / (widget.game.player?.maxLife ?? 0);
        widthCurrent = maxWidth * percent;
      });
    }
  }

  void _verifyMoedas(async.Timer timer) {
    setState(() {
      moedas;
    });
  }
}
