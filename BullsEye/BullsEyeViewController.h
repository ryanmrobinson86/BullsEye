//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Ryan Robinson on 3/26/14.
//  Copyright (c) 2014 RRobinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundLabel;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;
- (IBAction)startOver;

- (void)startNewRound;
- (void)updateLabels;
- (int)calulateScore;

@end
