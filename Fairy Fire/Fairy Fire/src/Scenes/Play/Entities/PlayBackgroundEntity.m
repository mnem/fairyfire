//
//  PlayBackgroundEntity.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayBackgroundEntity.h"
#import "Resource.h"

@implementation PlayBackgroundEntity

+(id) node
{
	return [PlayBackgroundEntity spriteWithFile:[Resource bestVersion:@"background.jpg"]];
}

- (id)init 
{
    self = [super init];
    if (self) 
	{
		self.anchorPoint = ccp(0, 0);
    }
    return self;
}

@end
