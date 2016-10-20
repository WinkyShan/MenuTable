//
//  ViewController.m
//  MenuTable
//
//  Created by mac on 16/10/18.
//  Copyright © 2016年 shanshan. All rights reserved.
//

#import "ViewController.h"
#import "UserModel.h"
#import "WSSMenuTable.h"

@interface ViewController ()<WSSMenuTableDelegate>

@property (nonatomic, strong) WSSMenuTable *wssMenuTable;

@property (nonatomic, strong) NSMutableArray *singleDataArray;
@property (nonatomic, strong) NSMutableArray *singArray;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UIButton *btn1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    self.view.backgroundColor = [UIColor redColor];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 20)];
    self.label.text = @"小明";
    self.label.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 200, 20);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
     btn.selected = NO;
    self.btn = btn;
   
    [self.view addSubview:btn];
    
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(110, 100, 100, 20)];
    self.label1.text = @"小红";
    self.label1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.label1];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(110, 100, 100, 20);
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    btn1.selected = NO;
    self.btn1 = btn1;
    [self.view addSubview:btn1];

    
    
    
    for (int i=0; i<10; i++) {
        UserModel *userModel = [[UserModel alloc]init];
        userModel.name = [NSString stringWithFormat:@"小红%d",i];
        userModel.id = [NSString stringWithFormat:@"10%d",i];
        userModel.gender = @"男";
        [self.singArray addObject:userModel];
    }
    
    
    
    for (int i=0; i<10; i++) {
        UserModel *userModel = [[UserModel alloc]init];
        userModel.name = [NSString stringWithFormat:@"小明%d",i];
        userModel.id = [NSString stringWithFormat:@"10%d",i];
        userModel.gender = @"男";
        [self.singleDataArray addObject:userModel];
    }
    
    self.wssMenuTable = [WSSMenuTable show:CGPointMake(0, 120) andHeight:1];
    self.wssMenuTable.delegate = self;
    self.wssMenuTable.titleMenuArray = @[@"小明",@"小红"];
    [self.view addSubview:self.wssMenuTable];
    
}

-(void)btnClick{
    
    self.btn.selected = !self.btn.selected;
    if (self.btn.selected == YES) {
        self.btn1.selected = NO;

    }else{

    }
    
    self.wssMenuTable.currrntSelectedColumn = 1100;
    self.wssMenuTable.singleDataArray = self.singleDataArray;
    
    [self.wssMenuTable tableViewWithOption:1 animation:self.btn.selected];
    
}

-(void)btn1Click{
    
    self.btn1.selected = !self.btn1.selected;

    if (self.btn1.selected == YES) {
        //        [self.menuTable hideMenuTable];
        self.btn.selected = NO;
//        [self.wssMenuTable hideMenuTable];
    }
    self.wssMenuTable.currrntSelectedColumn = 1101;
    self.wssMenuTable.singleDataArray = self.singArray;
    
    
    [self.wssMenuTable tableViewWithOption:2 animation:self.btn1.selected];
//
}


-(NSMutableArray *)singleDataArray{
    if (!_singleDataArray) {
        _singleDataArray = [NSMutableArray array];
    }
    return _singleDataArray;
}

-(NSMutableArray *)singArray{
    if (!_singArray) {
        _singArray = [NSMutableArray array];
    }
    return _singArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark-MenuTableDelegate

-(NSString *)showRowDataWithView:(WSSMenuTable *)menuTable AtIndex:(NSIndexPath *)indexPath{
    UserModel *user = menuTable.singleDataArray[indexPath.row];
    return user.name;
}

-(void)didSelectRowWithView:(WSSMenuTable *)menuTable AtIndexPath:(NSIndexPath *)indexPath withSeletOption:(NSInteger)selectOption{
    
    self.btn.selected = NO;
    self.btn1.selected = NO;
    if (selectOption == 1) {
        UserModel *user = menuTable.singleDataArray[indexPath.row];
        self.label.text = user.name;
    }else if (selectOption == 2){
        UserModel *user = menuTable.singleDataArray[indexPath.row];
        self.label1.text = user.name;
    }
}

-(void)didHide{
    self.btn.selected = NO;
    self.btn1.selected = NO;
}
@end
