
// █▀▄▀█ █░█ █▀ █ █▀▀    █▀█ █░░ ▄▀█ █▄█ █▀▀ █▀█
// █░▀░█ █▄█ ▄█ █ █▄▄    █▀▀ █▄▄ █▀█ ░█░ ██▄ █▀▄

// Displays information about currently playing media.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import 'dart:convert';
import 'dart:io';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override // why cant i make this private
  MusicPlayerState createState() => MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer>{
  String _title = 'NoTitle';
  String _artist = 'NoArtist';
  String _artUrl = 'https://i.scdn.co/image/ab67616d0000b273039c23c4b06bc6496d32d2d3';

  void _playerctlTogglePlayPause() {
    Process.run('playerctl', ['play-pause']);
  }
  
  void _playerctlNext() {
    Process.run('playerctl', ['next']);
    _playerctlGetMetadata();
  }
  
  void _playerctlPrev() {
    Process.run('playerctl', ['previous']);
    _playerctlGetMetadata();
  }
 
  // TODO there is probably a more elegant way to do the regexs
  void _playerctlGetMetadata() async {
    String artUrl = '-';
    String title = '-';
    String artist = '-';

    var result = await Process.run('playerctl', ['metadata']);
    LineSplitter ls = const LineSplitter();
    List<String> metadata = ls.convert(result.stdout);
  
    // Extract album art link
    final artRegex = RegExp(r'artUrl');
    for (int i = 0; i < metadata.length; i++) {
      if (artRegex.hasMatch(metadata[i])) {
        List split = metadata[i].split(RegExp('\\s+'));
        artUrl = split[split.length-1];
      }
    }

    // Extract title
    final titleRegex = RegExp(r'title');
    for (int i = 0; i < metadata.length; i++) {
      if (titleRegex.hasMatch(metadata[i])) {
        List split = metadata[i].split(RegExp('\\s+'));
        split.removeRange(0, 2);
        title = split.join(' ');
      }
    }

    // Extract artist
    final artistRegex = RegExp(r'artist');
    for (int i = 0; i < metadata.length; i++) {
      if (artistRegex.hasMatch(metadata[i])) {
        List split = metadata[i].split(RegExp('\\s+'));
        split.removeRange(0, 2);
        artist = split.join(' ');
      }
    }

    setState(() {
      _title = title;
      _artist = artist;
      _artUrl = artUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _AlbumArt(artUrl: _artUrl),
        Container(
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
                  child: _Title(title: _title),
                  ),
                Expanded(
                  flex: 15,
                  child: _Artist(artist: _artist),
                  ),
                Expanded(
                  flex: 25,
                  child: _Actions(
                    toggle: _playerctlTogglePlayPause,
                    next: _playerctlNext,
                    prev: _playerctlPrev,
                    ),
                  ),
              ],
            )
          ),
      ],
    );
  }
}

class _AlbumArt extends StatelessWidget{
  const _AlbumArt({
    Key? key, 
    required this.artUrl}) : super(key: key);

  final String artUrl;
  
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: artUrl,
      useOldImageOnUrlChange: true,
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color(0xFF16161D).withOpacity(0.85),
              BlendMode.darken
              ),
            ),
          ),
        ),
      // placeholder: (context, url) => _AlbumArtPlaceholder(artUrl: oldArtUrl),
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
  const _Title ({
    Key? key, 
    required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: WText(
        padding: 0,
        fontFamily: 'RobotoMono',
        text: title,
        ),
      );
  }
}

class _Artist extends StatelessWidget {
  const _Artist ({
    Key? key, 
    required this.artist}) : super(key: key);

  final String artist;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: WText(
        size: 15.0,
        padding: 0,
        fontFamily: 'RobotoMono',
        text: artist,
        ),
      );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key? key,
    required this.icon,
    required this.callback}) : super(key: key);

  final Icon icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: const Color(0xFFDCD7BA),
      onPressed: callback,
      );
  }
}

/// Play/pause, next, and previous buttons.
class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
    required this.next,
    required this.toggle,
    required this.prev}) : super(key: key);
  
  final double iconSize = 35;
  final VoidCallback toggle;
  final VoidCallback prev;
  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: const Icon(Icons.fast_rewind),
          callback: prev,
          ),
        _ActionButton(
          icon: const Icon(Icons.pause),
          callback: toggle,
          ),
        _ActionButton(
          icon: const Icon(Icons.fast_forward),
          callback: next,
          ),
      ],
    );
  }
}
