#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface Design_17_17_CannotExitScreen : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_17_17_CannotExitScreen

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_17_17_CannotExitScreen* self = (Design_17_17_CannotExitScreen*) theScript;
        if(([mActor getX] < 0))
{
            [mActor setXPosition:0];
}

        if(([mActor getY] < 0))
{
            [mActor setYPosition:0];
}

        /* @"Use scene, not screen" */
        if((([mActor getX] + [mActor getWidth]) > [self getSceneWidth]))
{
            [mActor setXPosition:([self getSceneWidth] - [mActor getWidth])];
}

        if((([mActor getY] + [mActor getHeight]) > [self getSceneHeight]))
{
            [mActor setYPosition:([self getSceneHeight] - [mActor getHeight])];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end