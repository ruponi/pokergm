//
//  Hand.h
//  CardGame
//
//  Created by Ruslan on 8/22/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardStruct.h"
#import "CardView.h"

@interface Hand : NSObject{
    BOOL isFullHand;
}

@property (nonatomic,retain) NSMutableArray *c_hand;


-(BOOL) addCard:(CardView*)card;
-(BOOL) removeCard:(CardView*)card;

// POKER EVALUATION
//=================================
-(struct Card)highCard;
-(BOOL) isStraight;
-(BOOL) isFlush;
-(BOOL) isFlushStraight;
-(BOOL) isFlushRoyal;
-(BOOL) isFullHous;
-(BOOL) isThree;
-(BOOL) isFour;
-(BOOL) isTwoPair;
-(BOOL) isPair;

@end
