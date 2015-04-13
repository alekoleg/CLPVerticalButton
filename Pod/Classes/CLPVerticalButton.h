//
//  CLPVeticalButton.h
//  Colparter
//
//  Created by Oleg Alekseenko on 13/03/15.
//  Copyright (c) 2015 Alekoleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPVerticalButton : UIButton

@property (nonatomic, assign) IBInspectable BOOL multiLines;
@property (nonatomic, assign) IBInspectable BOOL verticalMode;
@property (nonatomic, assign) IBInspectable CGFloat verticalMargin;

@end
