//
//  PlayfieldLayer.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayfieldLayer.h"


@interface PlayfieldLayer ()

- (void)addBackgroundImage;
- (void)addSomeDeliciousCake;
- (void)createPhysicalModel;
//-(void) update: (ccTime) dt;

@end

@implementation PlayfieldLayer

- (id)init 
{
    self = [super init];
    if (self) 
	{
		[self createPhysicalModel];
		[self addBackgroundImage];
		[self addSomeDeliciousCake];
    }
    return self;
}

- (void)addBackgroundImage
{
	background = [PlayBackgroundEntity node];
	[self addChild:background];
}

- (void)addSomeDeliciousCake
{
	CCSprite* deliciousCake = [CCSprite spriteWithFile:@"minicake.png"];
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	deliciousCake.position = ccp(screenSize.width/2, screenSize.height/2);
	[self addChild:deliciousCake];
}

- (void)createPhysicalModel
{
	worldModel = [[PlayWorldModel alloc] init];

	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	[worldModel setWorldBoundaryInPixelsWidth:screenSize.width height:screenSize.height];
}

- (void)dealloc {
    [worldModel release];
    [super dealloc];
}

@end
