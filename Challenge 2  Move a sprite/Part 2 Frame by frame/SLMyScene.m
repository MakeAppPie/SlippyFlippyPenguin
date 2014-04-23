//
//  SLMyScene.m
//  slippyflippyPenguinGit
//
//  Created by Steven Lipton on 4/23/14.
//  Copyright (c) 2014 Steven Lipton. All rights reserved.
//

#import "SLMyScene.h"

@implementation SLMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        // single line of Code added in Challenge entry #2 to move the text
        [myLabel runAction:[SKAction moveToY:myLabel.position.y + 50 duration:2.0]];
        
        
        [self addChild:myLabel];
        
        /* Make a penguin */
        /* Removed for use of a SKTexture
         //Declarations prior to making the sprite;
         CGFloat penguinWidth = 64.0;
         CGSize penguinSize = CGSizeMake(penguinWidth, penguinWidth);
         SKColor *penguinColor = [SKColor whiteColor];
         
         //initialize the sprite node
         SKSpriteNode *penguin = [SKSpriteNode spriteNodeWithColor:penguinColor
         size:penguinSize];
         
         //set properties
        penguin.position = CGPointMake(100, 100);
        penguin.name = @"penguin";
        //add to the scene tree
        [self addChild:penguin];
         */
        
        //Initialize a sprite with a texture from a file.
        SKSpriteNode *penguin = [SKSpriteNode spriteNodeWithImageNamed:@"gray penguin"];
        penguin.position = CGPointMake(100, 100);
        penguin.name = @"penguin"; //not required but VERY useful

/*------ commented out for Challenge entry #2 part 3 to do frame by frame animation
 
//Added in Challenge entry #2  part 1 to begin movement
        SKAction *movePenguin = [SKAction moveTo:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)) duration:2.0];
        [penguin runAction:movePenguin];
//end addition
 
 ----------------------------------------*/
        [self addChild:penguin];
        
        

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
/*----commented out for Challenge #2 part two frame animation.
 //When this code is commented out, you will get a warning. Ignore it for now.
 //We will deal with this warning in Challenge #3
 
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        sprite.position = location;
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        [sprite runAction:[SKAction repeatActionForever:action]];
        [self addChild:sprite];
 -----------------------*/
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    CGPoint position = [[self childNodeWithName:@"penguin"] position];
    if (++position.y <= CGRectGetMidY(self.frame)){
        [[self childNodeWithName:@"penguin"] setPosition:CGPointMake(++position.x, ++position.y) ];
    }
    
}

@end
