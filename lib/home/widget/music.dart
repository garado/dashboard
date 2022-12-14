
/* █▀▄▀█ █░█ █▀ █ █▀▀    █▀█ █░░ ▄▀█ █▄█ █▀▀ █▀█ */ 
/* █░▀░█ █▄█ ▄█ █ █▄▄    █▀▀ █▄▄ █▀█ ░█░ ██▄ █▀▄ */ 

import 'package:flutter/material.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NowPlaying(),
        _Artist(),
        _Title(),
        _Actions(),
      ],
      );
  }
}

class _NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Now playing');
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Go Crazy');
  }
}

class _Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Chris Brown, Young Thug');
  }
}

class _Actions extends StatelessWidget {
  final double iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.fast_rewind,
          color: Colors.white,
          size: iconSize,
          ),
        Icon(
          Icons.pause,
          color: Colors.white,
          size: iconSize,
          ),
        Icon(
          Icons.fast_forward,
          color: Colors.white,
          size: iconSize,
          ),
      ],
    );
  }
}
