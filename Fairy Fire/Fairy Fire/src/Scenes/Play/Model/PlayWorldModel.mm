//
//  PlayWorldModel.mm
//  Fairy Fire
//
//  Created by David Wagner on 03/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "PlayWorldModel.h"

//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32

@interface PlayWorldModel ()

@property(readwrite,nonatomic) b2World* world;

- (void)createWorld;

@end

@implementation PlayWorldModel

@synthesize world;

- (id)init 
{
    self = [super init];
    if (self) 
	{
        [self createWorld];
    }
    return self;
}

- (void)createWorld
{
	// Define the gravity vector.
	b2Vec2 gravity;
	gravity.Set(0.0f, -10.0f);
	
	// Do we want to let bodies sleep?
	// This will speed up the physics simulation
	bool doSleep = true;
	
	// Construct a world object, which will hold and simulate the rigid bodies.
	world = new b2World(gravity, doSleep);
	
	world->SetContinuousPhysics(true);
}

- (void)setWorldBoundaryInPixelsWidth:(CGFloat)w height:(CGFloat)h
{
	// Define the ground body.
	b2BodyDef groundBodyDef;
	groundBodyDef.position.Set(0, 0); // bottom-left corner
	
	// Call the body factory which allocates memory for the ground body
	// from a pool and creates the ground box shape (also from a pool).
	// The body is also added to the world.
	b2Body* groundBody = world->CreateBody(&groundBodyDef);
	
	// Define the ground box shape.
	b2PolygonShape groundBox;		
	
	// bottom
	groundBox.SetAsEdge(b2Vec2(0,0), b2Vec2(w/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// top
	groundBox.SetAsEdge(b2Vec2(0,h/PTM_RATIO), b2Vec2(w/PTM_RATIO,h/PTM_RATIO));
	groundBody->CreateFixture(&groundBox,0);
	
	// left
	groundBox.SetAsEdge(b2Vec2(0,h/PTM_RATIO), b2Vec2(0,0));
	groundBody->CreateFixture(&groundBox,0);
	
	// right
	groundBox.SetAsEdge(b2Vec2(w/PTM_RATIO,h/PTM_RATIO), b2Vec2(w/PTM_RATIO,0));
	groundBody->CreateFixture(&groundBox,0);
}

@end
