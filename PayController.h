//
//  PayController.h
//  aicaiyi
//
//  Created by 吴彬 on 15/7/29.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *payButton;

@end
