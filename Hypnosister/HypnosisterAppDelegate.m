//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by Camron Schwoegler on 9/24/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    CGRect viewFrame = CGRectMake(130, 240, 100, 150);
    
//    HypnosisView *view = [[HypnosisView alloc] initWithFrame:[[self window] bounds]];
    
    // Hide status bar after launch
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    CGRect screenRect = [[self window] bounds];
    
    // UIScrollView should match window size
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:5.0];
    
    [scrollView setDelegate:self];
    
    [[self window] addSubview:scrollView];
    
    // Create Hypnosis view twice the size of the screen
    CGRect bigRect = screenRect;
    
    bigRect.size.width *= 2;
    bigRect.size.height *= 2;
    view = [[HypnosisView alloc] initWithFrame:bigRect];
    
    [scrollView addSubview:view];
    
//    secondView
    
    // Place secondView to the right of the first view
//    screenRect.origin.x = screenRect.size.width - 100;
//    
//    HypnosisView *secondView = [[HypnosisView alloc] initWithFrame:screenRect];
//    
//    [scrollView addSubview:secondView];
    
    // Tell scrollView size of the the content area
    [scrollView setContentSize:bigRect.size];
    
//    [[self window] addSubview:view];
    
    BOOL success = [view becomeFirstResponder];
    if (success) {
        NSLog(@"HypnosisView became first responder");
    } else {
        NSLog(@"Could not become first responder");
    }
    
    self.window.backgroundColor = [UIColor greenColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return view;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
