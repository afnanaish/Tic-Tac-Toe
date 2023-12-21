import 'dart:io';
// use import 'dart:io' because user input is required

void main() {
  implementBord(); // implement the game empty body
  play_turn ();
}

 List <String> locations =['1','2','3','4','5','6','7','8','9'];
 List <int> availableLoc =[0,1,2,3,4,5,6,7,8];
 List <List<int>> winPatterns =[ [0,1,2] , [3,4,5] , [6,7,8] , [0,4,8] , [2,4,6] , [0,3,6] , [1,4,7] , [2,5,8] ]; // list of (win's patterns lists)


 // variables
bool isX = true; //Represents if  X-player has the turn , else its the O-player turn
bool winner = false; 
int locationsFull = 0; // the number of the locations that is full (used cant selected second time)

void implementBord(){

  print ('XO Game');
  print(' ${locations[0]} | ${locations[1]} | ${locations[2]} ');
  print('---|---|---');
  print(' ${locations[3]} | ${locations[4]} | ${locations[5]} ');
  print('---|---|---');
  print(' ${locations[6]} | ${locations[7]} | ${locations[8]} ');

}

// function for each turn // to set the player who is have the turn & the player enter the location he want
void play_turn (){
  print ('enter available position number from bord for ${isX==true ? "X" : "O"}-player');
   int locate = int.parse(stdin.readLineSync()!); // user enter the number of its location

   bool validity =checkValidateInput(locate);
    while(validity==false){
      play_turn ();
      (locate);
    }

  availableLoc.remove(locate);
  locations[locate-1]='X';
  print( locations[locate-1]);
  if(isX){
  locations[locate-1]='X';}
  else{
  locations[locate-1]='O';}
  isX = !isX;
  locationsFull++;

  if(locationsFull == 9){
    // if locations all comes full that mean the game ended & you will play again
    winner= true ; // to stop the play_turn() function
    print ('no player won , play again ');
  } else {
  implementBord();
  }

  check_patterns();

  if (winner==false){
  play_turn();
  }
}


bool check_patterns(){
  bool result =false;

  for (var pattern in winPatterns){
    int a=pattern[0];
    int b=pattern[1];
    int c=pattern[2];

    if (locations[a]==locations[b] && locations[a]==locations[c]){
    result=true;
    winner = true;
    print('${locations[a]}-player is the winner !! ');
    break;  // if any pattern is satisfied then there are a winner player & game must stopped
    }else {

    }
  }
  return result;
}

// function to check if the number enterd by user is available
bool checkValidateInput(int location){
  bool status=true;
  if (availableLoc.contains(location)==false){
    print('the number you entered not available !');
    status=false;
     }
return status;
}

// 012  345  678    048 246   036 147 258