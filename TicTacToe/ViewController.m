//
//  ViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/14/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Button Outlets
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

// Player movesets
@property NSMutableSet* playerOneMoves;
@property NSMutableSet* playerTwoMoves;

// Winning Combos
@property NSSet *winningComboOne;
@property NSSet *winningComboTwo;
@property NSSet *winningComboThree;
@property NSSet *winningComboFour;
@property NSSet *winningComboFive;
@property NSSet *winningComboSix;
@property NSSet *winningComboSeven;
@property NSSet *winningComboEight;
@property NSString* winner;

// Alert stuff for end of game
@property UIAlertController* endGame;
@property UIAlertAction *playAgain;
@property UIAlertAction *cancel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    self.whichPlayerLabel.text = @"X"; //X goes first
    self.playerOneMoves = [NSMutableSet new]; // Initalizing X's move set.
    self.playerTwoMoves = [NSMutableSet new]; // Initalizing O's move set.
    
    
    // Seting winning combination sets
    self.winningComboOne = [NSSet setWithArray:@[self.buttonOne.titleLabel.text, self.buttonTwo.titleLabel.text, self.buttonThree.titleLabel.text]];
    self.winningComboTwo = [NSSet setWithArray:@[self.buttonOne.titleLabel.text, self.buttonFour.titleLabel.text, self.buttonSeven.titleLabel.text ]];
    self.winningComboThree = [NSSet setWithArray:@[self.buttonThree.titleLabel.text, self.buttonFour.titleLabel.text, self.buttonFive.titleLabel.text ]];
    self.winningComboFour = [NSSet setWithArray:@[self.buttonSeven.titleLabel.text, self.buttonEight.titleLabel.text, self.buttonNine.titleLabel.text]];
    self.winningComboFive = [NSSet setWithArray:@[self.buttonTwo.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonEight.titleLabel.text ]];
    self.winningComboSix = [NSSet setWithArray:@[self.buttonThree.titleLabel.text, self.buttonSix.titleLabel.text, self.buttonNine.titleLabel.text ]];
    self.winningComboSeven = [NSSet setWithArray:@[self.buttonOne.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonNine.titleLabel.text ]];
    self.winningComboEight = [NSSet setWithArray:@[self.buttonThree.titleLabel.text, self.buttonFive.titleLabel.text, self.buttonSeven.titleLabel.text ]];
    
    // Setting winner string to empty
    self.winner = @"";
    

    
}

- (IBAction)onButtonTapped:(UIButton *)sender // Sender is button pressed
{
    
    // Changing the label on the board when tapped to player's label
    [sender setTitle:self.whichPlayerLabel.text forState: UIControlStateNormal];
    
    if  ([self.whichPlayerLabel.text isEqual: @"X"])// if current player is X
    {
        [self makeMove:sender.titleLabel.text forMoveSet:self.playerOneMoves buttonPressed:sender colorNeed:[UIColor blueColor]];
    }
    else if ([self.whichPlayerLabel.text isEqual: @"O"]) // current player is O
    {
        [self makeMove:sender.titleLabel.text forMoveSet:self.playerTwoMoves buttonPressed:sender colorNeed:[UIColor redColor]];
        
    }
    self.whichPlayerLabel.text = [self whoWon]; // Setting
    
   
    
}

-(void) makeMove:(NSString* )titleText forMoveSet:(NSMutableSet* )moveSet buttonPressed:(UIButton* )button colorNeed:(UIColor* )color
{
    [moveSet addObject:titleText]; // Adding title text to player moves (1, 2, 3,...)
    [button setTitleColor:color forState:UIControlStateNormal];  // Setting the Color of the label of the button tapped
    [button setEnabled:false]; // Disabling button
}

-(void) resetBoard {
    
    // Change buttons back to original text
    self.buttonOne.titleLabel.text = @"1";
    self.buttonTwo.titleLabel.text = @"2";
    self.buttonThree.titleLabel.text = @"3";
    self.buttonFour.titleLabel.text = @"4";
    self.buttonFive.titleLabel.text = @"5";
    self.buttonSix.titleLabel.text = @"6";
    self.buttonSeven.titleLabel.text = @"7";
    self.buttonEight.titleLabel.text = @"8";
    self.buttonNine.titleLabel.text = @"9";
    
    // Set first player to start
    self.whichPlayerLabel.text = @"X";
    
    // Clear player moves
    [self.playerOneMoves removeAllObjects];
    [self.playerTwoMoves removeAllObjects];
    
    // Enable buttons
    [self.buttonOne setEnabled:true];
    [self.buttonTwo setEnabled:true];
    [self.buttonThree setEnabled:true];
    [self.buttonFour setEnabled:true];
    [self.buttonFive setEnabled:true];
    [self.buttonSix setEnabled:true];
    [self.buttonSeven setEnabled:true];
    [self.buttonEight setEnabled:true];
    [self.buttonNine setEnabled:true];
    
    
}

-(NSString *) whoWon
{
    
    
    
    //NSLog(@"Player Ones: moves: %@",self.playerOneMoves);
    //NSLog(@"Player Twos: moves: %@",self.playerTwoMoves);
    
    //NSLog(@"Winning One Combo: %@", self.winningComboOne);
    
    
    // Compares moves of player one to winning combos if any winning combos is in playerOne's move set, he/she wins.
    if([self.winningComboOne isSubsetOfSet:self.playerOneMoves] || [self.winningComboTwo isSubsetOfSet:self.playerOneMoves] || [self.winningComboThree isSubsetOfSet:self.playerOneMoves] || [self.winningComboFour isSubsetOfSet:self.playerOneMoves] || [self.winningComboFive isSubsetOfSet:self.playerOneMoves] || [self.winningComboSix isSubsetOfSet:self.playerOneMoves] || [self.winningComboSeven isSubsetOfSet:self.playerOneMoves] || [self.winningComboEight isSubsetOfSet:self.playerTwoMoves])
    {
        self.winner = @"X won!";
        
        self.endGame = [UIAlertController alertControllerWithTitle:@"Game Over!" message:self.winner preferredStyle:UIAlertControllerStyleAlert];
        self.playAgain = [UIAlertAction actionWithTitle:@"Play Again?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self resetBoard];
        }];
        
        self.cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [self.endGame addAction:self.playAgain];
        [self.endGame addAction:self.cancel];
        
        [self presentViewController:self.endGame animated:true completion:nil];
        return @"O";
    }
    // Compares moves of player one to winning combos if any winning combos is in playerTwo's move set, he/she wins.
    else if([self.winningComboOne isSubsetOfSet:self.playerTwoMoves] || [self.winningComboTwo isSubsetOfSet:self.playerTwoMoves] || [self.winningComboThree isSubsetOfSet:self.playerTwoMoves] || [self.winningComboFour isSubsetOfSet:self.playerTwoMoves] || [self.winningComboFive isSubsetOfSet:self.playerTwoMoves] || [self.winningComboSix isSubsetOfSet:self.playerTwoMoves] || [self.winningComboSeven isSubsetOfSet:self.playerTwoMoves] || [self.winningComboEight isSubsetOfSet:self.playerTwoMoves])
    {
        self.winner = @"O won!";
        
        self.endGame = [UIAlertController alertControllerWithTitle:@"Game Over!" message:self.winner preferredStyle:UIAlertControllerStyleAlert];
        self.playAgain = [UIAlertAction actionWithTitle:@"Play Again?" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self resetBoard];
        }];
        self.cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [self.endGame addAction:self.playAgain];
        [self.endGame addAction:self.cancel];
        
        [self presentViewController:self.endGame animated:true completion:nil];
        
        return @"X";
    }
    //If neither won game continues with next player
    else if([self.whichPlayerLabel.text isEqualToString:@"X"])
        return @"O";
    //If neither won game continues with next player
    else //if([self.whichPlayerLabel.text isEqualToString:@"O"])
        return @"X";
    
}



@end
