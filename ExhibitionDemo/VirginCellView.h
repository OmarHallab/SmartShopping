//
//  VirginCellView.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/18/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VirginCellView : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *VirginItemLabel;

@property (strong, nonatomic) IBOutlet UIImageView *CellImage;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Spinner;

@end
