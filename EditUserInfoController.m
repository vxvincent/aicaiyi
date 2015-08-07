//
//  EditUserInfoController.m
//  aicaiyi
//
//  Created by 吴彬 on 15/6/19.
//  Copyright (c) 2015年 吴彬. All rights reserved.
//

#import "EditUserInfoController.h"
#import "EditCyhCell.h"
#import "EditIntoCell.h"
#import "EditPhotoCell.h"
#import "Config.h"
#import "ImageUtils.h"
#import "AFNetWorkTool.h"
#import "ImageLoad.h"
#import "HUDUtils.h"

static NSString * const EDITPHOTOCELLID = @"EditPhotoCell";
static NSString * const EDITCYHCELLID = @"EditCyhCell";
static NSString * const EDITINTOCELLID = @"EditIntoCell";

@interface EditUserInfoController ()
@property(nonatomic,strong) User *loginUser;
@end

@implementation EditUserInfoController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        _filepaths = [NSMutableDictionary new];
        _paramtes = [NSMutableDictionary new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginUser = [Config getLoginUserInfo];
    [self initData];
    self.navigationItem.title = @"个人信息";
    [self.tableView registerNib:[UINib nibWithNibName:EDITPHOTOCELLID bundle:nil] forCellReuseIdentifier:EDITPHOTOCELLID];
    [self.tableView registerNib:[UINib nibWithNibName:EDITCYHCELLID bundle:nil] forCellReuseIdentifier:EDITCYHCELLID];
    [self.tableView registerNib:[UINib nibWithNibName:EDITINTOCELLID bundle:nil] forCellReuseIdentifier:EDITINTOCELLID];
 
}

-(void)initData
{
    if (_loginUser) {
        [_paramtes setObject:_loginUser.username  forKey:@"username"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        EditPhotoCell *epcell = [tableView dequeueReusableCellWithIdentifier:EDITPHOTOCELLID forIndexPath:indexPath];
        if (_photoImage) {
          epcell.photoImage.image = _photoImage;
        } else if (_loginUser && _loginUser.photo){
            [ImageLoad imageLoadWithImage:epcell.photoImage withUrl:_loginUser.photo];
        }
        
        return epcell;
    } else if (indexPath.row == 1){
        EditCyhCell *eccell = [tableView dequeueReusableCellWithIdentifier:EDITCYHCELLID forIndexPath:indexPath];
        eccell.label.text = _loginUser.nickname;
        return eccell;
    } else if (indexPath.row == 2){
        EditIntoCell *eicell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELLID forIndexPath:indexPath];
        eicell.titleLabel.text = @"姓名";
        eicell.contentLabel.text = _loginUser.name;
        return eicell;
    } else if (indexPath.row == 3){
        EditIntoCell *eicell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELLID forIndexPath:indexPath];
        eicell.titleLabel.text = @"性别";
        if ([_loginUser.sex isEqualToString:@"0"]) {
            eicell.contentLabel.text = @"男";
        } else {
            eicell.contentLabel.text = @"女";
        }
        return eicell;

    } else if (indexPath.row == 4){
        EditIntoCell *eicell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELLID forIndexPath:indexPath];
        eicell.titleLabel.text = @"地区";
        eicell.contentLabel.text = _loginUser.district;
        return eicell;

    } else {
        EditIntoCell *eicell = [tableView dequeueReusableCellWithIdentifier:EDITINTOCELLID forIndexPath:indexPath];
        eicell.titleLabel.text = @"绑定手机";
        eicell.contentLabel.text = _loginUser.phone;
        return eicell;

    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:nil
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"打开图库", @"拍照",nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [ actionSheet showInView:self.view];
    } else if (indexPath.row == 1){
        CourseNameController *cnc = [CourseNameController new];
        cnc.navigationItem.title = @"才艺号";
        [cnc addCourseNameBlock:^(NSString *name) {
            [_paramtes setObject:name forKey:@"nickname"];
            [self editInfoHttp];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    } else if(indexPath.row == 2){
        CourseNameController *cnc = [CourseNameController new];
        cnc.navigationItem.title = @"姓名";
        [cnc addCourseNameBlock:^(NSString *name) {
            [_paramtes setObject:name forKey:@"name"];
            [self editInfoHttp];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    } else if(indexPath.row == 3){
        CourseCategory *cc = [CourseCategory new];
        cc.navigationItem.title = @"性别";
        cc.category = @[@"男",@"女"];
        [cc addCourseCategoryBlock:^(NSInteger cc) {
            [_paramtes setObject:[NSString stringWithFormat:@"%ld",cc] forKey:@"sex"];
        }];
        [self.navigationController pushViewController:cc animated:YES];
    } else if (indexPath.row == 4){
        CourseNameController *cnc = [CourseNameController new];
        cnc.navigationItem.title = @"地区";
        [cnc addCourseNameBlock:^(NSString *name) {
            [_paramtes setObject:name forKey:@"address"];
            [self editInfoHttp];
        }];
        [self.navigationController pushViewController:cnc animated:YES];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 60;
    }
    return 44;

}
#pragma mark - ActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
  
    NSInteger sourceType;
    if (buttonIndex == 2)
        return ;
    
    switch (buttonIndex) {
        case 0:
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        case 1:
            sourceType = UIImagePickerControllerSourceTypeCamera;
        default:
            break;
    }
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    [self presentViewController:imagePickerController animated:YES completion:nil];
 
    
}

#pragma  mark - UIImagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *photoImage = [info objectForKey:UIImagePickerControllerEditedImage];
    //NSData *imageData = UIImageJPEGRepresentation(photoImage,0.05);
    NSData *imageData = UIImageJPEGRepresentation(photoImage,0.4);

    _photoImage = [UIImage imageWithData:imageData];
    
    // 如果是相机拍照的，保存在本地
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        UIImageWriteToSavedPhotosAlbum(photoImage, nil, nil, nil);
    }
    NSString *path = [ImageUtils saveImage:_photoImage withName:[NSString stringWithFormat:@"%@%@",[NSDate date],@".png"]];
    [_filepaths setObject:path forKey:@"photo"];
    [self editInfoHttp];
       //局部刷新
    NSIndexPath *te=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:te,nil] withRowAnimation:UITableViewRowAnimationMiddle];
    
}

///上传修改信息
-(void)editInfoHttp{
    
    MBProgressHUD *hud = [HUDUtils createHUD];
    hud.labelText = @"正在上传";
    [AFNetWorkTool PostWithUrl:[NSString stringWithFormat:@"%@%@",BASE_URL,@"m=user&a=edit"] parameters:_paramtes filePaths:_filepaths success:^(NSDictionary *dic) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"上传成功";
        _loginUser = [[User alloc] initWithDictionary:dic withPassword:_loginUser.password];
        [Config saveLoginUserInfo:_loginUser];
        [hud hide:YES afterDelay:1];
        [self.tableView reloadData];

    } fail:^(NSString *message) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"上传失败";
        [hud hide:YES afterDelay:1];
    } error:^(NSError *e) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"请检查网络";
        [hud hide:YES afterDelay:1];
    }];
    
}


@end
