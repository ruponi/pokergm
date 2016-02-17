//
//  CardGameTests.m
//  CardGameTests
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Hand.h"
#import "CardView.h"

@interface CardGameTests : XCTestCase

@end

@implementation CardGameTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testCreateCardDifferentWay{
 /*   init with number
    "Ace" 0 1 2 3   "2" 4 5 6 7  "3" 8 9 10 11 ...
   Suit-  1 2 3 4       1 2 3 4      1 2 3  4
    ==suits of the cards
    1 - Clubs, 2 - Diamnds, 3 - Hears,4 - Spades
*/
    struct Card myCard;
    myCard.suit=Hearts;
    myCard.value=3;
    
  CardView *tCardV1=[[CardView alloc] initWithNumber:10];
  CardView *tCardV2=[[CardView alloc] initWithCard:myCard];
  XCTAssertEqual(tCardV1.currentCard.value,tCardV2.currentCard.value);
  XCTAssertEqual(tCardV1.currentCard.suit, tCardV2.currentCard.suit);
}

- (void)testAddCardToHand{
    Hand *tHand=[[Hand alloc] init];
    CardView *tCardV1=[[CardView alloc] initWithNumber:1];
    XCTAssert([tHand addCard:tCardV1], @"Pass");
    
}

- (void)testSixCardToHand{
    Hand *tHand=[[Hand alloc] init];
    CardView *tCardV1=[[CardView alloc] initWithNumber:1];
  
    XCTAssert([tHand addCard:tCardV1], @"Pass");
    CardView *tCardV2=[[CardView alloc] initWithNumber:2];
  
    XCTAssert([tHand addCard:tCardV2], @"Pass");
    CardView *tCardV3=[[CardView alloc] initWithNumber:3];
   
    XCTAssert([tHand addCard:tCardV3], @"Pass");
    CardView *tCardV4=[[CardView alloc] initWithNumber:4];
 
    XCTAssert([tHand addCard:tCardV4], @"Pass");
    CardView *tCardV5=[[CardView alloc] initWithNumber:5];
   
    XCTAssert([tHand addCard:tCardV5], @"Pass");
    CardView *tCardV6=[[CardView alloc] initWithNumber:6];
   //add 6 card================
    XCTAssert(![tHand addCard:tCardV6], @"Pass");
}


-(void)testOnePair{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=3;
struct Card myCard2;
    myCard2.suit=Diamonds;
    myCard2.value=3;
struct Card myCard3;
    myCard3.suit=Hearts;
    myCard3.value=6;
struct Card myCard4;
    myCard4.suit=Hearts;
    myCard4.value=8;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=11;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isPair], @"Pass");
    

}

-(void)testTwoPair{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=3;
struct Card myCard2;
    myCard2.suit=Diamonds;
    myCard2.value=3;
struct Card myCard3;
    myCard3.suit=Hearts;
    myCard3.value=6;
struct Card myCard4;
    myCard4.suit=Diamonds;
    myCard4.value=6;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=11;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isTwoPair], @"Pass");
    
}


-(void)testThreeOfKind{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=3;
struct Card myCard2;
    myCard2.suit=Diamonds;
    myCard2.value=3;
struct Card myCard3;
    myCard3.suit=Clubs;
    myCard3.value=3;
struct Card myCard4;
    myCard4.suit=Diamonds;
    myCard4.value=6;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=11;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isThree], @"Pass");

}

-(void)testStraight{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=2;
struct Card myCard2;
    myCard2.suit=Diamonds;
    myCard2.value=3;
struct Card myCard3;
    myCard3.suit=Clubs;
    myCard3.value=4;
struct Card myCard4;
    myCard4.suit=Diamonds;
    myCard4.value=5;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=6;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isStraight], @"Pass");
    
}

-(void)testFlush{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=2;
struct Card myCard2;
    myCard2.suit=Hearts;
    myCard2.value=3;
struct Card myCard3;
    myCard3.suit=Hearts;
    myCard3.value=5;
struct Card myCard4;
    myCard4.suit=Hearts;
    myCard4.value=7;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=8;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isFlush], @"Pass");
    
}

-(void)testFullHous{
    Hand *tHand=[[Hand alloc] init];
struct Card myCard1;
    myCard1.suit=Hearts;
    myCard1.value=2;
struct Card myCard2;
    myCard2.suit=Diamonds;
    myCard2.value=2;
struct Card myCard3;
    myCard3.suit=Clubs;
    myCard3.value=3;
struct Card myCard4;
    myCard4.suit=Diamonds;
    myCard4.value=3;
struct Card myCard5;
    myCard5.suit=Hearts;
    myCard5.value=3;
    CardView *tCardV1=[[CardView alloc] initWithCard:myCard1];
    CardView *tCardV2=[[CardView alloc] initWithCard:myCard2];
    CardView *tCardV3=[[CardView alloc] initWithCard:myCard3];
    CardView *tCardV4=[[CardView alloc] initWithCard:myCard4];
    CardView *tCardV5=[[CardView alloc] initWithCard:myCard5];
    [tHand addCard:tCardV1];
    [tHand addCard:tCardV2];
    [tHand addCard:tCardV3];
    [tHand addCard:tCardV4];
    [tHand addCard:tCardV5];
    XCTAssert([tHand isFullHous], @"Pass");
    
}

@end
