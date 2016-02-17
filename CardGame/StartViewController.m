//
//  ViewController.m
//  CardGame
//
//  Created by Ruslan on 8/21/15.
//  Copyright (c) 2015 Rsoft. All rights reserved.
//

#import "StartViewController.h"
#import "CardView.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CardView *cv=[[CardView alloc] initWithNumber:1];
    //NSLog(@"%d(%@)-%ld", cv.currentCard.suit,CARDM[cv.currentCard.suit],cv.currentCard.value);

    UIView *v=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 100)];
    
    [self.view addSubview:v];
    v.backgroundColor=[UIColor whiteColor];
    v.center=CGPointMake(self.view.bounds.size.width/2, 100);
    [cv showInView:v];
    
    
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (_tf_username.text.length==0){
        UIAlertView *alv=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter your name!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alv show];
        return NO;
    } else {
        return YES;
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
