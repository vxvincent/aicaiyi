//
//  MyClassController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "MyClassController.h"
static NSString *allclasscell = @"AllClassTableCell";
static NSString *classinofocell = @"ClassInfoCell";
@interface MyClassController ()

@end

@implementation MyClassController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[AllClassTableCell class] forCellReuseIdentifier:allclasscell];
    [self.tableView registerNib:[UINib nibWithNibName:classinofocell bundle:nil ]forCellReuseIdentifier:classinofocell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

 
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    } else {
        return 2;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        AllClassTableCell *cellAll = [self.tableView dequeueReusableCellWithIdentifier:allclasscell];
        [cellAll sizeToFit];
        return cellAll;
    } else {
        ClassInfoCell  *cellInfo =  [self.tableView dequeueReusableCellWithIdentifier:classinofocell forIndexPath:indexPath];
        return cellInfo;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [AllClassTableCell getHeight];
    } else {
        return [ClassInfoCell getHeight];
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.1;
    } else {
        return 40;
    }
}



@end
