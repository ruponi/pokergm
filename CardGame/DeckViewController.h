//
//  DeckViewController.h
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"
#import "CardCVCell.h"
#import "Hand.h"

@interface DeckViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
                NSArray             *cards;
    IBOutlet    UICollectionView    *cv_deck;
                NSMutableArray      *selectedcardsPath;
                Hand                *selectedCard;
    IBOutlet    UIView              *v_place;
    IBOutlet    UIView              *v_highScore;
    IBOutlet    UILabel             *l_scoreName;
    IBOutlet    UILabel             *l_cardName;
}
@property (nonatomic, strong) NSIndexPath *selectedItemIndexPath;

@end
