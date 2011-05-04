//
//  PlayWorldModel.h
//  Fairy Fire
//
//  Created by David Wagner on 03/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2D.h"

@interface PlayWorldModel : NSObject
{
	b2World* world;
}

@property(readonly,nonatomic) b2World* world;

- (void)setWorldBoundaryInPixelsWidth:(CGFloat)w height:(CGFloat)h;

@end
