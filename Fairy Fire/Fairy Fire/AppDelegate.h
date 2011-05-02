//
//  AppDelegate.h
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright Noise & Heat 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
