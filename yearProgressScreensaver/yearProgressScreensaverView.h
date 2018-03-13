//
//  countdownScreensaverView.h
//  countdownScreensaver
//
//  Created by yate on 2018/3/12.
//  Copyright © 2018年 yate ge. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface yearProgressScreensaverView : ScreenSaverView
@property (nonatomic, strong) NSView *containerView;
@property (nonatomic, strong) NSTextField *progressText;

@end
