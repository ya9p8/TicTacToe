//
//  GridSpot.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/16/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GridSpot.h"

@implementation GridSpot

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init:(int) score
{
    self = [super init];
    if (self) {
        self.score = score;
    }
    return self;
}
-(instancetype)init
{
    return self;
}

@end
