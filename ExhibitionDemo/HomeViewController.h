//
//  HomeViewController.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/11/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HomeViewController : UIViewController {
    
    IBOutlet UIScrollView *scroller;
    IBOutlet BOOL isOpen;
    
}


- (IBAction)Back:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *settingView;

- (IBAction)Settings:(id)sender;



@property (strong, nonatomic) IBOutlet UILabel *WelcomeLabel;

- (IBAction)LogoutAction:(id)sender;

@end
