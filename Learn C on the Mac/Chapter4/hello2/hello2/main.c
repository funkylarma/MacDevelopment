//
//  main.c
//  hello2
//
//  Created by Adam Chamberlin on 11/10/2011.
//  Copyright 2011 Stour Valley Designs. All rights reserved.
//

#include <stdio.h>

void SayHello(void);

int main (int argc, const char * argv[])
{
    SayHello();
    
    return 0;
}

void SayHello(void) {
    printf("Hello, world!\n");
}

