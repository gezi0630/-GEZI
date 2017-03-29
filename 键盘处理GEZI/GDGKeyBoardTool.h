//
//  GDGKeyBoardTool.h
//  键盘处理GEZI
//
//  Created by MAC on 16/7/14.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

//三个item的枚举
typedef enum {
    GDGKeyboardToolItemPrevious,
    GDGKeyboardToolItemNext,
    GDGKeyboardToolItemDone
} GDGKeyboardToolItem;

//生成代理方法
@class GDGKeyBoardTool;

@protocol GDGKeyboardToolDelegate <NSObject>

@optional

- (void)keyboardTool:(GDGKeyBoardTool *)tool didClickItem:(GDGKeyboardToolItem)item;
@end


@interface GDGKeyBoardTool : UIToolbar

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousItem;

+ (instancetype)tool;

/** 代理 */
@property (nonatomic, weak) id<GDGKeyboardToolDelegate> toolbarDelegate;


@end
