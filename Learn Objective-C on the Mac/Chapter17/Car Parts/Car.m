//
//  Car.m
//  Car Parts
//
//  Created by Adam Chamberlin on 15/11/2011.
//  Copyright (c) 2011 Stour Valley Designs. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"

@implementation Car

@synthesize name;
@synthesize engine;
@synthesize make;
@synthesize model;
@synthesize modelYear;
@synthesize numberOfDoors;
@synthesize mileage;

- (id) init
{
    if (self = [super init]) {
        
        self.name = @"Car";
        tires = [[NSMutableArray alloc] init];
        
        int i;
        for (i = 0; i < 4; i++) {
            [tires addObject: [NSNull null]];
        }
    }
    return self;
}

- (id) copyWithZone:(NSZone *)zone {
    Car *carCopy;
    carCopy = [[[self class] allocWithZone: zone] init];
    
    carCopy.name = name;
    carCopy.make = make;
    carCopy.model = model;
    carCopy.numberOfDoors = numberOfDoors;
    carCopy.mileage = mileage;
    
    Engine *engineCopy;
    engineCopy = [[engine copy] autorelease];
    carCopy.engine = engineCopy;
    
    int i;
    for (i = 0; i < 4; i++) {
        Tire *tireCopy;
        tireCopy = [[self tireAtIndex: i] copy];
        [tireCopy release];
        [carCopy setTire: tireCopy atIndex: i];
    }
    return carCopy;
}

- (void) dealloc
{
    self.name = nil;
    [tires release];
    [engine release];
    
    [super dealloc];
}

- (void) setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"mileage"]) {
        mileage = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

- (Tire *) tireAtIndex:(int)index
{
    Tire *tire;
    tire = [tires objectAtIndex: index];
    return tire;
}

- (void) setTire:(Tire *)tire atIndex:(int)index
{
    [tires replaceObjectAtIndex: index withObject: tire];
}

- (void) print
{
	NSString *desc = [self description];
	NSLog (@"%@", desc);	
}


- (NSString *) description {
	NSString *desc;
	desc = [NSMutableString stringWithFormat: 
			@"%@, a %@ %@, has %d doors, %.1f miles, and 4 tires:",
			name, make, model, numberOfDoors, mileage];
    
	return desc;	
}

@end