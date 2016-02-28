//
//  PMTextView.m
//  28AtributedStringDemo
//
//  Created by majian on 16/2/28.
//  Copyright © 2016年 majian. All rights reserved.
//

#import "PMTextView.h"

@implementation PMTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[[touches allObjects] firstObject] locationInView:self];
    UITextRange * textRange = [self characterRangeAtPoint:point];
    
    if (!textRange.isEmpty) {
        NSUInteger location = [self offsetFromPosition:self.beginningOfDocument toPosition:textRange.start];
        NSUInteger length = [self offsetFromPosition:self.beginningOfDocument toPosition:textRange.end] - location;
        
        NSMutableAttributedString * attributedStringM = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
        [attributedStringM enumerateAttributesInRange:NSMakeRange(0, self.attributedText.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
            if (range.location <= location && (range.location + range.length) >=(location + length)) {
                if (attrs[PMLinkKey]) {
                    //如果包含该key，则需要跳转
                    [super router:PMURLRouterNameKey info:attrs];
                }
            }
        }];
    }
}

@end








