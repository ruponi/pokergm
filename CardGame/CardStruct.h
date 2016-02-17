//
//  CardStruct.h
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//
/*
==========================================
suits of the cards
-1 - NONE
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

init Card with number
 "Ace" 0 1 2 3   "2" 4 5 6 7  "3" 8 9 10 11 ...
-----------------------------------------------
*/

#ifndef CardGame_CardStruct_h
#define CardGame_CardStruct_h

#define CARDM @[@"♣︎",@"♦︎",@"♥︎",@"♠︎"]

typedef enum { None=-1,
    Clubs, Diamonds, Hearts,Spades
} Suit;

typedef NSInteger Value;

struct Card {
    Suit suit;
    Value value;
};

#endif
