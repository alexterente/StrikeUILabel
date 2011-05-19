//
//  StrikeUILabel.h
//  TTM-iPhone
//
//  Created by Alex Terente on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StrikeUILabel : UILabel {
    
    UIColor *strikeColor;
}

@property (nonatomic, copy) UIColor *strikeColor;

- (void)setStrikeColor:(UIColor *)color;

@end
