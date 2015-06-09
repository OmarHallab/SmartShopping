//
//  NotificationsViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/24/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "NotificationsViewController.h"
#import "Parse/Parse.h"
#import <ESTCloudManager.h>


static NSString *const kAppID = @"smartshopping";
static NSString *const kAppToken =@"2d3ab540660008b4b6092979035597ee";

@interface NotificationsViewController ()


@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ESTCloudManager setupAppID:kAppID andAppToken:kAppToken];
    [ESTCloudManager isAuthorized];
    [ESTCloudManager enableMonitoringAnalytics:YES];
    
    
    self.beaconManger = [[ESTBeaconManager alloc]init];
    self.beaconManger.delegate = self;
    
    
    // initial beacon Regions
    
    //Mint = H&M
    self.beaconRegion1 =  [[CLBeaconRegion alloc]initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:36802 minor:5302 identifier:@"HM"];
    
    //Blueberry = Virgin
    self.beaconRegion2 =  [[CLBeaconRegion alloc]initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:18958 minor:17157 identifier:@"Virgin"];
    
    
    //Ice = Carrefour
    self.beaconRegion3 = [[CLBeaconRegion alloc]initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID major:14869 minor:13530 identifier:@"Carrefour"];
    
    
    //always and when in use
    [self.beaconManger requestAlwaysAuthorization];
    [self.beaconManger requestWhenInUseAuthorization];
    

    
   // Start monitoring the beacons
    
    [self.beaconManger startMonitoringForRegion:self.beaconRegion1];
    [self.beaconManger startMonitoringForRegion:self.beaconRegion2];
    [self.beaconManger startMonitoringForRegion:self.beaconRegion3];
    
    
    
  //  Start ranging the beacons
    
    [self.beaconManger startRangingBeaconsInRegion:self.beaconRegion1];
    [self.beaconManger startRangingBeaconsInRegion:self.beaconRegion2];
    [self.beaconManger startRangingBeaconsInRegion:self.beaconRegion3];
    
    
}


//Beacon manager did enter region
-(void)beaconManager:(id)manager didEnterRegion:(CLBeaconRegion *)region{
    
    //get current active user
    PFUser *user = [PFUser currentUser];
    NSString *name = user.username;
    
    
    //Notification messages
    NSString *messageHM = @" ,Welcome to H&M! ";
    NSString *messageVirgin = @" ,Welcome to Virgin!";
    NSString *messageCarrefour = @" ,Welcome to Carrefour! ";
    
    // alloc and initialize the notifications for stores
    
    UILocalNotification *EntryNotification = [[UILocalNotification alloc]init];
    
    
    
    // Once near the region H&M
    if([region.identifier isEqualToString:@"HM"]){
        
        
        // send local notification
        
        EntryNotification.alertBody = [name stringByAppendingString:messageHM];
        
        EntryNotification.soundName = @"Default.mp3";
        
        [[UIApplication sharedApplication]presentLocalNotificationNow:EntryNotification];
        
        
        // Log action
        
        NSString *Entrymessage = @" Has entered H&M!";
        
        NSString *logmessage = [name stringByAppendingString:Entrymessage];
        
        NSLog(@"Recent activity: %@",logmessage);
        
        
        [self performSegueWithIdentifier:@"GoHM" sender:self];
        
    }
    
    // Once near the region on Virgin
    
//    if([region.identifier isEqualToString:@"Virgin"]){
//        
//        
//        EntryNotification.alertBody = [name stringByAppendingString:messageVirgin];
//        
//       // EntryNotification.soundName = @"Default.mp3";
//        
//        [[UIApplication sharedApplication]presentLocalNotificationNow:EntryNotification];
//        
//        
//        // Log action
//        
//        NSString *Entrymessage = @" Has entered Virgin!";
//        
//        NSString *logmessage = [name stringByAppendingString:Entrymessage];
//        
//        NSLog(@"Recent activity: %@",logmessage);
//        
//    
//    }
    
    // Once near the region of Carrefour
    
    
    
//    if([region.identifier isEqualToString:@"Carrefour"]){
//        
//        EntryNotification.alertBody = [name stringByAppendingString:messageCarrefour];
//        
//       // EntryNotification.soundName = @"Default.mp3";
//        
//        [[UIApplication sharedApplication]presentLocalNotificationNow:EntryNotification];
//        
//        
//        // Log action
//        
//        NSString *Entrymessage = @" Has entered Carrefour!";
//        
//        NSString *logmessage = [name stringByAppendingString:Entrymessage];
//        
//        NSLog(@"Recent activity: %@",logmessage);
//        
//       
//    }
}



//Beacon manager did exit region
-(void)beaconManager:(id)manager didExitRegion:(CLBeaconRegion *)region{
    
    
    
    //get current active user
    PFUser *user = [PFUser currentUser];
    NSString *name = user.username;
    
    
    //Notification messages
    NSString *messageHM = @" ,Thank you for stopping by H&M! ";
    NSString *messageVirgin = @" ,Thank you for stopping by Virgin!";
    NSString *messageCarrefour = @" ,Thank you for stopping by  Carrefour! ";
    
    // alloc and initialize the notifications for stores
    
    UILocalNotification *ExitNotification =
    [[UILocalNotification alloc]init];
    
    
    
    
    // Once exited the region H&M
    if([region.identifier isEqualToString:@"HM"]){
        
        
        // send local notification
        
        ExitNotification.alertBody = [name stringByAppendingString:messageHM];
        
        ExitNotification.soundName = @"Default.mp3";
        
        [[UIApplication sharedApplication]presentLocalNotificationNow:ExitNotification];
        
        
        // Log action
        
        NSString *Entrymessage = @" Has exited H&M!";
        
        NSString *logmessage = [name stringByAppendingString:Entrymessage];
        
        NSLog(@"Recent activity: %@",logmessage);
        
    }
    
    // Once exited the region on Virgin
//    if([region.identifier isEqualToString:@"Virgin"]){
//        
//        // send local notification
//        
//        ExitNotification.alertBody = [name stringByAppendingString:messageVirgin];
//        
//       // ExitNotification.soundName = @"Default.mp3";
//        
//        [[UIApplication sharedApplication]presentLocalNotificationNow:ExitNotification];
//        
//        
//        // Log action
//        
//        NSString *Entrymessage = @" Has exited Virgin!";
//        
//        NSString *logmessage = [name stringByAppendingString:Entrymessage];
//        
//        NSLog(@"Recent activity: %@",logmessage);
//        
//        
//    }
    
    // Once exited the region of Carrefour
//    if([region.identifier isEqualToString:@"Carrefour"]){
//        
//        // send local notification
//        
//        ExitNotification.alertBody = [name stringByAppendingString:messageCarrefour];
//        
//        //ExitNotification.soundName = @"Default.mp3";
//        
//        [[UIApplication sharedApplication]presentLocalNotificationNow:ExitNotification];
//        
//        
//        // Log action
//        
//        NSString *Entrymessage = @" Has exited Carrefour!";
//        
//        NSString *logmessage = [name stringByAppendingString:Entrymessage];
//        
//        NSLog(@"Recent activity: %@",logmessage);
//        
//    }
    
    
}




//Recieving notification based on state of the switch

// switch states !

-(void) viewWillAppear:(BOOL)animated{
    
    NSString *_value1 = [[NSUserDefaults standardUserDefaults]stringForKey:@"stateOfswitch1"];
    
     NSString *_value2 = [[NSUserDefaults standardUserDefaults]stringForKey:@"stateOfswitch2"];
    
     NSString *_value3 = [[NSUserDefaults standardUserDefaults]stringForKey:@"stateOfswitch3"];
    
    NSString *_value4 = [[NSUserDefaults standardUserDefaults]stringForKey:@"stateOfswitch4"];
    
    NSString *_value5 = [[NSUserDefaults standardUserDefaults]stringForKey:@"stateOfswitch5"];
    
    
    //switch 1
    if([_value1 compare:@"ON"]==NSOrderedSame){
        _switch1.on = YES;
    }else{
        _switch1.on = NO;

    }
    
    //switch 2
    if ([_value2 compare:@"ON"]==NSOrderedSame) {
        _switch2.on =YES;
    }else{
        _switch2.on =NO;

    }
    
    //switch 3
    if ([_value3 compare:@"ON"]==NSOrderedSame) {
        _switch3.on =YES;
    }else{
        _switch3.on =NO;
    }
    
    //switch 4
    if ([_value4 compare:@"ON"]==NSOrderedSame) {
        _switch4.on =YES;
    }else{
        _switch4.on =NO;
    }
    
    //switch 5
    if ([_value5 compare:@"ON"]==NSOrderedSame) {
        _switch5.on =YES;
    }else{
        _switch5.on =NO;
    }
    

    [super viewWillAppear:animated];
}




//action calls for each switch


//recieve notification for H&M?
- (IBAction)switch1state:(id)sender {
    
    NSString *value = @"ON";
    NSUserDefaults *userPref1 = [NSUserDefaults standardUserDefaults];
    
    if(!_switch1.on){
        value= @"OFF";
        [userPref1 setObject:value forKey:@"stateOfswitch1"];
        self.beaconRegion1.notifyOnEntry = NO;
        self.beaconRegion1.notifyOnExit  = NO;
        
    }else{
        self.beaconRegion1.notifyOnEntry = YES;
        self.beaconRegion1.notifyOnExit  = YES;
        
      
    }
    
   [userPref1 setObject:value forKey:@"stateOfswitch1"];


}



//recieve notification for virgin?
- (IBAction)switch2state:(id)sender {
    NSString *value = @"ON";
    NSUserDefaults *userPref2 = [NSUserDefaults standardUserDefaults];
    
    if(!_switch2.on){
        value= @"OFF";
        [userPref2 setObject:value forKey:@"stateOfswitch2"];
       // self.beaconRegion2.notifyOnEntry = NO;
       // self.beaconRegion2.notifyOnExit  = NO;
    
    }else{
       // self.beaconRegion2.notifyOnEntry = YES;
       // self.beaconRegion2.notifyOnExit  = YES;
        
      //  [self performSegueWithIdentifier:@"GoVirgin" sender:self];
    }
    
    [userPref2 setObject:value forKey:@"stateOfswitch2"];
}

- (IBAction)switch3state:(id)sender {
    NSString *value = @"ON";
    NSUserDefaults *userPref3 = [NSUserDefaults standardUserDefaults];
    
    if(!_switch3.on){
        value= @"OFF";
        [userPref3 setObject:value forKey:@"stateOfswitch3"];
        
    }
    
    [userPref3 setObject:value forKey:@"stateOfswitch3"];
}



- (IBAction)switch4state:(id)sender {
    NSString *value = @"ON";
    NSUserDefaults *userPref4 = [NSUserDefaults standardUserDefaults];
    
    if(!_switch4.on){
        value= @"OFF";
        [userPref4 setObject:value forKey:@"stateOfswitch4"];
        
    }
    
    [userPref4 setObject:value forKey:@"stateOfswitch4"];
}


//recieve notification for carrefour?
- (IBAction)switch5state:(id)sender {
    NSString *value = @"ON";
    NSUserDefaults *userPref5 = [NSUserDefaults standardUserDefaults];
    
    if(!_switch5.on){
        value= @"OFF";
        [userPref5 setObject:value forKey:@"stateOfswitch5"];
        //self.beaconRegion3.notifyOnEntry = NO;
        //self.beaconRegion3.notifyOnExit  = NO;
        
    }else{
        
        //self.beaconRegion3.notifyOnEntry = YES;
        //self.beaconRegion3.notifyOnExit  = YES;
    
        //[self performSegueWithIdentifier:@"GoCarrefour" sender:self];
        
    }
    
    [userPref5 setObject:value forKey:@"stateOfswitch5"];
}


@end
