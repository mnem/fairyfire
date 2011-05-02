//
//  PlayfieldLayer.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayfieldLayer.h"


@implementation PlayfieldLayer

- (id)init 
{
    self = [super init];
    if (self) 
	{
		background = [PlayBackgroundEntity node];
		[self addChild:background];
    }
    return self;
}

@end
