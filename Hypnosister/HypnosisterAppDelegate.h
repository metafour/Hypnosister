//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Camron Schwoegler on 9/24/13.
//  Copyright (c) 2013 Camron Schwoegler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder <UIApplicationDelegate>
{
    HypnosisView *view;
}
@property (strong, nonatomic) UIWindow *window;

@end
