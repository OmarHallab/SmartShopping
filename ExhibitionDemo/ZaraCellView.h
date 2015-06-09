//
//  ZaraCellView.h
//  ExhibitionDemo
//
//  Created by Omar Hallab on 5/11/15.
//  Copyright (c) 2015 Primetech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZaraCellView : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *ZaraItemLabel;

@property (strong, nonatomic) IBOutlet UIImageView *CellImage;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *Spinner;

@end
