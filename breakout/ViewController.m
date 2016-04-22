//
//  ViewController.m
//  breakout
//
//  Created by Triveni Banpela on 2/15/16.
//  Copyright © 2016 Triveni Banpela. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize gameScreen;

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[gameScreen createPlayField];
    
    //event that will detect touch
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.gameScreen addGestureRecognizer:singleFingerTap];
    //[singleFingerTap release];
    
    //code for swipe left (ref: stackOverflow)
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    //code fot swipe right
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    //code for swipe up
    UISwipeGestureRecognizer * swipeup=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeup:)];
    swipeup.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeup];
    
    //code for swipe up
    UISwipeGestureRecognizer * swipedown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];

    
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}



 - (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
 //CGPoint location = [recognizer locationInView:[recognizer.view superview]];
 gameScreen.hidden = YES;
 //Do stuff here...
 }
 
 
 -(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
 {
 NSLog(@" *** SWIPE LEFT ***");
 //  [self leftLogic];
 }
 
 -(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
 {
 NSLog(@" *** SWIPE RIGHT ***");
 //[self rightLogic];
 }
 
 -(void)swipeup:(UISwipeGestureRecognizer*)gestureRecognizer
 {
 NSLog(@" *** SWIPE UP ***");
 //[self upLogic];
 }
 
 -(void)swipedown:(UISwipeGestureRecognizer*)gestureRecognizer
 {
 NSLog(@" *** SWIPE DOWN ***");
 // [self downLogic];
 }

@end
