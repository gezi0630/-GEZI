//
//  ViewController.m
//  键盘处理GEZI
//
//  Created by MAC on 16/7/14.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "GDGKeyBoardTool.h"
@interface ViewController ()<UITextFieldDelegate,GDGKeyboardToolDelegate>
//姓名文本框
@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

/** 所有的文本框数组 */
@property (nonatomic, strong) NSArray *fields;

/** 工具条 */
@property (nonatomic, weak) GDGKeyBoardTool *toolbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameField, self.emailField, self.addressField];

    // 加载工具条控件
    GDGKeyBoardTool *toolbar = [GDGKeyBoardTool tool];
    toolbar.toolbarDelegate = self;
    self.toolbar = toolbar;
    
    //设置工具条
    self.nameField.inputAccessoryView = toolbar;
    self.emailField.inputAccessoryView = toolbar;
    self.addressField.inputAccessoryView = toolbar;
   }

//点击空白处让键盘退下
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    
}

#pragma mark - <GDGKeyboardToolDelegate>
//回调代理方法
- (void)keyboardTool:(GDGKeyBoardTool *)tool didClickItem:(GDGKeyboardToolItem)item
{
    if (item == GDGKeyboardToolItemPrevious) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex--;
        
        [self.fields[currentIndex] becomeFirstResponder];
        
        self.toolbar.previousItem.enabled = (currentIndex != 0);
        self.toolbar.nextItem.enabled = YES;
        
    } else if (item == GDGKeyboardToolItemNext) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
        
        [self.fields[currentIndex] becomeFirstResponder];
        
        self.toolbar.previousItem.enabled = YES;
        self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
        
    } else if (item == GDGKeyboardToolItemDone) {
        
        [self.view endEditing:YES];
    }
}


#pragma mark - <UITextFieldDelegate>
/**
 * 当点击键盘右下角的return key时,就会调用这个方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameField) {
        // 让emailField成为第一响应者
        [self.emailField becomeFirstResponder];
    } else if (textField == self.emailField) {
        // 让addressField成为第一响应者
        [self.addressField becomeFirstResponder];
    } else if (textField == self.addressField) {
        [self.view endEditing:YES];
      
    }
    return YES;
}
/**
 * 键盘弹出就会调用这个方法
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSUInteger currentIndex = [self.fields indexOfObject:textField];
    
    self.toolbar.previousItem.enabled = (currentIndex != 0);
    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
}




@end
