//
//  CardView.h
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//
/*
 ==========================================
 suits of the cards
1 - Clubs
2 - Diamnds
3 - Hears
4 - Spades
--------------
 value of the card
2..10- Numbers
1  - Ace
11 - Jack
12 - Quin
13 - King
 =============================================
 
init with number
   "Ace" 0 1 2 3   "2" 4 5 6 7  "3" 8 9 10 11 ...
-----------------------------------------------
 
 the class have two methods fo initialization
 1. number card on the deck
 - (CardView*) initWithNumber:(NSInteger) number
 2. init with card (suits/number)
 - (CardView*) initWithCard:(struct Card) card
 
 */


#import <UIKit/UIKit.h>
#import "CardStruct.h"

@interface CardView : UIView{
    UILabel *l_valueT; //top label
    UILabel *l_valueB; //bottom label
}

@property (nonatomic,assign) NSInteger      cardNumber;   //( from 1 to 52 )
@property (nonatomic,assign) struct Card    currentCard;

- (CardView*) initWithNumber:(NSInteger) number;
- (CardView*) initWithCard:(struct Card) card;
- (void)showInView:(UIView*)view;

@end
