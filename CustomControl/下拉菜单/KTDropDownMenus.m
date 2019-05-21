//
//  XXTGDropDownMenus.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/7/6.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "KTDropDownMenus.h"
#import "KTDropDownTableViewCell.h"


static float AnimateTime = 0.25f;  // 下拉动画时间
#define gap 13

@interface KTDropDownMenus ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *listView;   // 尖头图标
@property (nonatomic, assign) BOOL isHiddenBtn;

@end

@implementation KTDropDownMenus

//MARK: - LifeCycle Methods
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = KWhiteColor;
        
        [self addSubview:self.dropDownImage];
        [self addSubview:self.mainBtn];
        
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _mainBtn.frame = self.bounds;
    
    kWeakSelf(self);
    [_dropDownImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo([weakself fitSize:8]);
        make.height.mas_equalTo([weakself fitSize:5]);
        make.right.equalTo(weakself.mas_right).offset(-[weakself fitSize:10]);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    
    [self addShadowAndCircleCorner:self.layer corner:5];

}



//MARK:  - Response Methods
- (void)clickMainBtn :(UIButton *)sender
{
    [self.window addSubview:self.listView]; // 将下拉视图添加到控件的俯视图上
  
    if (!_mainBtn.selected) {
        
        [self showCityList];
    }else{
        
        [self hiddenCityList];
    }
    [self.delegate dropdownMenu:self mainBtnClick:sender];
}

- (void)showCityList
{
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuWillShow:)]) {
        [self.delegate dropdownMenuWillShow:self]; // 将要显示回调代理
    }
    
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:AnimateTime animations:^{
        
        weakself.dropDownImage.transform = CGAffineTransformMakeRotation(M_PI);
        
        
        CGFloat aimsH = weakself.titles.count *weakself.dropdownHeight > 300 ? 300 :weakself.titles.count *weakself.dropdownHeight + [self fitSize:8];
        CGRect rc = CGRectMake(0,
                               weakself.mainBtn.bottom,
                               weakself.bounds.size.width,
                               aimsH);
        

        weakself.mTableView.hidden = NO;
        weakself.listView.frame = [self.window convertRect:rc fromView:self] ;
        weakself.mTableView.frame = CGRectMake(0, 0, weakself.bounds.size.width, weakself.listView.bounds.size.height);

    }completion:^(BOOL finished) {
        
        if ([weakself.delegate respondsToSelector:@selector(dropdownMenuDidShow:)]) {
            [weakself.delegate dropdownMenuDidShow:weakself]; // 已经显示回调代理
        }
    }];
    
    _mainBtn.selected = YES;
}


- (void)hiddenCityList
{
    if ([self.delegate respondsToSelector:@selector(dropdownMenuWillHidden:)]) {
        [self.delegate dropdownMenuWillHidden:self]; // 将要隐藏回调代理
    }
    
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:AnimateTime  animations:^{
        
        weakself.dropDownImage.transform = CGAffineTransformIdentity;
        
        CGRect rc = CGRectMake(0, weakself.mainBtn.bottom, weakself.bounds.size.width, 0);
        weakself.listView.frame = [self.window convertRect:rc fromView:self] ;
        weakself.mTableView.frame = CGRectMake(0, 0, weakself.bounds.size.width, 0);
        
        weakself.mTableView.hidden = YES;
        
        
    }completion:^(BOOL finished) {
        
        if ([weakself.delegate respondsToSelector:@selector(dropdownMenuDidHidden:)]) {
            [weakself.delegate dropdownMenuDidHidden:weakself]; // 已经隐藏回调代理
        }
    }];
    
    _mainBtn.selected = NO;
}


//MARK: -  UITableViewDataSource Methods
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _dropdownHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KTDropDownTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.backgroundColor = KWhiteColor;
    cell.cityLabel.text = self.titles[indexPath.row];
    
    if (indexPath.row == 0) {
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = mDefindColor;
        line.frame = CGRectMake(0, 0, self.bounds.size.width, 1);
        [cell addSubview:line];

    }
    return cell;
}


//MARK: -  UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownMenu:selectedCellStr:)]) {
        
        NSString *aimsStr = _titles[indexPath.row];
        [_mainBtn setTitle:aimsStr forState:UIControlStateNormal];
        [_mainBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [self.delegate dropdownMenu:self selectedCellStr:_titles[indexPath.row]];
        [self hiddenCityList];
    }
}

//MARK: - Setter and Getter Methods
- (void)setTitles:(NSArray *)cityLists
{
    if (_titles != cityLists) {
        _titles = cityLists;
    }
//    if (cityLists.count > 0) {
//        [_mTableView reloadData];
//
//        NSDictionary *dic = _titles[0];
//        NSString *string =  [self checkIsOpenLocationFoundation] ?dic[@"title"] :@"10";
//
//        [_mainBtn setTitle:string forState:UIControlStateNormal];
//    }
}


- (void)setDefualtStr:(NSString *)defualtStr{
    
    [_mainBtn setTitle:defualtStr forState:UIControlStateNormal];
//    [_mainBtn setTitleColor:RGB(200, 200, 200) forState:UIControlStateNormal];
    [_mainBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


- (BOOL)checkIsOpenLocationFoundation //检测是否开启定位功能
{
    BOOL isOpen = NO;
    BOOL enable = [CLLocationManager locationServicesEnabled];
    NSInteger status = [CLLocationManager authorizationStatus];
    if(!enable || status < 3) {
        
    }else {
        isOpen = YES;
    }
    
    return isOpen;
}

- (void)setDropdownHeight:(float)dropdownHeight
{
    if (_dropdownHeight != dropdownHeight) {
        _dropdownHeight = dropdownHeight;
    }
    
    if (dropdownHeight > 0.0 && _titles.count >0) {
        [_mTableView reloadData];
    }
}

- (UIButton *)mainBtn
{
    if (!_mainBtn) {
        _mainBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_mainBtn setTitleColor:UIColorFromRGB(0x3333333) forState:UIControlStateNormal];
        [_mainBtn addTarget:self action:@selector(clickMainBtn:) forControlEvents:UIControlEventTouchUpInside];
        _mainBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _mainBtn.titleLabel.font = mFont([self fitSize:13]);
        _mainBtn.titleLabel.lineBreakMode =  NSLineBreakByTruncatingTail;
        _mainBtn.titleEdgeInsets = UIEdgeInsetsMake(0, [self fitSize:5], 0, 20);
        _mainBtn.selected = NO;
        //_mainBtn.backgroundColor = KWhiteColor;
        
        //设置边框的颜色
        [_mainBtn.layer setBorderColor:mDefindColor.CGColor];

        //设置边框的粗细
        [_mainBtn.layer setBorderWidth:2.0];

        //设置圆角的半径
        [_mainBtn.layer setCornerRadius:5];

        //切割超出圆角范围的子视图
        _mainBtn.layer.masksToBounds = YES;

    }
    return _mainBtn;
}

- (UIImageView *)dropDownImage
{
    if (!_dropDownImage) {
        _dropDownImage = [[UIImageView alloc] init];
        _dropDownImage.image = [UIImage imageNamed:@"dropdownMenu"];
        _dropDownImage.userInteractionEnabled = YES;
    }
    return _dropDownImage;
}

- (UIView *)listView
{
    if (!_listView) {
        _listView = [[UIView alloc] init];
        CGRect rc = CGRectMake(0, self.mainBtn.bottom, self.bounds.size.width, 0);
       _listView.frame = [self.window convertRect:rc fromView:self] ;
        _listView.backgroundColor = KClearColor;
        [_listView addSubview:self.mTableView];
    }
    return _listView;
}


- (UITableView *)mTableView
{
    if (!_mTableView) {
        
        _mTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mTableView.frame = CGRectMake(0, 0, self.bounds.size.width, 0);

        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        _mTableView.backgroundColor = [UIColor clearColor];
        _mTableView.separatorColor = mDefindColor;
        _mTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _mTableView.tableFooterView.backgroundColor = self.backgroundColor;
        _mTableView.showsVerticalScrollIndicator = NO;
        
        //设置边框的颜色
//        [_mTableView.layer setBorderColor:mDefindColor.CGColor];
        
        //设置边框的粗细
//        [_mTableView.layer setBorderWidth:1.0];
        
        //设置圆角的半径
        [_mTableView.layer setCornerRadius:5];
        
        //切割超出圆角范围的子视图
        _mTableView.layer.masksToBounds = YES;
        
        float lineH = [self fitSize:0.5];
//        float offset = self.bounds.size.width/4;
//
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, lineH)];
        line.backgroundColor = mDefindColor;
//
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, lineH)];
//        [path addLineToPoint:CGPointMake(offset*3.1, lineH)];
//        [path addLineToPoint:CGPointMake(offset*3.3, 0)];
//        [path addLineToPoint:CGPointMake(offset*3.5, lineH)];
//        [path closePath];
//
//        CAShapeLayer *mask = [CAShapeLayer layer];
//        mask.path = path.CGPath;
//        line.layer.mask = mask;
        
    
        [_mTableView setTableHeaderView:line];
        
        [_mTableView registerClass:[KTDropDownTableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        if ([_mTableView respondsToSelector:@selector(setSeparatorInset:)]){
            [_mTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_mTableView respondsToSelector:@selector(setLayoutMargins:)]){
            [_mTableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return _mTableView;
}

@end
