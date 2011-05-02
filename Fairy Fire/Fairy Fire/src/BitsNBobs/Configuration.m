//
//  Configuration.m
//  Fairy Fire
//
//  Created by David Wagner on 02/05/2011.
//  Copyright 2011 Noise & Heat. All rights reserved.
//

#import "Configuration.h"

NSString * const kMainConfigStartScene = @"StartScene";

@interface Configuration ()

-(void) initMainConfig;

@property(retain)NSDictionary* main;

@end


@implementation Configuration

@synthesize main;

+(Configuration *) sharedInstance
{
	static Configuration* instance = Nil;
	
	if(!instance)
	{
		instance = [[Configuration alloc] init];
	}
	
	return instance;
}

- (void)initMainConfig
{
	NSString *mainConfigPath = [[NSBundle mainBundle] pathForResource:@"Main" ofType:@"plist"];
	self.main = [NSDictionary dictionaryWithContentsOfFile:mainConfigPath];
}

- (id)init 
{
    self = [super init];
    if (self) 
	{
		[self initMainConfig];
    }
    return self;
}

@end
