//
//  HomeViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/11/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>


@interface HomeViewController ()

@end

@implementation HomeViewController



-(void) viewDidAppear:(BOOL)animated{
    
    PFUser *user = [PFUser currentUser];
    NSString *name = user.username;
    NSString *message = [NSString stringWithFormat:@"Welcome,%@",name];
    _WelcomeLabel.text =message;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // for the scrolling action
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 624)];
    
 
}

// Logout Button
- (IBAction)LogoutAction:(id)sender {
    [PFUser logOut];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)Settings:(id)sender {
        
    if(isOpen == false){
        
        isOpen = true;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _settingView.frame = CGRectMake(0, 0, 200, 624);
            
        }];
        
        
    }else{
        
        isOpen = false;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            _settingView.frame = CGRectMake(-200, 624, 200, 624);
            
        }];
        
    }
  
}


- (IBAction)Back:(id)sender {
 
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _settingView.frame = CGRectMake(-200, 624, 200, 624);
        
    }];
}
@end
