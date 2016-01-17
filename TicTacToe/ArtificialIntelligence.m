//
//  ArtificialIntelligence.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/16/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "ArtificialIntelligence.h"
#import "Player.h"
#import "GridSpot.h"
#import "GameViewController.h"

@interface ArtificialIntelligence()

@property Player* aiPlayer;
@property Player* humanPlayer;

@end



@implementation ArtificialIntelligence



//Gets best move; Move that leads to lower/higher score depending on current player
// Requires Player and Board

-(void) performeMove:(GameViewController*) board
{
    GridSpot* bestMove = [self getBestMove:self.aiPlayer :board.gridPositions];
    [board setGridSpotImage:self.aiPlayer :bestMove];
    
}



-(GridSpot*) getBestMove:(Player* )player: (GameViewController*)board
{
    GridSpot* bestMove;
    NSMutableArray<GridSpot*>* possibleMoves = [NSMutableArray new];
    // Iterate through the board
    for(GridSpot* spot in board.gridPositions)
    {
        // Base case
        Player* winner = [board checkVictory];
        
        if(winner == self.aiPlayer)
        {
            return [[GridSpot alloc] init:10];
        }
        else if(winner == self.humanPlayer)
        {
            return [[GridSpot alloc] init:-10];
        }
        else
        {
            return [[GridSpot alloc] init:0];
        }
        
        if(spot.image == nil) // Image is empty therefore unoccupied
        {
            // Add to possible moves array
            [possibleMoves addObject:spot];
            
            // Get score of the move
            if(player == self.aiPlayer)
            {
                spot.score  = [self getBestMove:self.humanPlayer:board.gridPositions].score;
            }
            else
            {
                spot.score = [self getBestMove:self.aiPlayer :board.gridPositions].score;
            }
            
        }
        
    }
    
    
    
    
    
    return bestMove;
}
@end
