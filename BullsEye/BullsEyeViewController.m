//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Ryan Robinson on 3/26/14.
//  Copyright (c) 2014 RRobinson. All rights reserved.
//

#import "BullsEyeViewController.h"

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startOver];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self startNewRound];
}

- (IBAction)showAlert
{
    int points = [self calulateScore];
    NSString *message;
    NSString *title;
    
    if(points == 100){
        title = @"Perfect!";
        points += 100;
    }else if(points >= 95){
        title = @"Almost There";
        if(points == 99){
            points += 50;
        }
    }else if(points >= 80){
        title = @"Fine, but...";
        points -= 25;
    }else{
        title = @"C'mon now";
        points = 0;
    }
    
    message = [NSString stringWithFormat:@"You Scored %d Points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    _score += points;
    _round += 1;
    
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

- (IBAction)startOver
{
    _score = 0;
    _round = 1;
    [self startNewRound];
}

- (void)startNewRound
{
    _currentValue = self.slider.value;
    _targetValue = arc4random_uniform(100);
    
    [self updateLabels];
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
}

- (int)calulateScore
{
    int difference = abs(_targetValue - _currentValue);
    
    return lround(100 - difference);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
}

@end
