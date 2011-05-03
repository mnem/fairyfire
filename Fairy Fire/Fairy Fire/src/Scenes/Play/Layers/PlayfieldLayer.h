//
//  PlayfieldLayer.h
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PlayBackgroundEntity.h"
#import "Boid.h"

@interface PlayfieldLayer : CCLayer
{
	PlayBackgroundEntity* background;    

    CCSpriteBatchNode* _sheet;
	Boid* _flockPointer; // This is a cheap style linked list
	CGPoint _currentTouch;
}

@property(nonatomic, retain) Boid* _flockPointer;
@property(nonatomic, assign) CCSpriteBatchNode* _sheet;
@property(nonatomic, assign) CGPoint _currentTouch;

@end
