//
//  ViewController.h
//  DiseaseRead
//
//  Created by Triveni Banpela on 4/23/16.
//  Copyright © 2016 Triveni Banpela. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)Switch1:(id)sender;
- (IBAction)Switch2:(id)sender;
- (IBAction)Switch3:(id)sender;
- (IBAction)Switch4:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;
@property (weak, nonatomic) IBOutlet UILabel *lblSymptom;
@property (weak, nonatomic) IBOutlet UILabel *lblDiesease1;
@property (weak, nonatomic) IBOutlet UILabel *lblDisease2;
@property (weak, nonatomic) IBOutlet UILabel *lblDisease3;
@property (weak, nonatomic) IBOutlet UILabel *lblDisease4;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblCorrect;

@property (weak, nonatomic) IBOutlet UISwitch *Switch1val;
@property (weak, nonatomic) IBOutlet UISwitch *Switch2val;
@property (weak, nonatomic) IBOutlet UISwitch *Switch3val;
@property (weak, nonatomic) IBOutlet UISwitch *Switch4val;

@property (nonatomic) NSInteger counter;

- (IBAction)ResetButton:(id)sender;

- (IBAction)SubmitButton:(id)sender;

@end

