//
//  Configuration.h
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kMainConfigStartScene;

@interface Configuration : NSObject {
    NSDictionary* main;
}

@property(retain,readonly)NSDictionary* main;

+(Configuration *) sharedInstance;

@end
