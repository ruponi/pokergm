//
//  CardCVCell.h
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
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
-(void) setcardWithNumber:(NSInteger)number;
 2. init with card (suits/number)
-(void) initWithCard:(struct Card) card;
 
 */


#import <UIKit/UIKit.h>
#import "CardView.h"



@interface CardCVCell : UICollectionViewCell{
    UILabel *l_valueT;
    UILabel *l_valueB;
}


@property (retain, nonatomic) IBOutlet UIView   *cardView;
@property (nonatomic,assign) NSInteger          cardNumber;   //( from 1 to 52 )
@property (nonatomic,assign) struct Card        currentCard;

-(void) initWithCard:(struct Card) card;
-(void) setcardWithNumber:(NSInteger)number;

@end
