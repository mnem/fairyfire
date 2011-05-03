//
//  PlayfieldLayer.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayfieldLayer.h"
#import "Boid.h"


@interface PlayfieldLayer ()

-(void) tick: (ccTime) dt;
-(void) boidsInit;

@end

@implementation PlayfieldLayer

@synthesize _flockPointer;
@synthesize _sheet;
@synthesize _currentTouch;

- (id)init 
{
    self = [super init];
    if (self) 
	{
		background = [PlayBackgroundEntity node];
		[self addChild:background];

		CCSprite* deliciousCake = [CCSprite spriteWithFile:@"minicake.png"];
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		deliciousCake.position = ccp(screenSize.width/2, screenSize.height/2);
		[self addChild:deliciousCake];

		//[self boidsInit];
    }
    return self;
}

-(void) boidsInit
{
	srandom(time(NULL));
	
	//[self setColor: ccc3(128, 128, 128)];
	CGSize screenSize = [[CCDirector sharedDirector] winSize];
	CGRect boidRect = CGRectMake(0,0, 16, 16);
	
	
	self._sheet = [CCSpriteBatchNode batchNodeWithFile:@"boid.png" capacity:201];
	self.isTouchEnabled = YES;
	self._currentTouch = CGPointZero;
	[_sheet setBlendFunc:(ccBlendFunc){GL_ONE, GL_ONE}];
	[self addChild:_sheet z:0 tag:0];
	
	
	_flockPointer = [Boid spriteWithBatchNode:_sheet rect: boidRect];
	Boid* previousBoid = _flockPointer;
	Boid *boid = _flockPointer;
	
	
	// Create many of them
	float count = 180.0f;
	for (int i = 0; i < count; i++) 
	{
		// Create a linked list
		// The first one has no previous and is made for us already
		if(i != 0)
		{
			boid = [Boid spriteWithBatchNode:_sheet rect: boidRect];
			previousBoid->_next = boid; // special case for the first one
		}
		
		previousBoid = boid;
		
		boid.doRotation = YES;
		
		// Initialize behavior properties for this boid
		// You want the flock to behavior basically the same, but have a TINY variation among members
		
		//[boid setSpeedMax: 2.0f andSteeringForceMax:1.0f];			
		[boid setSpeedMax: 2.2f withRandomRangeOf:0.15f andSteeringForceMax:1.0f withRandomRangeOf:0.15f];
		[boid setWanderingRadius: 16.0f lookAheadDistance: 40.0f andMaxTurningAngle:0.2f];
		[boid setEdgeBehavior: CCRANDOM_0_1() < 0.9 ? EDGE_WRAP : EDGE_BOUNCE];
		
		// Cocos properties
		[boid setScale: 0.5 + CCRANDOM_0_1()];
		[boid setPos: ccp( CCRANDOM_MINUS1_1() * screenSize.width,  screenSize.height / 2)];
		// Color
		[boid setOpacity:128];
		[_sheet addChild:boid];
	}
	
	
	[self schedule: @selector(tick:)];
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
	
}

-(void) tick: (ccTime) dt
{
	Boid* boid = _flockPointer;
	while(boid)
	{
		Boid* b = boid;
		boid = b->_next;
		[b wander: 0.15f];
		[b 
		 flock:_flockPointer
		 withSeparationWeight:1.0f
		 andAlignmentWeight:0.1f
		 andCohesionWeight:0.2f
		 andSeparationDistance:10.0f
		 andAlignmentDistance:30.0f
		 andCohesionDistance:20.0f
		 ];
		
		// Uncomment one of these to get user interaction
		if ( CGPointEqualToPoint( _currentTouch, CGPointZero ) == NO )
		{
			//[b flee: self._currentTouch panicAtDistance:35 usingMultiplier:0.25f]; // avoid touch
			[b seek:self._currentTouch withinRange:75 usingMultiplier:0.35f]; // go towards touch
		}
		[b update];
	}
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	self._currentTouch = [self convertTouchToNodeSpace: touch];
	return YES;
}

// touch updates:
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	self._currentTouch = [self convertTouchToNodeSpace: touch];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	self._currentTouch = CGPointZero;
}

@end
