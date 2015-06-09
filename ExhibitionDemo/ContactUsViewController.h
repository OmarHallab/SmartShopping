//
//  ContactUsViewController.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/24/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController : UIViewController  <MFMailComposeViewControllerDelegate>{
    
        IBOutlet UIScrollView *scroller;
}

- (IBAction)ContactUS:(id)sender;

@end
