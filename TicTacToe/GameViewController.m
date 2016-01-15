//
//  GameViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/15/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"

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

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.originalPlayerPosition = self.playerImage.center;
}

- (IBAction)movePlayer:(UIPanGestureRecognizer *)sender
{
    CGPoint startingXPoint = [sender locationInView:self.view];
    
    self.playerImage.center = startingXPoint;
        //NSLog(@"The point is: %f", self.playerXImage.center.x);
    
    //if
    
}

@end
