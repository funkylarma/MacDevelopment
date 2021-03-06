//
//  Logger.m
//  CallBacks
//
//  Created by Adam Chamberlin on 03/01/2012.
//  Copyright (c) 2012 Stour Valley Designs. All rights reserved.
//

#import "Logger.h"

@implementation Logger

-(void)sayOuch:(NSTimer *)t
{
    NSLog(@"Ouch");
}

-(void)zoneChange:(NSNotification *)note
{
    NSLog(@"The system time zone has changed");
}

//Called each time a chunk of data arrives
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu bytes", [data length]);
    
    //Create a mutable data if it doesn't already exist
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

//Called when the last chunk has been processed
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Got it all!");
    
    NSString *string = [[NSString alloc] initWithData:incomingData encoding:NSUTF8StringEncoding];
    
    incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    
    //Uncomment the next line to see the entire fetched file
    NSLog(@"The whole string is %@", string);
}

//Called if the fetch fails

@end
