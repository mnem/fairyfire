//
//  PlayScene.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayScene.h"
#import "PlayfieldLayer.h"

@implementation PlayScene

- (id)init 
{
    self = [super init];
    if (self) 
	{
		// 'layer' is an autorelease object.
		PlayfieldLayer *layer = [PlayfieldLayer node];
		
		// add layer as a child to scene
		[self addChild: layer];
    }
    return self;
}

@end
