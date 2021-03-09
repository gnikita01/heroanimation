import 'package:flutter/material.dart'; 
import 'package:flutter/scheduler.dart' show timeDilation; 
import 'animations.dart';

class PhotoHero extends StatelessWidget { 
const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key); 

final String photo; 
final VoidCallback onTap; 
final double width; 

Widget build(BuildContext context) { 
	return SizedBox( 
	width: width, 
  //Declare Hero Widget and remaining widget tree
	child: Hero( 
    //create tags with same names to display transition
		tag: photo, 
		child: Material( 
		color: Colors.transparent, 
		child: InkWell( 
			onTap: onTap, 
			child: Image.asset( 
			photo, 
			fit: BoxFit.contain, 
			), 
		), 
		), 
	), 
	); 
} 
} 

class HeroAnimation extends StatelessWidget { 
Widget build(BuildContext context) { 
	timeDilation = 10.0; 

	return Scaffold( 
	appBar: AppBar( 
		title: const Text('Hero Animation'), 
		backgroundColor: Colors.green, 
	), 
	body: Center( 
		child: PhotoHero( 
		photo: 'images/nikita.png', 
		width: 300.0, 
		onTap: () { 
			Navigator.of(context).push(MaterialPageRoute<void>( 
				builder: (BuildContext context) { 
				return Scaffold( 
					appBar: AppBar( 
					title: const Text('Photo transition'), 
					backgroundColor: Colors.green, 
					), 
					body: Container( 
					// background of 2nd route 
					color: Colors.lightBlueAccent, 
					padding: const EdgeInsets.all(16.0), 
					alignment: Alignment.topLeft, 
					child: PhotoHero( 
						photo: 'images/nikita.png', 
						width: 100.0, 
						onTap: () { 
						Navigator.of(context).pop(); 
						}, 
					), 
					), 
				); 
				} 
			)); 
		}, 
		), 
	), 
	); 
} 
} 

void main() { 
runApp(MaterialApp(home: RadialExpansionDemo())); 
} 
