//
//  AppDelegate.m
//  SwiftReminder
//
//  Created by 0xack13 on 10/25/14.
//  Copyright (c) 2014 0xack13. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

/*
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotification)
    {
        [application cancelAllLocalNotifications];
    }
    return YES;
}*/
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// This code block is invoked when application is in foreground (active-mode)
/*
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    UIAlertView *notificationAlert = [[UIAlertView alloc] initWithTitle:@"Notification"    message:@"This local notification" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [notificationAlert show];
    // NSLog(@"didReceiveLocalNotification");
}*/


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UILocalNotification *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (notification) {
        [self showAlarm:notification.alertBody];
        NSLog(@"AppDelegate didFinishLaunchingWithOptions");
        application.applicationIconBadgeNumber = 0;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [self showAlarm:notification.alertBody];
    application.applicationIconBadgeNumber = 0;
    NSLog(@"AppDelegate didReceiveLocalNotification %@", notification.userInfo);
}

- (void)showAlarm:(NSString *)text {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"صلوات بشائر الخيرات"
                                                        message:text delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *alertselection = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([alertselection isEqualToString:@"Return"]) {
        NSLog(@"The user select Button 1");
    }
    else if([alertselection isEqualToString:@"OK"]) {
        NSLog(@"The user select Ok. I am going to set a new reminder.");
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Salawat" ofType:@"plist"]];
        NSLog(@"dictionary = %@", dictionary);
        
        NSArray * allKeys = [dictionary allKeys];
        NSLog(@"Count : %d", [allKeys count]);
        
        NSArray *array = [dictionary objectForKey:@"3"];
        NSLog(@"array = %@", array);
        
        int fromNumber = 0;
        int toNumber = [allKeys count] - 1;
        int randomNumber = (arc4random()%(toNumber-fromNumber))+fromNumber;
        NSString *string = [NSString stringWithFormat:@"%d", randomNumber];
        
        NSString *msg= [dictionary valueForKey:string];
        
        
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        
        // current time plus 10 secs
        NSDate *now = [NSDate date];
        NSDate *date = [now dateByAddingTimeInterval:2];
        
        NSLog(@"now time: %@", now);
        //NSLog(@"fire time: %@", dateToFire);
        
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
            localNotification.alertBody = msg; //@"Time to get up!";
            localNotification.soundName = UILocalNotificationDefaultSoundName;
            localNotification.applicationIconBadgeNumber = 1; // increment
            localNotification.repeatInterval = NSSecondCalendarUnit;
            
            
            NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
            localNotification.userInfo = infoDict;
            
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
    }
    else if([alertselection isEqualToString:@"Button 3"]) {
        NSLog(@"The user select Button 3");
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
