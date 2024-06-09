import 'package:adventure1/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Adventure());
}

class Adventure extends StatelessWidget {
  const Adventure({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StoryPage(),
    );
  }
}



class StoryPage extends StatefulWidget {
  const StoryPage({super.key, });
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
               image: AssetImage('assets/images/background.png'),
               fit: BoxFit.cover
           )
         ),
         padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
         constraints: BoxConstraints.expand(),
         child: SafeArea(
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Expanded(
                   flex: 12,
                   child: Center(
                     child: Text(
                       storyBrain.getStory()!,
                       style: TextStyle(
                         fontSize: 25.0,
                         color: Colors.white
                       ),
                     ),
                   ),
                 ),

                 Expanded(
                   flex: 2,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.red,
                       foregroundColor: Colors.white
                     ),
                     onPressed: () {
                       //Choice 1 made by user.
                       setState(() {
                         storyBrain.nextStory(1);
                       });
                     },
                     child: Text(
                       storyBrain.getChoice1()!,
                       style: TextStyle(
                         fontSize: 20.0,
                       ),
                     ),
                   ),
                 ),

                 SizedBox(height: 20,),
                 Expanded(
                   flex: 2,
                   child: Visibility(
                     visible: storyBrain.buttonShouldBeVisible(),
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         foregroundColor: Colors.white
                       ),
                       onPressed: () {
                         //Choice 2 made by user.
                         setState(() {
                           storyBrain.nextStory(2);
                         });
                       },
                       child: Text(
                         storyBrain.getChoice2()!,
                         style: TextStyle(
                           fontSize: 20.0,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             )),
       ),
      );
  }
}
