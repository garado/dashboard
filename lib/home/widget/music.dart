
// █▀▄▀█ █░█ █▀ █ █▀▀    █▀█ █░░ ▄▀█ █▄█ █▀▀ █▀█
// █░▀░█ █▄█ ▄█ █ █▄▄    █▀▀ █▄▄ █▀█ ░█░ ██▄ █▀▄

// Displays information about currently playing media.

import 'package:flutter/material.dart';
import '../../utils.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _AlbumArt(),
        _Ugh(),
      ],
      );
  }
}

class _Ugh extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(10.0),
      child: Column(
          children: [
            Expanded(
              flex: 15,
              child: _NowPlaying(),
              ),
            Expanded(
              flex: 15,
              child: _Title(),
              ),
            Expanded(
              flex: 15,
              child: _Artist(),
              ),
            Expanded(
              flex: 25,
              child: _Actions(),
              ),
          ],
        )
      );
  }
}

class _AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage('https://i.scdn.co/image/ab67616d0000b273175c577a61aa13d4fb4b6534'),
          colorFilter: ColorFilter.mode(
           Colors.black.withOpacity(0.5),
           BlendMode.darken
          ),
        ),
        )
      );

  }
}

class _NowPlaying extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: WText(
        size: 14.0,
        fontFamily: 'RobotoMono',
        text: 'Now Playing',
        ),
      );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: WText(
        padding: 0,
        fontFamily: 'RobotoMono',
        text: 'Small Worlds',
        ),
      );
  }
}

class _Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: WText(
        size: 15.0,
        padding: 0,
        fontFamily: 'RobotoMono',
        text: 'Mac Miller',
        ),
      );
  }
}

/// Play/pause, next, and previous buttons.
class _Actions extends StatelessWidget {
  final double iconSize = 35;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.fast_rewind,
          color: const Color(0xFFDCD7BA),
          size: iconSize,
          ),
        Icon(
          Icons.pause,
          color: const Color(0xFFDCD7BA),
          size: iconSize,
          ),
        Icon(
          Icons.fast_forward,
          color: const Color(0xFFDCD7BA),
          size: iconSize,
          ),
      ],
    );
  }
}
