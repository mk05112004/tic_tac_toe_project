import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
} 
 
 class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false , 
    home: HomePage(), 
    );
  }
 }

 class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is O!
  List<String> displayExheOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ];
   
    var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
    int  ohScore = 0;
    int  exScore = 0;
    int filledBoxes = 0;
    
  @override
  Widget build(BuildContext context){
    return Scaffold(
    backgroundColor: Colors.grey[800],
    body: Column(
      children: <Widget> [
        Expanded(
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text('Player Maria', style: myTextStyle,),
                        Text(ohScore.toString(), style: myTextStyle,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player Kawther', style: myTextStyle,),
                        Text(exScore.toString(), style: myTextStyle,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
         Expanded(
          flex: 3,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder:(BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                 _tapped(index);
                },
                child: Container(
                  decoration:
                   BoxDecoration(border: Border.all(color:Colors.grey)),
                  child: Center(
                    child: Text(
                     displayExheOh[index],
                    
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              );
            }),
        ),
        Expanded(
          child: Container(
            
          ),
          ),
      ],
    ),
    );
  }

  void _tapped(int index) {


    setState(() {
    if (ohTurn && displayExheOh[index] == ''){
      displayExheOh[index] = 'o';
      filledBoxes += 1;
    }else if (!ohTurn && displayExheOh[index] == '' ){
      displayExheOh[index] = 'x';
      filledBoxes += 1;
    }

    ohTurn = !ohTurn;
    _checkwinneer();
    });
  }
  void _checkwinneer() {
   //checks 1st row 
if( displayExheOh[0] == displayExheOh[1] &&
 displayExheOh[0] == displayExheOh[2] &&
  displayExheOh[0] != ''){
  _showWinDialog(displayExheOh[0]);
}
//checks 2nd row
if( displayExheOh[3] == displayExheOh[4] &&
 displayExheOh[3] == displayExheOh[5] &&
  displayExheOh[3] != ''){
  _showWinDialog(displayExheOh[3]);
}
//checks 3rd row
if( displayExheOh[6] == displayExheOh[7] &&
 displayExheOh[6] == displayExheOh[8] &&
  displayExheOh[6] != ''){
  _showWinDialog(displayExheOh[6]);
}
//checks 1st column
if( displayExheOh[0] == displayExheOh[3] &&
 displayExheOh[0] == displayExheOh[6] &&
  displayExheOh[0] != ''){
  _showWinDialog(displayExheOh[0]);
}
//checks 2nd column
if( displayExheOh[1] == displayExheOh[4] &&
 displayExheOh[1] == displayExheOh[7] &&
  displayExheOh[1] != ''){
  _showWinDialog(displayExheOh[1]);
}
//checks 3rd column
if( displayExheOh[2] == displayExheOh[5] &&
 displayExheOh[2] == displayExheOh[8] &&
  displayExheOh[2] != ''){
  _showWinDialog(displayExheOh[2]);
}
//checks diagonal
if( displayExheOh[6] == displayExheOh[4] &&
 displayExheOh[6] == displayExheOh[2] &&
  displayExheOh[6] != ''){
  _showWinDialog(displayExheOh[6]);
}
//chacks diagonal
if( displayExheOh[0] == displayExheOh[4] &&
 displayExheOh[0] == displayExheOh[8] &&
  displayExheOh[0] != ''){
  _showDrawDialog();
}
else if(filledBoxes == 9){
  _showDrawDialog();
}

  }

  void _showDrawDialog() {
   showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('DRAW'),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Play Again!'),
            onPressed: (){
              _clearBoard();
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  
  }
    
  void _showWinDialog(String winner) {
   showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('WINNER IS: ' +winner),
        actions: <Widget>[
          FloatingActionButton(
            child: Text('Play Again!'),
            onPressed: (){
              _clearBoard();
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });

    if(winner == 'o'){
      ohScore += 1;
    } else if (winner == 'x'){
      exScore += 1;
    }

  }

  void _clearBoard() {

setState(() {
       for(int i=0; i<9; i++){
        displayExheOh[i] = '';
      }
});

filledBoxes = 0;

  }

  }
 
