//
//  ViewController.m
//  SwiftReminder
//
//  Created by 0xack13 on 10/25/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)buttonPressed:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    int fromNumber = 1;
    int toNumber = 5;
    int randomNumber = (arc4random()%(toNumber-fromNumber))+fromNumber;
    
    
    NSString * f = @"foo";
    NSString * b = @"bar";
    NSString * z = @"baz";
    NSArray  * myArray2 = [NSArray arrayWithObjects:f,b,z,nil];
    
    NSLog(@"The element at index %d in the array is: %@", randomNumber, [myArray2 objectAtIndex:1]);
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotification.alertBody = @"Hello there!";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 10;
    
    UIAlertView *notificationAlert = [[UIAlertView alloc] initWithTitle:@"Notification"    message:@"This local notification" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [notificationAlert show];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}
@end
