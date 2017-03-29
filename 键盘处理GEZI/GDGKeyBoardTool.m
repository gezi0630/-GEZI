//
//  GDGKeyBoardTool.m
//  键盘处理GEZI
//
//  Created by MAC on 16/7/14.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "GDGKeyBoardTool.h"


@implementation GDGKeyBoardTool


+ (instancetype)tool
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (IBAction)previous:(id)sender {
    
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:GDGKeyboardToolItemPrevious];
    }
}

- (IBAction)next:(id)sender {
    
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:GDGKeyboardToolItemNext];
    }
}

- (IBAction)done:(id)sender {
    
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:GDGKeyboardToolItemDone];
    }
}


@end
