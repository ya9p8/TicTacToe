//
//  GameViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/15/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *playerXImage;
@property (weak, nonatomic) IBOutlet UIImageView *playerOImage;


@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    
    [self.playerXImage addGestureRecognizer:panGestureRecognizer];
    
}



-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
}
@end
