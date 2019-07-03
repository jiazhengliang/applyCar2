//
//  SignListNameCell.m
//  ZhongTou
//
//  Created by Jone on 2017/11/6.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "SignListNameCell.h"

@interface SignListNameCell()
{
    BOOL didSetupConstraints;
}

@property (nonatomic, strong) UIView *lineView0;

//标题 姓名
@property (nonatomic, strong) UILabel *titleLabel;
//图片
//子标题
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIView *lineView;


//标题 身份证
@property (nonatomic, strong) UILabel *idLabel;

@property (nonatomic, strong) UILabel *idDetailLabel;

@property (nonatomic, strong) UIView *lineView1;


//标题 phone
@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UILabel *phoneDetailLabel;

@property (nonatomic, strong) UIView *lineView2;

//标题 银行卡号
@property (nonatomic, strong) UILabel *bankLabel;

@property (nonatomic, strong) UILabel *bankDetailLabel;

@property (nonatomic, strong) UIView *lineView3;

//标题 银行卡号
@property (nonatomic, strong) UILabel *stateLabel;

@property (nonatomic, strong) UILabel *stateDetailLabel;

@property (nonatomic, strong) UIView *lineView4;
//标题 银行卡号
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *timeDetailLabel;

@property (nonatomic, strong) UIView *lineView5;

@end
@implementation SignListNameCell

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel newAutoLayoutView];
        _titleLabel.textColor = titleBuyDetail;
        _titleLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _titleLabel;
}

-(UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [UILabel newAutoLayoutView];
        _detailLabel.textColor = titleMeColor;
        _detailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _detailLabel;
    
}


-(UIView *)lineView0
{
    if (!_lineView0) {
        _lineView0 = [UIView newAutoLayoutView];
        _lineView0.backgroundColor = tableCellLineColor;
    }
    return _lineView0;
}


-(UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView newAutoLayoutView];
        _lineView.backgroundColor = tableCellLineColor;
    }
    return _lineView;
}

-(UILabel *)idLabel{
    if (!_idLabel) {
        _idLabel = [UILabel newAutoLayoutView];
        _idLabel.textColor = titleBuyDetail;
        _idLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _idLabel.textAlignment = NSTextAlignmentLeft;
        _idLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _idLabel;
}

-(UILabel *)idDetailLabel
{
    if (!_idDetailLabel) {
        _idDetailLabel = [UILabel newAutoLayoutView];
        _idDetailLabel.textColor = titleMeColor;
        _idDetailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _idDetailLabel.textAlignment = NSTextAlignmentRight;
        _idDetailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _idDetailLabel;
    
}



-(UIView *)lineView1
{
    if (!_lineView1) {
        _lineView1 = [UIView newAutoLayoutView];
        _lineView1.backgroundColor = tableCellLineColor;
    }
    return _lineView1;
}


-(UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [UILabel newAutoLayoutView];
        _phoneLabel.textColor = titleBuyDetail;
        _phoneLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _phoneLabel.textAlignment = NSTextAlignmentLeft;
        _phoneLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _phoneLabel;
}

-(UILabel *)phoneDetailLabel
{
    if (!_phoneDetailLabel) {
        _phoneDetailLabel = [UILabel newAutoLayoutView];
        _phoneDetailLabel.textColor = titleMeColor;
        _phoneDetailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _phoneDetailLabel.textAlignment = NSTextAlignmentRight;
        _phoneDetailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _phoneDetailLabel;
    
}



-(UIView *)lineView2
{
    if (!_lineView2) {
        _lineView2 = [UIView newAutoLayoutView];
        _lineView2.backgroundColor = tableCellLineColor;
    }
    return _lineView2;
}

-(UILabel *)bankLabel{
    if (!_bankLabel) {
        _bankLabel = [UILabel newAutoLayoutView];
        _bankLabel.textColor = titleBuyDetail;
        _bankLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _bankLabel.textAlignment = NSTextAlignmentLeft;
        _bankLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _bankLabel;
}

-(UILabel *)bankDetailLabel
{
    if (!_bankDetailLabel) {
        _bankDetailLabel = [UILabel newAutoLayoutView];
        _bankDetailLabel.textColor = titleMeColor;
        _bankDetailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _bankDetailLabel.textAlignment = NSTextAlignmentRight;
        _bankDetailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _bankDetailLabel;
    
}



-(UIView *)lineView3
{
    if (!_lineView3) {
        _lineView3 = [UIView newAutoLayoutView];
        _lineView3.backgroundColor = tableCellLineColor;
    }
    return _lineView3;
}


-(UILabel *)stateLabel{
    if (!_stateLabel) {
        _stateLabel = [UILabel newAutoLayoutView];
        _stateLabel.textColor = titleMeColor;
        _stateLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _stateLabel.textAlignment = NSTextAlignmentLeft;
        _stateLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _stateLabel;
}

-(UILabel *)stateDetailLabel
{
    if (!_stateDetailLabel) {
        _stateDetailLabel = [UILabel newAutoLayoutView];
        _stateDetailLabel.textColor = titleMeColor;
        _stateDetailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _stateDetailLabel.textAlignment = NSTextAlignmentRight;
        _stateDetailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _stateDetailLabel;
    
}



-(UIView *)lineView4
{
    if (!_lineView4) {
        _lineView4 = [UIView newAutoLayoutView];
        _lineView4.backgroundColor = tableCellLineColor;
    }
    return _lineView4;
}


-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel newAutoLayoutView];
        _timeLabel.textColor = titleBuyDetail;
        _timeLabel.font =[UIFont fontWithName:fontPingFang size:12*KWIDTH];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _timeLabel;
}

-(UILabel *)timeDetailLabel
{
    if (!_timeDetailLabel) {
        _timeDetailLabel = [UILabel newAutoLayoutView];
        _timeDetailLabel.textColor = titleMeColor;
        _timeDetailLabel.font =[UIFont fontWithName:fontPingFang size:13*KWIDTH];
        _timeDetailLabel.textAlignment = NSTextAlignmentRight;
        _timeDetailLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _timeDetailLabel;
    
}



-(UIView *)lineView5
{
    if (!_lineView5) {
        _lineView5 = [UIView newAutoLayoutView];
        _lineView5.backgroundColor = tableCellLineColor;
    }
    return _lineView5;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lineView0];

        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.
         lineView];
        [self.contentView addSubview:self.detailLabel];
        
        [self.contentView addSubview:self.idLabel];
        [self.contentView addSubview:self.
         lineView1];
        [self.contentView addSubview:self.idDetailLabel];
        
        [self.contentView addSubview:self.phoneLabel];
        [self.contentView addSubview:self.
         lineView2];
        [self.contentView addSubview:self.phoneDetailLabel];
        
        [self.contentView addSubview:self.bankDetailLabel];
        [self.contentView addSubview:self.
         lineView3];
        [self.contentView addSubview:self.bankLabel];
        
        [self.contentView addSubview:self.stateDetailLabel];
        [self.contentView addSubview:self.
         lineView4];
        [self.contentView addSubview:self.stateLabel];
        
        [self.contentView addSubview:self.timeLabel];
        
//        [self.contentView addSubview:self.
//         lineView5];
        [self.contentView addSubview:self.timeDetailLabel];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    if (!didSetupConstraints) {

        //姓名
        [self.lineView0 autoPinEdgeToSuperviewEdge:ALEdgeTop];
        
        [self.lineView0 autoPinEdgeToSuperviewEdge:ALEdgeLeft];

        [self.lineView0 autoSetDimensionsToSize:CGSizeMake(screen_width, 11*KWIDTH)];

        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:14*KWIDTH];
        
        [self.titleLabel autoSetDimensionsToSize:CGSizeMake(100*KWIDTH, 25*KWIDTH)];
        [self.detailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.detailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.titleLabel];
        [self.detailLabel autoSetDimensionsToSize:CGSizeMake(180*KWIDTH, 25*KWIDTH)];
        
        [self.lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.detailLabel withOffset:5*KWIDTH];
        
        [self.lineView autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
//        身份证
        [self.idLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.idLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView withOffset:5];
        
        [self.idLabel autoSetDimensionsToSize:CGSizeMake(100*KWIDTH, 25*KWIDTH)];
        [self.idDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.idDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.idLabel];
        [self.idDetailLabel autoSetDimensionsToSize:CGSizeMake(250*KWIDTH, 25*KWIDTH)];
        
        [self.lineView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.idDetailLabel withOffset:5*KWIDTH];
        
        [self.lineView1 autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
//        电话号码
        
        [self.phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.phoneLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView1 withOffset:5*KWIDTH];
        
        [self.phoneLabel autoSetDimensionsToSize:CGSizeMake(60*KWIDTH, 25*KWIDTH)];
        [self.phoneDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.phoneDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.phoneLabel];
        [self.phoneDetailLabel autoSetDimensionsToSize:CGSizeMake(200*KWIDTH, 25*KWIDTH)];
        
        [self.lineView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.phoneDetailLabel withOffset:5];
        
        [self.lineView2 autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
//        银行卡
        
        [self.bankLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.bankLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView2 withOffset:5];
        
        [self.bankLabel autoSetDimensionsToSize:CGSizeMake(60*KWIDTH, 33*KWIDTH)];
        
        [self.bankDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.bankDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.bankLabel];
        [self.bankDetailLabel autoSetDimensionsToSize:CGSizeMake(200*KWIDTH, 25*KWIDTH)];
        
        [self.lineView3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.bankDetailLabel withOffset:5];
        
        [self.lineView3 autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
        
//        状态
        [self.stateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.stateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView3 withOffset:5*KWIDTH];
        [self.stateLabel autoSetDimensionsToSize:CGSizeMake(60*KWIDTH, 33*KWIDTH)];
        
        [self.stateDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.stateDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.stateLabel];
        [self.stateDetailLabel autoSetDimensionsToSize:CGSizeMake(200*KWIDTH, 25*KWIDTH)];
        
        
        [self.lineView4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.stateDetailLabel withOffset:5*KWIDTH];
        
        [self.lineView4 autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
//
//        申请时间
        [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25*KWIDTH];
        [self.timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineView4 withOffset:5*KWIDTH];
        [self.timeLabel autoSetDimensionsToSize:CGSizeMake(60*KWIDTH, 33*KWIDTH)];
        
        [self.timeDetailLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25*KWIDTH];
        [self.timeDetailLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.timeLabel];
        [self.timeDetailLabel autoSetDimensionsToSize:CGSizeMake(200*KWIDTH, 25*KWIDTH)];
        
//        [self.lineView5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeDetailLabel withOffset:5*KWIDTH];
//        
//        [self.lineView5 autoSetDimensionsToSize:CGSizeMake(screen_width, 1)];
//
        didSetupConstraints=YES;
    }
}


/*
 -3 ： 支付未成功（地采）
 
 -2：审核不通过
 
 -1：关闭
 
 0：待审核
 
 1：审核通过（待客户录入车辆）
 
 2：待客户资料录入(客户已提交车辆信息)
 
 3 ： 支付成功（地采）
 
 n0 ：待签约
 
 n1 :签约完成(集采)
 
 n7:   客户在线提车确认（待提车）
 
 n71: 地采待提车
 
 n8:   结束

 p3: 签约完成后准备支付(集采)
 
 n71dc_10061 财务全款支付
 
 dc_1007 地采采购发车确认
 
 dc_1008
 
 n7dc_1009
 
  z71  待提车 集采
 */

-(void)fillCellWithModel:(ApplyListModel *)model
{
    if ([model.auditStatus isEqualToString:@"0"]||[model.auditStatus isEqualToString:@"1"]||([model.auditStatus isEqualToString:@"-1"]&&model.carBrand.length==0)||([model.auditStatus isEqualToString:@"-2"]&&model.carBrand.length==0)) {
        self.titleLabel.text = @"姓名";
        self.idLabel.text = @"身份证";
        self.phoneLabel.text = @"银行卡";
        self.bankLabel.text = @"状态";
        self.stateLabel.text = @"申请时间";
        self.timeLabel.text = @"机构代码";
        self.detailLabel.text = model.customerName;
        self.idDetailLabel.text = model.customerIdnumber;
        self.phoneDetailLabel.text = model.bankNo;
        self.bankDetailLabel.text = @"待审核";

        self.stateDetailLabel.text = model.createDate;
        
        if([model.auditStatus isEqualToString:@"1"])
        {
            self.bankDetailLabel.text = @"待选择车辆";
            
        }else if([model.auditStatus isEqualToString:@"-1"])
        {
            self.bankDetailLabel.text = @"关闭";
        }else if([model.auditStatus isEqualToString:@"-2"])
        {
            self.bankDetailLabel.text = @"审核不通过";
        }
        self.bankDetailLabel.textColor = titleHightColor;

        self.timeDetailLabel.text = model.orgCode;
        
    } else
    {
        self.titleLabel.text = @"车辆品牌";
        self.idLabel.text = @"车辆型号";
        self.phoneLabel.text = @"产品包";
        self.bankLabel.text = @"状态";
        self.stateLabel.text = @"申请时间";
        self.timeLabel.text = @"机构代码";
        self.bankDetailLabel.textColor = titleHightColor;
        self.detailLabel.text = model.carBrand;
        self.idDetailLabel.text = model.carModel;
        self.phoneDetailLabel.text = model.packageName;
        self.bankDetailLabel.text = @"";
        self.stateDetailLabel.text = model.createDate;

       if([model.auditStatus isEqualToString:@"2"])
        {
            self.bankDetailLabel.text = @"待客户资料录入";
            if ([model.status isEqualToString:@"2"])
            {
                //   地菜
                self.bankDetailLabel.text = @"待付款";
            }
        }else if([model.auditStatus isEqualToString:@"z0"])
        {
            if ([model.status isEqualToString:@"1"])
            {
                //   集采
//                self.stateDetailLabel.text = @"后台申请(集采)";
                self.bankDetailLabel.text = @"待客户资料录入";

            }
        }else if([model.auditStatus isEqualToString:@"3"])
        {
            self.bankDetailLabel.text = @"待后台审核";

        }else if([model.auditStatus isEqualToString:@"z71"])
        {
                self.bankDetailLabel.text = @"待提车";
 
        } else if([model.auditStatus isEqualToString:@"-1"])
        {
            self.bankDetailLabel.text = @"关闭";
        }else if([model.auditStatus isEqualToString:@"-2"])
        {
            self.bankDetailLabel.text = @"审核不通过";
        }else if([model.auditStatus isEqualToString:@"-3"])
        {
            self.bankDetailLabel.text = @"支付未成功";
        }else if([model.auditStatus isEqualToString:@"n0"])
        {
            self.bankDetailLabel.text = @"待签约";
        }else if([model.auditStatus isEqualToString:@"n1"])
        {
            self.bankDetailLabel.text = @"待终审";
        } else if ([model.auditStatus isEqualToString:@"p3"])
        {
            if ([model.status isEqualToString:@"1"])
            {
              self.bankDetailLabel.text = @"待付款";
            }
        }else if([model.auditStatus isEqualToString:@"n7"])
        {
            self.bankDetailLabel.text = @"待提车";
        }else if([model.auditStatus isEqualToString:@"n71"])
        {
            self.bankDetailLabel.text = @"待提车";
        }else if([model.auditStatus isEqualToString:@"n8"])
        {
            self.bankDetailLabel.text = @"关闭";
        }else if([model.auditStatus isEqualToString:@"dc_1008"])
        {
            self.bankDetailLabel.text = @"待运营提车确认";
        }else if([model.auditStatus isEqualToString:@"dc_1007"])
        {
            self.bankDetailLabel.text = @"待发车";
        }else if([model.auditStatus isEqualToString:@"n71dc_10061"])
        {
            self.bankDetailLabel.text = @"待支付全款";
        }else if([model.auditStatus isEqualToString:@"n7dc_1009"])
        {
            self.bankDetailLabel.text = @"关闭";
        }
        self.timeDetailLabel.text = model.orgCode;

    }
    
}

@end
