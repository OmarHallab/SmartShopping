//
//  SignUpViewController.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/8/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController


//RegisterationView
@property (strong, nonatomic) IBOutlet UITextField *UsernameField;

@property (strong, nonatomic) IBOutlet UITextField *EmailField;


@property (strong, nonatomic) IBOutlet UITextField *PasswordField;


@property (strong, nonatomic) IBOutlet UITextField *ReEnterPasswordField;


- (IBAction)RegisterAction:(id)sender;

- (IBAction)BackToLogin:(id)sender;


// LoginView

@property (strong, nonatomic) IBOutlet UIView *LoginOverlayView;

@property (strong, nonatomic) IBOutlet UITextField *LUsernameField;

@property (strong, nonatomic) IBOutlet UITextField *LPasswordField;

- (IBAction)LoginAction:(id)sender;

- (IBAction)GoRegister:(id)sender;




@end
