import 'dart:io'; //  because user input is required
import 'dart:math'; // to use random

void main() {
  print ('XO Game');
  implementBord(); // implement the game empty body
  isAI = playWithAi();  // check if user want to play with computer or with friend
  chosePlayer();  // user chose to be X-player or O-player
  play_turn (); 
}

 List <String> locations =['1','2','3','4','5','6','7','8','9'];  //uses to deal with the bord-positions values
 List <int> availableLoc =[1,2,3,4,5,6,7,8,9];  // list of available positions in bord  (when one user put its code on one of positions then this position will be deleted)
 List <List<int>> winPatterns =[ [0,1,2] , [3,4,5] , [6,7,8] , [0,4,8] , [2,4,6] , [0,3,6] , [1,4,7] , [2,5,8] ]; // list of (win's patterns lists)


 // variables
bool isX = true; //Represents if  X-player has the turn , else its the O-player turn
bool winner = false;  // no player is satisfy one of the win patterns
int locationsFull = 0; // the number of the locations that is full (used cant selected second time)
bool isAI = false;   // false mean 2 player , true mean 1 players
bool player1turn = true;  // true mean x-player , false mean 0-player


void implementBord(){

  print(' ${locations[0]} | ${locations[1]} | ${locations[2]} ');
  print('---|---|---');
  print(' ${locations[3]} | ${locations[4]} | ${locations[5]} ');
  print('---|---|---');
  print(' ${locations[6]} | ${locations[7]} | ${locations[8]} ');

}

// function for each turn // to set the player who is have the turn & the player enter the location he want
void play_turn(){
  // print ('enter available position number from bord for  "${player1}" -player');
  int locate;
  if (isAI==true) {
    if (!player1turn) {
      print ('The turn for ${player1turn==true ? "X" : "O"}-AI-player');
      Random random= Random();
      locate= random.nextInt(9);
      print('${player1turn==true ? "X" : "O"}-AI-player chose $locate position');
    } else {
      print ('enter available position number from bord for ${player1turn==true ? "X" : "O"}-player');
      locate = int.parse(stdin.readLineSync()!);// user enter the number of its location
      }
  }else{
    print ('enter available position number from bord for ${player1turn==true ? "X" : "O"}-player');
    locate = int.parse(stdin.readLineSync()!); // user enter the number of its location
  }



   bool validity =checkValidateInput(locate);
    while(validity==false){
      play_turn ();
      (locate);
    }

  availableLoc.remove(locate);
  locations[locate-1]='X';

  if(isX){
  //if(player1turn){
  locations[locate-1]='X';}
  else{
  locations[locate-1]='O';}
  isX = !isX;
  player1turn =!player1turn;
  locationsFull++;
  print('the number of reserved positions = ${(locationsFull-9).abs()} ');
  print('the number of available positions = ${locationsFull} ');

  check_patterns();

  if(locationsFull == 9){
    // if locations all comes full that mean the game ended & you will play again
    print ('---------------------------');
    print ('no player won , play again ');
    print ('---------------------------');
    // restart the game 
    playAgain();
  } else {
  implementBord();
  }


  if (winner==false){
  play_turn();
  }
}





bool check_patterns(){   // check if any of players satisfy one of wins patterns
  bool result =false;

  for (var pattern in winPatterns){
    int a=pattern[0];
    int b=pattern[1];
    int c=pattern[2];

    if (locations[a]==locations[b] && locations[a]==locations[c]){
    result=true;
    winner = true;
    print('${locations[a]}-player is the winner !! ');
    print ('');
    print('the game ended !! ');
    print ('');
    print('if you want to play again click A . ');
      if(stdin.readLineSync()=='A'){
         playAgain();}
         else{
              break;  // if any pattern is satisfied then there are a winner player & game must stopped
              }
    }else {
      // result=false;
      // winner = false;
    }
  }
  return result;
}

//function to check if the number entered by user is available
bool checkValidateInput(int location){
  bool status=true;
  if (availableLoc.contains(location)==false){
    print('the number you entered not available !');
    status=false;
     }
return status;
}

void playAgain(){  // function to reset the bord as the game beginning
  locations =['1','2','3','4','5','6','7','8','9']; // the number of each position appear on it
  availableLoc =[1,2,3,4,5,6,7,8,9]; // set all positions as available
  locationsFull = 0; // no position must be booked up at the first of playing 
  winner=false;
  print ('XO Game');
  implementBord(); // implement the game empty body
  play_turn (); 
}

void chosePlayer (){   //  chose play with x-player   or O-player
print('Play with X or O ?');
var player=stdin.readLineSync();
if(player=='X'||player=='x'){
isX=true;
player1turn =true;

} else if (player=='O'||player=='o'){
isX=false;
player1turn =false;

} else {
print('enter X or O !!');
chosePlayer();
}

}

bool playWithAi(){         // if user chose 1player >> mean (play with ai)
  bool status = false;

  print (' 1 player or 2 players ?');
  print ('--- enter `1` or `2` ----');
  int ai= int.parse(stdin.readLineSync()!);
  if(ai==1){
    status = true;
  } else if (ai==2){
    status = false;
  } else {
    print ('--- enter `1` or `2` only! ----');
    playWithAi();
  }
  return status;
}



