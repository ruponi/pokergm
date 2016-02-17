//
//  DeckViewController.m
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import "DeckViewController.h"
#import "AppDelegate.h"

@interface DeckViewController ()

@end

@implementation DeckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // init class
    [cv_deck registerClass:[CardCVCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    selectedcardsPath=[[NSMutableArray alloc] init];
    selectedCard=[[Hand alloc] init];
    [self.view setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize retval =  CGSizeMake(70, 100);
    
    return retval;
}


#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
   
    return 52;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCVCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    [cell setcardWithNumber:indexPath.row];
    if ( [selectedcardsPath containsObject:indexPath]){
        cell.contentView.layer.borderColor = [[UIColor redColor] CGColor];
        cell.contentView.layer.borderWidth = 4.0;
    } else {
        cell.contentView.layer.borderColor = nil;
        cell.contentView.layer.borderWidth = 0.0;
    }

    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *temparr=[NSMutableArray arrayWithArray:selectedcardsPath];
    if ([selectedcardsPath containsObject:indexPath]){
        [selectedcardsPath removeObject:indexPath];
        CardView *cv=[[CardView alloc] initWithNumber:indexPath.row];
        [selectedCard removeCard:cv];
        v_highScore.hidden=YES;
        l_scoreName.text=@"";
    } else {
        
        if (selectedcardsPath.count<5){
        [selectedcardsPath addObject:indexPath];
        CardView *cv=[[CardView alloc] initWithNumber:indexPath.row];
        [selectedCard addCard:cv];
        [temparr addObject:indexPath];

        }
        if (selectedcardsPath.count==5){
            NSString *myScore=[self getHandName];
            l_scoreName.text=myScore;
            if ([myScore isEqualToString:@"High Card"]){
            l_cardName.attributedText=[self cardValue:[selectedCard highCard]];
            } else {
             l_cardName.text=@"";
            }
             v_highScore.hidden=NO;
            
        } else {
            v_highScore.hidden=YES;
            l_scoreName.text=@"";
        }
    }

    [collectionView reloadItemsAtIndexPaths:temparr];
    [self reloadcards];
    
    // TODO: Select Item
}

                
-(NSString*)getHandName{
    NSString *result=@"";
    struct Card highCard=[selectedCard highCard];
    BOOL isFlush=[selectedCard isFlush];
    BOOL isStraight=[selectedCard isStraight];
    BOOL isFlushStraight=[selectedCard isFlushStraight];
    BOOL isFlushRoyal=[selectedCard isFlushRoyal];
    BOOL isFullHous=[selectedCard isFullHous];
    BOOL isThree=[selectedCard isThree];
    BOOL isFour=[selectedCard isFour];
    BOOL isPair=[selectedCard isPair];
    BOOL isTwoPair=[selectedCard isTwoPair];
    
    if (isFlushRoyal){
            result=@"Royal Flush";
    } else
        if (isFlushStraight){
            result=@"Straight Flush";
    } else
        if (isFour)  {
            result=@"Four of a kind";
    } else
        if (isFullHous)  {
                result=@"Full House";
    } else
        if (isFlush)  {
                result=@"Flush";
    } else
        if (isStraight)  {
                result=@"Straight";
    } else
        if (isThree)  {
                result=@"Three of a Kind";
    } else
        if (isTwoPair)  {
                result=@"Two Pair";
    } else
        if (isPair)  {
                result=@"One Pair";
    } else {
                result=@"High Card";
            
        }


    
    
    NSLog(@"Card=%ld%@ \nFlush=%d\n Straight=%d \n FlushStraight=%d \n FlushRoyal=%d \n FullHous=%d \n Three=%d \n Four=%d",(long)highCard.value,CARDM[highCard.suit], isFlush,isStraight,isFlushStraight,isFlushRoyal,isFullHous,isThree,isFour);
    
    return result;

}

-(NSAttributedString*)cardValue:(struct Card) card
{
    NSString *s_result;
    NSString *cardv;
    switch (card.value) {
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
            cardv=[NSString stringWithFormat:@"%ld",card.value];
            break;
    }

    s_result=[NSString stringWithFormat:@"%@%@",cardv,CARDM[card.suit]];
    NSMutableAttributedString *result=[[NSMutableAttributedString alloc] initWithString:s_result];
    NSRange range={0,s_result.length};
    UIColor *cColor=[UIColor blackColor];
    if (card.suit==Hearts||card.suit==Diamonds){
        cColor=[UIColor redColor];
    }
    [result addAttribute:NSForegroundColorAttributeName
                   value:cColor
                   range:range];

    return result;
    
}

-(void)reloadcards{
    NSArray *oSubView = [v_place subviews];
    for(int iCount = 0; iCount < [oSubView count]; iCount++)
    {
        id object = [oSubView objectAtIndex:iCount];
        [object removeFromSuperview];
    }
    int iCount=0;
    AppDelegate *appDelegate=( AppDelegate* )[UIApplication sharedApplication].delegate;
    double width=appDelegate.window.frame.size.width/5-5;
    for (CardView *cv in selectedCard.c_hand) {
        [v_place addSubview:cv];
        cv.center=CGPointMake((iCount+1)*width-30, 65);
        iCount++;
        
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
