//
//  NotificationsViewController.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/24/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <EstimoteSDK/EstimoteSDK.h>




@interface NotificationsViewController : UITableViewController<ESTBeaconManagerDelegate> {
    
}

@property (strong, nonatomic) IBOutlet UISwitch *switch1;

@property (strong, nonatomic) IBOutlet UISwitch *switch2;

@property (strong, nonatomic) IBOutlet UISwitch *switch3;

@property (strong, nonatomic) IBOutlet UISwitch *switch4;

@property (strong, nonatomic) IBOutlet UISwitch *switch5;





- (IBAction)switch1state:(id)sender;

- (IBAction)switch2state:(id)sender;

- (IBAction)switch3state:(id)sender;

- (IBAction)switch4state:(id)sender;

- (IBAction)switch5state:(id)sender;



//declaring beacons regions beacon manager

@property (nonatomic,strong) ESTBeaconManager *beaconManger;


@property (nonatomic,strong) CLBeaconRegion *beaconRegion1;
@property (nonatomic,strong) CLBeaconRegion *beaconRegion2;
@property (nonatomic,strong) CLBeaconRegion *beaconRegion3;


@property (nonatomic,strong) CLBeacon *beacon;



@end
