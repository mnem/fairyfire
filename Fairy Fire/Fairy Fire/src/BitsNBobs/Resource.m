//
//  Resources.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "Resource.h"

static NSString* bestPrefix = nil;

@implementation Resource

+ (NSString*) bestVersion:(NSString*)resourceName
{
	if(bestPrefix == nil)
	{
		if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		{
			bestPrefix = @"ipad-";
		}
		else
		{
			bestPrefix = @"";
		}
	}
	
	NSString* bestPath = [NSString stringWithFormat:@"%@%@", bestPrefix, resourceName];
	NSString* fullPath = [[NSBundle mainBundle] pathForResource:bestPath ofType:nil];
	if(fullPath)
	{
		// Resource does exist, so use that.
		return bestPath;
	}
	else
	{
		// Resource didn't exist, so leave it up to cocos/user to deal with it
		return resourceName;
	}
}

@end
