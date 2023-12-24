# Tic-Tac-Toe
Tic-Tac-Toe is a classic paper-and-pencil game played by two players, traditionally 'X' and 'O', on a 3x3 grid. The objective is to create a sequence of three of your symbols in a row, column, or diagonal, before your opponent does.


steps :
 When you run the game  the  'implementBord()' function it will be called then the 3*3bord will display with 9 positions and the numbers of each position .

                                                                     { stp-1 using 'playWithAi()' function}
1. First, the question is asked, “2 players or 1 player?”           

    case-One: If he chooses 2
                                                                 { steps-2&3  using 'chosePlayer();'function }
2. The question is: “Play with x or o.”                            
3. If he enters other than these two letters, it will print “Enter only x or o!”, The step 2 & 3 is repeated until x or o is entered   (by calling the same function 'chosePlayer();' another time)

                                                                 {  steps 4-10  inside  play_turn (); function }
4. If user enter x , “Enter an available position number for X-player" and  “Enter an available position number for O-player" if he chose O .
                                                               {steps 5-7 checkValidateInput() function }
5. After a number is entered, it is checked whether the number is available from the positions (initially all numbers 1-9 are available).          
6. If the number is not available, “Enter the number of one of the available positions” message will be printed, then steps 5 and 6 will be repeated until he entered an available .
7. If a number is entered from the available positions, the player code will be display on this position, the position number will be deleted from the list of available position numbers (List <int> availableLoc), and the (fullLocations variable) will be incremented by one.

                                                                              {check_patterns() function }
8. It is checked if one of the winning patterns is achieved for one of the players.
     A - If verified, the name of the winning player will be printed and the user will be asked if he wants to play again. Enter the letter “A”.
          A-1- If you enter the letter A, the steps will be repeated from the beginning (Step 1)
          A-2- If you enter another letter, the game will be stopped
    B - If none of the winning patterns is achieved, we will move to the next step.

9. - It will be checked if fullLocations = 9 (since it has reached this step, of course, none of the players will have achieved any winning pattern) and therefore “No one won” will be printed. “If you want to restart the game, enter A.” { playAgain(); function}

                                                            {calling play_turn();}
10. - If (fullLocations = 9) does not become, then the steps from step 2 will be repeated 


      case-two: If he chooses to play with one player (isAI==true), user will be asked “ play with x or o?”
1. Play will begin by the user
   a- (if user chose X then he will play first) by following the previous steps from step 2-10, then the turn will be transferred to the computer player (ai).
   b-  if user chose O , then the computer player (x-player ) will start first.
2. The computer will give a random number from 4 to 10, and the function 'checkValidateInput()' will check if the given number is among the available numbers by repeating steps from 5 to 7 until the computer gives an available location number, until step-10 when the turn will be transferred to the user. And so on by repeating steps 4 to 10 until the game is stopped by one of conditions is satisfied .