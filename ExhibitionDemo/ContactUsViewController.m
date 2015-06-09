//
//  ContactUsViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/24/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "ContactUsViewController.h"
#import <Parse/Parse.h>

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 624)];}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ContactUS:(id)sender {
    
    NSString *emailTitle = @"This is a test";
    NSString *messageBody = @"<h1>This is a test from smartshopping app";
    NSArray *supportTeam = [NSArray arrayWithObject:@"omar.hallab@live.com"];
    
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:supportTeam];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
}


- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    
    UIAlertView *alertSent = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"Your message has been sent!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
     UIAlertView *alertFailed = [[UIAlertView alloc]initWithTitle:@"Oooops!" message:@"There has been a problem with connection!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
   

    switch(result){
            
        case MFMailComposeResultSent:
            [alertSent show];
            break;
            
        case MFMailComposeResultFailed:
            [alertFailed show];
            break;
            
        default:
            break;
    }
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
