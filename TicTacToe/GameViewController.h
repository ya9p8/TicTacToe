//
//  GameViewController.h
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/15/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridSpot.h"
#import "Player.h"


@interface GameViewController : UIViewController
@property NSArray<GridSpot *>* gridPositions;
-(Player*) checkVictory;
-(void)setGridSpotImage:(Player*)player:(GridSpot*)spot;


@end
