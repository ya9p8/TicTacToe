//
//  ViewController.m
//  TicTacToe
//
//  Created by Yemi Ajibola on 1/14/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onButtonTapped:(UIButton *)sender {
    sender.titleLabel.text = self.whichPlayerLabel.text;
    if  ([sender.titleLabel.text isEqual: @"X"]) {
        sender.titleLabel.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"O";
    
    }
    else {
        sender.titleLabel.textColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"X";
    }
    
}

//-(NSString *) whoWon
//{
//    if()
//        return @"X won!";
//    else
//        return @"O won!";
//}



@end
