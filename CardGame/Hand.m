//
//  Hand.m
//  CardGame
//
//  Created by Ruslan on 8/22/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#define MAXCARDCOUNT 5
//============================
#import "Hand.h"

@implementation Hand

-(id)init {
    if (self = [super init]) {
        _c_hand=[[NSMutableArray alloc] init];
        isFullHand=NO;
    }
    return self;
}

//===============================
// add card to hand
// YES if it was added
-(BOOL) addCard:(CardView*)card{
    BOOL result=NO;
    if (_c_hand.count<MAXCARDCOUNT){
        [_c_hand addObject:card];
        [self sortByValue];
        if (_c_hand.count==MAXCARDCOUNT){
            isFullHand=YES;
        } else {
            isFullHand=NO;
        }
        result=YES;
    } else {
        result=NO;
    }
    return result;
}

//===============================
// remove card from hand
// YES if it was removed
-(BOOL) removeCard:(CardView*)card{
    BOOL result=NO;
    for (int i=0; i<_c_hand.count; i++) {
        CardView *tmpCard=_c_hand[i];
        if (tmpCard.currentCard.suit==card.currentCard.suit&&tmpCard.currentCard.value==card.currentCard.value){
            [_c_hand removeObjectAtIndex:i];
            isFullHand=NO;
            result=YES;
            return result;
        }
    }
    return result;
}

-(void) sortByValue{
    NSArray *sortedArray;
    sortedArray = [_c_hand sortedArrayUsingComparator:^NSComparisonResult( id a,  id b) {
        struct Card cf=((CardView *) a).currentCard;
        struct Card cs=((CardView *) b).currentCard;

        return (cf.value >cs.value);
    }];
    
    [_c_hand removeAllObjects];
    [_c_hand addObjectsFromArray:sortedArray];
    
}
#pragma mark POKER EVALUATION ALGORITHMS
//determine hight Card================
-(struct Card)highCard{
    struct Card scard=((CardView*)_c_hand[0]).currentCard;
    if (scard.value==1) {
        //if we have ACE
        return scard;
    } else {
        // other way
        scard=((CardView*)_c_hand[_c_hand.count-1]).currentCard;
        return scard;
    }
    
}

//determine  Flush=================
-(BOOL) isFlush{
    BOOL result=YES;
    if (isFullHand){
        Suit su=None;
        for (CardView *cv in _c_hand) {
          Suit nextSu=cv.currentCard.suit;
          if (su!=nextSu&&su!=None){
                result=NO;
            }
          su=nextSu;
        }
    }
    return result;
}

//determine  Straight===============
-(BOOL)isStraight{
   BOOL result=YES;
    NSInteger value=-1;
    for (CardView *cv in _c_hand) {
        Value nextValue=cv.currentCard.value;
        if ((value+1)!=nextValue&&value!=-1){
            result=NO;
            //check if hand have Ace====
            if (value==1&&nextValue==10){
                result=YES;
            }
        }
        value=nextValue;
    }
    
    return result;
}

//determine  FlushStraight===============
-(BOOL)isFlushStraight{
    BOOL result=NO;
    if(![self isFlushRoyal]&&[self isFlush]&&[self isStraight]){
        result=YES;
    }
    
    return result;
}

//determine  FlushRoyal==================
-(BOOL) isFlushRoyal{
  BOOL result=NO;
    if ([self isFlush]&&[self isStraight]
        &&((struct Card )[self highCard]).value==1
        &&((CardView*)_c_hand[_c_hand.count-1]).currentCard.value==13){
        result=YES;
    }
    return result;
}

//determine  FullHous==================
-(BOOL) isFullHous{
    BOOL result=NO;
    if (isFullHand){
        NSMutableArray *aVL=[[NSMutableArray alloc] init];
        for (CardView *cv in _c_hand) {
            Value cardv=cv.currentCard.value;
            [aVL addObject:[NSNumber numberWithLong:cardv]];
        }
        BOOL r1=(aVL[0]==aVL[1]&&aVL[1]==aVL[2]&&aVL[3]==aVL[4]);
        BOOL r2=(aVL[0]==aVL[1]&&aVL[2]==aVL[3]&&aVL[3]==aVL[4]);
        result=r1||r2;
    }
    
    return result;
    
}

//determine  Three==================
-(BOOL) isThree{
    BOOL result=NO;
    if (isFullHand){
        NSMutableArray *aVL=[[NSMutableArray alloc] init];
        for (CardView *cv in _c_hand) {
            Value cardv=cv.currentCard.value;
            [aVL addObject:[NSNumber numberWithLong:cardv]];
        }
        BOOL r1=(aVL[0]==aVL[1]&&aVL[1]==aVL[2]);
        BOOL r2=(aVL[1]==aVL[2]&&aVL[2]==aVL[3]);
        BOOL r3=(aVL[2]==aVL[3]&&aVL[3]==aVL[4]);
        result=(r1||r2||r3)&&(![self isFullHous]&&![self isFour]);
    }
    
    return result;
    
}

//determine  four==================
-(BOOL) isFour{
    BOOL result=NO;
    if (isFullHand){
        NSMutableArray *aVL=[[NSMutableArray alloc] init];
        for (CardView *cv in _c_hand) {
            Value cardv=cv.currentCard.value;
            [aVL addObject:[NSNumber numberWithLong:cardv]];
        }
        BOOL r1=(aVL[0]==aVL[1]&&aVL[1]==aVL[2]&&aVL[2]==aVL[3]);
        BOOL r2=(aVL[1]==aVL[2]&&aVL[2]==aVL[3]&&aVL[3]==aVL[4]);
        result=(r1||r2);
    }
    
    return result;
    
 
}

//determine  two pair===============
-(BOOL) isTwoPair{
    BOOL result=NO;
    if (isFullHand){
        NSMutableArray *aVL=[[NSMutableArray alloc] init];
        for (CardView *cv in _c_hand) {
            Value cardv=cv.currentCard.value;
            [aVL addObject:[NSNumber numberWithLong:cardv]];
        }
        BOOL r1=(aVL[0]==aVL[1]&&aVL[2]==aVL[3]);
        BOOL r2=(aVL[0]==aVL[1]&&aVL[3]==aVL[4]);
        BOOL r3=(aVL[1]==aVL[2]&&aVL[3]==aVL[4]);
        result=(r1||r2||r3)&&(![self isFullHous]&&![self isFour]&&![self isThree]);
    }
    
    return result;
}

-(BOOL) isPair{
    BOOL result=NO;
    if (isFullHand){
        NSMutableArray *aVL=[[NSMutableArray alloc] init];
        for (CardView *cv in _c_hand) {
            Value cardv=cv.currentCard.value;
            [aVL addObject:[NSNumber numberWithLong:cardv]];
        }
        BOOL r1=(aVL[0]==aVL[1]);
        BOOL r2=(aVL[1]==aVL[2]);
        BOOL r3=(aVL[2]==aVL[3]);
        BOOL r4=(aVL[3]==aVL[4]);
        result=(r1||r2||r3||r4)&&(![self isFullHous]&&![self isFour]&&![self isThree]&&![self isFour]&&![self isTwoPair]);
    }
    
    return result;
}

@end
