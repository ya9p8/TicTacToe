//
//  GameViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/15/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"
#import "Player.h"


@interface GameViewController ()
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotOne;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotTwo;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotThree;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotFour;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotFive;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotSix;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotSeven;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotEight;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpotNine;
@property NSArray<GridSpot*>* board;
@property (weak, nonatomic) IBOutlet Player *player;
@property CGPoint originalCenter;




@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.board = @[self.gridSpotOne, self.gridSpotTwo, self.gridSpotThree, self.gridSpotFour, self.gridSpotFive, self.gridSpotSix, self.gridSpotSeven, self.gridSpotEight, self.gridSpotNine];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.originalCenter = self.player.center;
}

-(void)setGridImage:(Player*)playerImage:(GridSpot*)spot
{
    spot.image = playerImage.image;
}

- (IBAction)dragImage:(UIPanGestureRecognizer *)sender
{
    CGPoint originPoint = [sender locationInView:self.view];
    //NSLog(@"Original  Point is: %@", NSStringFromCGPoint(originPoint) );
    self.player.center = originPoint;
    
    //NSLog(@"The piece is at: %@ and grid piece coordinates are: %@",NSStringFromCGPoint(self.player.center), NSStringFromCGRect(self.gridSpotOne.frame));
    
     if(sender.state == UIGestureRecognizerStateEnded)
    {
            //NSLog(@"Hey I'm done moving!!");
    
            for(GridSpot* spot in self.board)
            {
                //NSLog(@"Looping thru array of gridspots.... Your patience is appreciated.");
                if(CGRectContainsPoint(spot.frame, originPoint))
                {
                    //NSLog(@"I am in contact with a grid spot.");
                    [self setGridImage:self.player:spot];
    
                    [UIView animateWithDuration:1.0f animations:^{
                        self.player.center = self.originalCenter;
                    }];
                }
            }
        //NSLog(@"Sorry, couldn't find anything to attach to :(");
            [UIView animateWithDuration:1.0f animations:^{
                self.player.center = self.originalCenter;
            }];
        }

}



@end
