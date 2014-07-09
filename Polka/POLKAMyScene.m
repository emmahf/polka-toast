//
//  POLKAMyScene.m
//  Polka
//
//  Created by Mikael Dalkvist on 2014-07-09.
//  Copyright (c) 2014 Snow Bird Studios. All rights reserved.
//

#import "POLKAMyScene.h"

@implementation POLKAMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor whiteColor];
        
        //        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue"];
        //
        //        myLabel.text = @"Polka";
        //        myLabel.fontSize = 30;
        //        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
        //                                       CGRectGetMidY(self.frame));
        //
        //        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKShapeNode *circleNode = [[SKShapeNode alloc ]init];
        CGMutablePathRef circle = CGPathCreateMutable();
        CGPathAddArc(circle, NULL, 0, 0, 10, 0, M_PI*2, YES);
        
        circleNode.path = circle;
        circleNode.name=@"circleNode";
        circleNode.fillColor = [SKColor colorWithRed:0.9 green:0.3 blue:0.235 alpha:1.0];
        circleNode.position = location;
        
        SKAction *grow = [SKAction scaleTo:3.0 duration:0.3];
        SKAction *shrink = [SKAction scaleTo:1.0 duration:0.3];
        SKAction *pause = [SKAction waitForDuration:1.0];
        SKAction *pulse = [SKAction sequence:@[grow, shrink, pause]];
        
        [circleNode runAction:[SKAction repeatActionForever:pulse]];
        
        [self addChild:circleNode];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
