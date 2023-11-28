// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:pokedex/src/database/database_helper.dart';

// class ArtworkDisplay extends StatefulWidget {
//   final int id;

//   const ArtworkDisplay({super.key, required this.id});

//   @override
//   State createState() => _ArtworkDisplayState();
// }

// class _ArtworkDisplayState extends State<ArtworkDisplay> {
//   Uint8List? _imageData;

//   @override
//   void initState() {
//     super.initState();
//     _loadImageData();
//   }

//   _loadImageData() async {
//     DatabaseHelper dbHelper = DatabaseHelper.instance;
//     Uint8List? data = await dbHelper.getArtworkById(widget.id);
//     setState(() {
//       _imageData = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_imageData != null) {
//       return Image.memory(_imageData!);
//     } else {
//       return Center(child: Text('No artwork found for ID ${widget.id}'));
//     }
//   }
// }
