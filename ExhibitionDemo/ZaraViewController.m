//
//  ZaraViewController.m
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/11/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import "ZaraViewController.h"



@interface ZaraViewController () 


@end

@implementation ZaraViewController

@synthesize  ZaraTable;


- (void)viewDidLoad {
    [self retreiveFromParse];
    [super viewDidLoad];
    
    
    [scroller setScrollEnabled:YES];
    [scroller setContentSize:CGSizeMake(320, 624)];

}



// Parse Part


//Query from parse table ZaraTableView
-(void) retreiveFromParse {
    
    
    
    
    //PFQuery *retrieveCellData =  [PFQuery queryWithClassName:@"ZaraTableView"];
    
    PFQuery *retrieveOffers = [PFQuery queryWithClassName:@"Offers"];
    
    // Here just change the objectId to match the store id
    [retrieveOffers whereKey:@"user" equalTo:[PFObject objectWithoutDataWithClassName:@"_User" objectId:@"m4qt3oEzNW"]];
    
    

    [retrieveOffers findObjectsInBackgroundWithBlock:^(NSArray *objects , NSError *error){
        if(!error){

            availableItems = [[NSArray alloc]initWithArray:objects];
            
            [ZaraTable reloadData];
        }
    
        
    }];

    
}

//get number of sections in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of folders
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return availableItems.count;
}


//set up cell in table view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ZaraItem";
    ZaraCellView *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    // get data from itemsAvailable store in tempObject
   PFObject *tempObject = [availableItems objectAtIndex:indexPath.row];
    
    cell.ZaraItemLabel.text = [tempObject objectForKey:@"offerName"];
    
    
    //get data from imageFile and store in imageObject
    PFObject *imageObject= [availableItems objectAtIndex:indexPath.row];
    
    PFFile *imageFile = [imageObject objectForKey:@"image"];
    
    cell.Spinner.hidden = NO;
    [cell.Spinner startAnimating];
    
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        
        if(!error){
            cell.CellImage.image = [UIImage imageWithData:data];
            [cell.Spinner stopAnimating];
            cell.Spinner.hidden = YES;
    
        }
        
    }];

   return cell;
    
}


// user selects cell
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   // NSLog(@"Cell tapped");
    PFObject *tempObject = [availableItems objectAtIndex:indexPath.row];
  //  NSLog(@"%@", tempObject.objectId);
    
    
    _itemDetail.text = [tempObject objectForKey:@"description"];

    [self animateDetailView];
    
    PFObject *imageObject= [availableItems objectAtIndex:indexPath.row];
    
    PFFile *imageFile = [imageObject objectForKey:@"image"];
    

    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        
        if(!error){
        _LargeImage.image = [UIImage imageWithData:data];
   
        }
        
    }];
    
    

    
}



-(void)animateDetailView{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _detailView.frame = CGRectMake(0, 0, 320, 624);
    }];
    
    
}



- (IBAction)backAction:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        
        _detailView.frame = CGRectMake(320, 624, 320, 624);
    }];
    
}
@end
