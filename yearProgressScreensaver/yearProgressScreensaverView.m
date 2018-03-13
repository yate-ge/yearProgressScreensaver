//
//  countdownScreensaverView.m
//  countdownScreensaver
//
//  Created by yate on 2018/3/12.
//  Copyright © 2018年 yate ge. All rights reserved.
//

#import "yearProgressScreensaverView.h"
@interface yearProgressScreensaverView ()
{

    NSTextField *_textField;
    NSTextField *yearText;
    NSString * cyear;
}


@end
@implementation yearProgressScreensaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        // 今年
        cyear = [self currentYear];
        
        // 初始化进度条
        _textField = [[NSTextField alloc] initWithFrame:CGRectMake((frame.size.width - 36*20)/2, (frame.size.height-40)/2, 36*30,40)];
        _textField.bordered = NO;
        _textField.backgroundColor = [NSColor clearColor];
        _textField.selectable = NO;
        _textField.textColor = [NSColor whiteColor];
        _textField.cell.font = [NSFont fontWithName:@"arial" size:36];
        
        // 初始化日期显示
        yearText = [[NSTextField alloc] initWithFrame:CGRectMake((frame.size.width - 36*20)/2, (frame.size.height-40)/2 + 30, 36*30,40)];
        yearText.bordered = NO;
        yearText.backgroundColor = [NSColor clearColor];
        yearText.selectable = NO;
        yearText.textColor = [NSColor whiteColor];
        yearText.cell.font = [NSFont fontWithName:@"arial" size:18];
        
        
        [self addSubview:_textField];
        [self addSubview:yearText];

    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    
}

- (void)animateOneFrame
{
    
    // 显示进度条
    int pp = [self currentProgress];
    int a = pp/5;
    NSMutableString *str = [[NSMutableString alloc]initWithString: @"░░░░░░░░░░░░░░░░░░░░"];
    
    for (int i=0;i<a;i++){
        [str replaceCharactersInRange:NSMakeRange(i, 1) withString:@"▓"];
    }
    NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@       %d%%",str,pp]];
    _textField.stringValue =  astring;
    
    
    // 显示年份
    yearText.stringValue = [self currentTime];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

//计算时间进度
-(int )currentProgress{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"d";
    NSString *timeStr = [formatter stringFromDate:date];
    NSDate *currentDate = [formatter dateFromString:timeStr];
    NSString *day = [formatter stringFromDate:currentDate];
    
     NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = @"M";
    NSString *timeStr2 = [formatter2 stringFromDate:date];
    NSDate *currentDate2 = [formatter2 dateFromString:timeStr2];
    NSString *month = [formatter2 stringFromDate:currentDate2];
    int d = [day intValue];
    int m = [month intValue];
    int p = 0;
    
    //算每月天数
    NSInteger smallYeat[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    NSInteger bigYear[12] = {31,29,31,30,31,30,31,31,30,31,30,31};
    int y = [cyear intValue];
    if (y%4==0){
        for (int i=0;i<m-1;i++){
            p = p + bigYear[i];
        }
    }else{
        for (int i=0;i<m-1;i++){
            p = p + smallYeat[i];
        }
    }
    
    p = (p + d)*100/365;
    
    return p;
}

// 当前年份
-(NSString *)currentYear{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy";
    NSString *timeStr = [formatter stringFromDate:date];
    
    NSDate *year = [formatter dateFromString:timeStr];
    NSString *_year = [formatter stringFromDate:year];
    
    return _year;
}

// 当前具体时间点
-(NSString *)currentTime{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    NSString *timeStr = [formatter stringFromDate:date];
    
    NSDate *year = [formatter dateFromString:timeStr];
    NSString *a = [formatter stringFromDate:year];
    
    return a;
}

@end
