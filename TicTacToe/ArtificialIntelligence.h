//
//  ArtificialIntelligence.h
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/16/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GridSpot.h"
#import "Player.h"

@interface ArtificialIntelligence : NSObject

@property Player* aiPlayer;
@property Player* humanPlayer;


-(GridSpot*) getBestMove:(Player* )player: (NSArray<GridSpot *>* )board;


@end
