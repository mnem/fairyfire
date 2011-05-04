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
#import "PlayWorldModel.h"

@interface PlayfieldLayer : CCLayer
{
	PlayBackgroundEntity* background;  
	PlayWorldModel* worldModel;
}

@end
