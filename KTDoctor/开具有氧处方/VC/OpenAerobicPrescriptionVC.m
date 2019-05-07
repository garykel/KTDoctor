//
//  OpenAerobicPrescriptionVC.m
//  KTDoctor
//
//  Created by 张敬 on 2019/4/30.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "OpenAerobicPrescriptionVC.h"
#import "OpenAerobicPrescriptionHeader.h"
#import "OpenAerobicPrescriptionFooter.h"
#import "OpenAerobicPrescriptionCell.h"
#import "KTOpenAerobicModel.h"
#import "KTOpenAerobicriptionModel.h"

@interface OpenAerobicPrescriptionVC ()<UIScrollViewDelegate>

@property (nonatomic, strong) OpenAerobicPrescriptionHeader *header;
@property (nonatomic, strong) OpenAerobicPrescriptionFooter *footer;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) KTOpenAerobicModel *model;

@end

@implementation OpenAerobicPrescriptionVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setNavView];
    [self initParams];
    [self addkeyBoardNotification];
}

- (void)setNavView
{
    self.view.backgroundColor = mBackgroudColor;
    
    //添加导航条
    self.baseNavView.navTitleLabel.text = @"开具有氧处方";
    self.baseNavView.leftNavBtn.hidden = NO;
    
    kWeakSelf(self);
    self.baseNavView.leftBlock = ^{
        [kNotificationCenter postNotificationName:kHideDropDownNotification object:nil];
        [weakself.navigationController popViewControllerAnimated:YES];
    };
}


- (void)initParams{
    
    [self createUI];
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        [kNotificationCenter postNotificationName:kHideDropDownNotification object:nil];
    }];
    [self.view addGestureRecognizer:tapGest];
}


- (void)createUI
{
    [self registerTableViewCell];
    [self.view addSubview:self.mTableView];
    self.mTableView.frame = CGRectMake(0, self.baseNavView.bottom, KScreenWidth, KScreenHeight-XXTG_SafeAreaBottomHeight);
}

#pragma mark - scrolview.delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [kNotificationCenter postNotificationName:kHideDropDownNotification object:nil];
}


#pragma mark - tableview.delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.model.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OpenAerobicPrescriptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OpenAerobicPrescriptionCell"];
    NSString *groupStr = [NSString stringWithFormat:@"第%@组", [self translationArabicNum:indexPath.row +1]];
    cell.groupLab.text = groupStr;
    cell.currentIndex = indexPath.row;
    
    
    kWeakSelf(self);
    //添加Block
    cell.addBlock = ^(NSInteger index) {
        
        KTOpenAerobicriptionModel *cellModel = [[KTOpenAerobicriptionModel alloc] init];
        [weakself.model.cells insertObject:cellModel atIndex:index];
        [weakself.mTableView reloadData];
        
        weakself.footer.groupLab.text = [NSString stringWithFormat:@"%ld", weakself.model.cells.count];

    };
    
    //删除Block
    cell.deleteBlock = ^(NSInteger index) {
        
        if (weakself.model.cells.count >1) {
            [weakself.model.cells removeObjectAtIndex:index];
            [weakself.mTableView reloadData];
            
            weakself.footer.groupLab.text = [NSString stringWithFormat:@"%ld", weakself.model.cells.count];

        }
    };
    
    return cell;
}


#pragma mark - setter and getter

- (void)registerTableViewCell{
    
    self.mTableView.mj_footer.hidden = YES;
    self.mTableView.mj_header.hidden = YES;
    self.mTableView.backgroundColor = KWhiteColor;
    self.mTableView.separatorColor = KWhiteColor;
    self.mTableView.rowHeight = [self fitSize:133];
    self.mTableView.tableHeaderView = self.header;
    self.mTableView.tableFooterView = self.footer;
    
    [self.mTableView registerClass:[OpenAerobicPrescriptionCell class] forCellReuseIdentifier:@"OpenAerobicPrescriptionCell"];
}


//header
- (OpenAerobicPrescriptionHeader *)header{
    
    if (!_header) {
        _header = [[OpenAerobicPrescriptionHeader alloc] init];
        
        //block
        kWeakSelf(self);
        _header.block = ^(KTOpenAerobicModel *model) {
            
            //训练部位
            weakself.model.trainingSiteStr = model.trainingSiteStr;
            
            //训练设备
            weakself.model.trainingEquipmentStr = model.trainingEquipmentStr;
            
            //推荐模版
            weakself.model.recommendStr = model.recommendStr;
            
            //疗程
            weakself.model.treatmentStr = model.treatmentStr;
            
            //周训练频次
            weakself.model.trainingFrequencyStr = model.trainingFrequencyStr;
            
            //运动时间点
            weakself.model.pointMotionStr = model.pointMotionStr;
            
        };
    }
    return _header;
}


//footer
- (OpenAerobicPrescriptionFooter *)footer{
    
    if (!_footer) {
        _footer = [[OpenAerobicPrescriptionFooter alloc] init];
    }
    return _footer;
}


//model
- (KTOpenAerobicModel *)model{
    
    if (!_model) {
        
        _model = [KTOpenAerobicModel new];
        for (NSInteger i = 0; i< 2; i++) {
    
            KTOpenAerobicriptionModel *cellModel = [[KTOpenAerobicriptionModel alloc] init];
            [_model.cells addObject:cellModel];
        }
        
        self.footer.groupLab.text = [NSString stringWithFormat:@"%ld", _model.cells.count];
    }
    return _model;
}


#pragma mark - notification methods

- (void)hideKeyboard
{
    [self.view endEditing:NO];
    [kNotificationCenter postNotificationName:kHideDropDownNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)aNotification{

    //当键盘升起的时候添加点击降落操作
    if (!self.tap) {
        self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:self.tap];
    }
}

- (void)keyboardWillHide:(NSNotification *)aNotification{ //当键退出时调用

    if (self.tap) {
        [self.view removeGestureRecognizer:self.tap];
        self.tap = nil;
    }
}

- (void)textFieldTextChanged:(NSNotification *)aNotification
{
    UITextField * textField = aNotification.object;
    NSString *text = textField.text;

    if (textField == self.header.useConditionsTextField) { //适用病症
        
        self.model.useConditionStr = text;
        
    }else if (textField == self.header.riskLevelTextField){//风险等级
        
        self.model.riskLevelStr = text;

    }else if (textField == self.header.deviceTypeTextField){//设备类型

        self.model.deviceTypeStr = text;
    }
    
    NSLog(@"%@, %@, %@", self.model.useConditionStr, self.model.riskLevelStr, self.model.deviceTypeStr);

}


- (void)textViewTextChanged:(NSNotification *)aNotification
{
    UITextView *textView = aNotification.object;
    NSString *text = textView.text;
    
    if (textView == self.footer.prescriptionTextView.textview) { //处方名称
        
        self.model.prescriptionNameStr = text;
        
    }else if (textView == self.footer.doctorAdviceTextView.textview){//医嘱
        
        self.model.doctorAdviceStr = text;
        
    }
    
    NSLog(@"%@, %@", self.model.prescriptionNameStr, self.model.doctorAdviceStr);
}



#pragma mark - other methods

//添加键盘通知
- (void)addkeyBoardNotification{

    [kNotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [kNotificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [kNotificationCenter addObserver:self selector:@selector(textFieldTextChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [kNotificationCenter addObserver:self selector:@selector(textViewTextChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

//移除键盘通知
- (void)removeKeyboardNotification{

    [kNotificationCenter removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [kNotificationCenter removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [kNotificationCenter removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [kNotificationCenter removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

- (void)dealloc{

    [self removeKeyboardNotification];
}
@end
