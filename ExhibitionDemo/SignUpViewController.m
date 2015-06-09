//
//  SignUpViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/8/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>


@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    
    
    PFUser *user = [PFUser currentUser];
    if(user.username != nil){
        [self performSegueWithIdentifier:@"GoHomePage" sender:self];
    }
    
    
}




- (IBAction)RegisterAction:(id)sender {
    
    [_UsernameField resignFirstResponder];
    [_EmailField resignFirstResponder];
    [_PasswordField resignFirstResponder];
    [_ReEnterPasswordField resignFirstResponder];
    
    [self checkFieldsComplete];
    
    
}



-(void)checkFieldsComplete {
    if([_UsernameField.text isEqualToString:@""] || [_EmailField.text isEqualToString:@""]||[_PasswordField.text isEqualToString:@""]||[_ReEnterPasswordField.text isEqualToString:@""]
       ){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oooops!" message:@"You need to complete all fields!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    }else{
        
        [self checkPassword];
    }
}

-(void)checkPassword{
    if(![_PasswordField.text isEqualToString:_ReEnterPasswordField.text]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oooops!" message:@"Passwords don't match!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
    }else{
        
        [self RegisterNewUser];
    }
}

-(void)RegisterNewUser{
    NSLog(@"Registering...");
    PFUser *newUser = [PFUser user];
    newUser.username = _UsernameField.text;
    newUser.email = _EmailField.text;
    newUser.password = _PasswordField.text;
    
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        
        if(!error){
            NSLog(@"Registration Success!");
          //  _LoginPassword.text = nil;
          // _LoginUsername.text = nil;
            
            _UsernameField.text = nil;
            _PasswordField.text = nil;
            _EmailField.text = nil;
            _ReEnterPasswordField.text = nil;
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Congratulations!" message:@"Registration Successful!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
            [self performSegueWithIdentifier:@"GoHomePage" sender:self];
            
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oooops!" message:@"There was an error in registration!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            [alert show];
            NSLog(@"There was an error in registration!");
        }
        
    }];
    
    
    
}


- (IBAction)LoginAction:(id)sender {
    
    [PFUser logInWithUsernameInBackground:_LUsernameField.text password:_LPasswordField
     .text block:^(PFUser *user,NSError *error){
        
        if(!error){
            
            PFUser *user = [PFUser currentUser];
            NSString *name = user.username;
            
            NSLog(@"%@ has logged in!",name);
            
            
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"You have successfully logged in!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
            
            _LPasswordField.text = nil;
            _LUsernameField.text = nil;
            
            _UsernameField.text = nil;
            _PasswordField.text = nil;
            _EmailField.text = nil;
            _ReEnterPasswordField.text = nil;
            
            [self performSegueWithIdentifier:@"GoHomePage" sender:self];
        }
        
        if(error){
            NSLog(@"Log in failed!");
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Oooops!" message:@"Sorry! we had a problem logging you in..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
        
        
    }];
    
    
    
    
}


- (IBAction)BackToLogin:(id)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _LoginOverlayView.frame = CGRectMake(0, 0, 600, 600);
        
    }];
    
}


- (IBAction)GoRegister:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        
        _LoginOverlayView.frame = CGRectMake(600, 600, 600, 600);
        
    }];
}
@end
