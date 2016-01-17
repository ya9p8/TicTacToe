//
//  GameViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/15/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"
#import "ArtificialIntelligence.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property CGPoint originalPlayerPosition;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionOne;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionTwo;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionThree;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionFour;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionFive;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionSix;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionSeven;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionEight;
@property (weak, nonatomic) IBOutlet UIImageView *gridPositionNine;
@property ArtificialIntelligence* aiPlayer;


@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.gridPositions = @[self.gridPositionOne, self.gridPositionTwo, self.gridPositionThree, self.gridPositionFour, self.gridPositionFive, self.gridPositionSix, self.gridPositionSeven, self.gridPositionEight, self.gridPositionNine];


    
//    while(![self win])
//    {
//        [self playTurn];
//    }
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.originalPlayerPosition = self.playerImage.center;
}




-(void) resetBoard {
    
}


-(Player*) checkVictory
{
    BOOL victory;
    Player* winner;
    for(GridSpot* spot in self.gridPositions)
    {
        if(spot.image == self.playerImage.image || spot.image == self.aiPlayer.aiPlayer.image)
        {
            victory = YES;
        }
    }
    
    
    return winner;
}

-(void)setGridSpotImage:(Player*)player:(GridSpot*)spot
{
    spot.image = player.image;
}

- (IBAction)movePlayer:(UIPanGestureRecognizer *)sender
{
    CGPoint playerOriginCoordinates = [sender locationInView:self.view];
    self.playerImage.center = playerOriginCoordinates;
    
    // Check if the player has stopped moving/ selected a spot
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        // Loop thru the array of grid spots
        for (UIImageView* gridSpot in self.gridPositions)
        {
            // Whichever spot the player stops at changes image of that spot.
            if(CGRectContainsPoint(gridSpot.frame, playerOriginCoordinates))
                // Set grid image to player image
                gridSpot.image = self.playerImage.image;
        }
    }
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:1.0f animations:^{
            self.playerImage.center = self.originalPlayerPosition;
            //self.playerImage.image = [UIImage imageNamed:@"tictactoeo"];
            
        }];
    }
}


@end
