//
//  ClassTableCollection.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/15.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "ClassTableCollection.h"
#import "ClassCollectionCell.h"
#import "LabelCollectionCell.h"

static NSString * const CLASSCOLLECTIONCELL = @"ClassCollectionCell";
static NSString * const CLASSLABEL = @"LabelCollectionCell";
@interface ClassTableCollection ()


@end

@implementation ClassTableCollection


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerClass:[ClassCollectionCell class] forCellWithReuseIdentifier:CLASSCOLLECTIONCELL];
        [self registerClass:[LabelCollectionCell class] forCellWithReuseIdentifier:CLASSLABEL];
        self.delegate = self;
        self.dataSource = self;
        _width = 30;
        _height = 30;
        _left = (frame.size.width - _width*7)/14;
        _right =(frame.size.width - _width*7)/14;
        _top =(frame.size.width - _width*7)/14;
        _bottom = 0;
    }

    _data = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",
             @"0",@"0",@"0",@"0",@"0",@"0",@"0",
             @"0",@"0",@"0",@"0",@"0",@"0",@"0",
            nil];
    return self;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (indexPath.section == 0) {
        LabelCollectionCell *cell = [self dequeueReusableCellWithReuseIdentifier:CLASSLABEL forIndexPath:indexPath];
//        LabelCollectionCell *cell = [[LabelCollectionCell alloc]init];
        return cell;
    } else {
        ClassCollectionCell *cell = [self dequeueReusableCellWithReuseIdentifier:CLASSCOLLECTIONCELL forIndexPath:indexPath];
        if (cell.isSelected) {
            cell.image.image = [UIImage imageNamed:@"class_right"];
        } else {
            if (indexPath.row <= 6) {
                if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                    cell.image.image = [UIImage imageNamed:@"shang_w"];
                } else if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"1"]){
                    cell.image.image = [UIImage imageNamed:@"shang_y"];
                } else {
                    cell.image.image = [UIImage imageNamed:@"shang_g"];
                }
                cell.tag = 0;
              
            } else if (indexPath.row >= 7 && indexPath.row <= 13){
                if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                    cell.image.image = [UIImage imageNamed:@"xia_w"];
                } else if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"1"]){
                    cell.image.image = [UIImage imageNamed:@"xia_y"];
                } else {
                    cell.image.image = [UIImage imageNamed:@"xia_g"];
                }
                cell.tag = 0;
            } else {
                if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
                    cell.image.image = [UIImage imageNamed:@"wan_w"];
                } else if ([[_data objectAtIndex:indexPath.row] isEqualToString:@"1"]){
                    cell.image.image = [UIImage imageNamed:@"wan_y"];
                } else {
                    cell.image.image = [UIImage imageNamed:@"wan_g"];
                }
                cell.tag = 0;
            }
            
        }
        return cell;

    
    }
   
    

}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1) {
         return 21;
    }
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return CGSizeMake(self.frame.size.width, _height);
    }
    return CGSizeMake(_width, _height);
}


//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(_top, _left, _bottom, _right);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ;
    }
    ClassCollectionCell *cell = (ClassCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.tag == 0) {
        cell.tag = 1;
        cell.image.image = [UIImage imageNamed:@"class_right"];
        [_data replaceObjectAtIndex:indexPath.row withObject:@"1"];
    } else {
        cell.tag = 0;
        if (indexPath.row <= 6) {
            cell.image.image = [UIImage imageNamed:@"shang_w"];
            
        } else if (indexPath.row >= 7 && indexPath.row <= 13){
            cell.image.image = [UIImage imageNamed:@"xia_w"];
        } else {
            cell.image.image = [UIImage imageNamed:@"wan_w"];
        }
        [_data replaceObjectAtIndex:indexPath.row withObject:@"0"];

    }
    if (_classTabelDelegate) {
        //课程表代理
        NSString *result = @"";
        for (int i = 0; i < [_data count]; i ++) {
            if (i == 0) {
                result = [NSString stringWithFormat:@"%@,",_data[i]];
            } else if (i == [_data count] - 1) {
                result = [NSString stringWithFormat:@"%@%@",result,_data[i]];
            } else {
                result = [NSString stringWithFormat:@"%@%@,",result,_data[i]];
            }
      
        }
        [_classTabelDelegate setSelectedClass:indexPath result:result];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (_isGroup) {
        return ;
    }
    if (indexPath.section == 0) {
        return ;
    }
    [_data replaceObjectAtIndex:indexPath.row withObject:@"0"];
    ClassCollectionCell *cell = (ClassCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (indexPath.row <= 6) {
        cell.image.image = [UIImage imageNamed:@"shang_w"];
        
    } else if (indexPath.row >= 7 && indexPath.row <= 13){
        cell.image.image = [UIImage imageNamed:@"xia_w"];
    } else {
        cell.image.image = [UIImage imageNamed:@"wan_w"];
    }

}

-(CGFloat)getHeight
{
    return _height*4 + 5*_top;

}

-(void)initDataWithArray:(NSMutableArray *)data
{
    _data = data;
}
@end
