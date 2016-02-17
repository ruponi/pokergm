//
//  CardView.m
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import "CardView.h"
#import "AppDelegate.h"

@implementation CardView

- (CardView*) initWithNumber:(NSInteger) number{

    // create card===============
    if ((self = [super init])) {
       
        _cardNumber=number+1;
        if (_cardNumber>52){
            _cardNumber=52;
        }
        if (_cardNumber<1){
            _cardNumber=1;
        }
// determine card suits
        NSInteger t_num=_cardNumber%4;
        Suit cSuit;
        switch (t_num) {
            case 0:
                cSuit=Spades;
                break;
            case 1:
                cSuit=Clubs;
                break;
            case 2:
                cSuit=Diamonds;
                break;
            case 3:
                cSuit=Hearts;
                break;
            default:
                break;
        }

//determine card value
        NSInteger cValue=floor(number/4)+1;
        
//setup card structure
        _currentCard.suit=cSuit;
        _currentCard.value=cValue;
        [self setupView];
    }

    
    
    
    return self;
}

-(void)setupView{
    // frame of the card
     AppDelegate *appDelegate=( AppDelegate* )[UIApplication sharedApplication].delegate;
    double width=appDelegate.window.frame.size.width;
    self.frame=CGRectMake(0, 0, width/5-10, 100);
    self.layer.borderColor=[UIColor blackColor].CGColor;
    self.layer.borderWidth=1.0;
    self.backgroundColor=[UIColor colorWithWhite:0.9 alpha:0.5];
    
    //card value========
    NSString *cardv;
    switch (_currentCard.value) {
        case 1:
            cardv=@"A";
            break;
        case 11:
            cardv=@"J";
            break;
        case 12:
            cardv=@"Q";
            break;
        case 13:
            cardv=@"K";
            break;
            
        default:
            cardv=[NSString stringWithFormat:@"%ld",_currentCard.value];
            break;
    }
    
    // top  label
    l_valueT=[[UILabel alloc] initWithFrame:CGRectMake(5, 0, 50, 30)];
    l_valueT.text=[NSString stringWithFormat:@"%@%@",cardv,CARDM[_currentCard.suit]];
    // bottom label
    l_valueB=[[UILabel alloc] initWithFrame:CGRectMake(0, 0,50, 30)];
    l_valueB.center=CGPointMake(self.frame.size.width-30, self.frame.size.height-15);
    l_valueB.transform=CGAffineTransformMakeRotation( ( 180 * M_PI ) / 180 );
    l_valueB.text=[NSString stringWithFormat:@"%@%@",cardv,CARDM[_currentCard.suit]];
    
    //color
    if (_currentCard.suit==Diamonds||_currentCard.suit==Hearts){
        l_valueB.textColor=[UIColor redColor];
        l_valueT.textColor=[UIColor redColor];
    } else {
        l_valueB.textColor=[UIColor blackColor];
        l_valueT.textColor=[UIColor blackColor];
    }
    [self addSubview:l_valueT];
    [self addSubview:l_valueB];
    
    
}

- (void)showInView:(UIView*)view{
    [self removeFromSuperview];
    self.frame=CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    l_valueT.center=CGPointMake(30, 15);
    l_valueB.center=CGPointMake(self.frame.size.width-30, self.frame.size.height-15);
    [view addSubview:self];
}

- (CardView*) initWithCard:(struct Card) card{
     if ((self = [super init])) {
         _currentCard=card;
         if (_currentCard.value>13){
             _currentCard.value=13;
         }
         if (_currentCard.value<1){
             _currentCard.value=1;
         }
         
         _cardNumber=(_currentCard.value-1)*4+_currentCard.suit;
         [self setupView];
     }
    
    
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
