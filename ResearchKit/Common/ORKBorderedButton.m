/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import "ORKBorderedButton.h"
#import "ORKHelpers.h"


@implementation ORKBorderedButton {
    UIColor *_normalTintColor;
    UIColor *_normalHighlightOrSelectTintColor;
    UIColor *_disableTintColor;
}

- (void)init_ORKTextButton {
    [super init_ORKTextButton];
    
    self.layer.borderWidth = 0.0f;
    self.layer.cornerRadius = 0.0f;
    self.fadeDelay = 0.0;
    
    self.titleLabel.font =  [UIFont systemFontOfSize:16 weight:UIFontWeightLight];//ORKThinFontWithSize(28);
    
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.1f] forState:UIControlStateHighlighted];
    
    
 //   UIColor *btnColor = [self colorFromHexString:@"#1B596D"];
 
    UIColor *btnColor = [self colorFromHexString:@"#ffffff"];
    
    UIImage *img = [self imageWithColor:btnColor];
    
   [self setBackgroundImage:img forState:UIControlStateNormal];
    
    [self setEnabled:NO];
}

- (void)tintColorDidChange {
  //  [super tintColorDidChange];
    
 //   _normalTintColor = [[self tintColor] colorWithAlphaComponent:1.0f];
    
    _normalTintColor = [UIColor whiteColor];
    _normalHighlightOrSelectTintColor = _normalTintColor;
    _disableTintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1f];
//    
//    [self setTitleColor:_normalTintColor forState:UIControlStateNormal];
//    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    [self setTitleColor:_disableTintColor forState:UIControlStateDisabled];
    
   // UIColor *btnColor = [self colorFromHexString:@"#ffffff"];
    
  //  UIImage *img = [self imageWithColor:btnColor];
    
  //  [self setBackgroundImage:img forState:UIControlStateNormal];
    
   // [self updateBorderColor];
}


- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:0.3];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



- (void)setHighlighted:(BOOL)highlighted {
    //[super setHighlighted:highlighted];
    
    [self updateBorderColor];
}

- (void)setSelected:(BOOL)selected {
   // [super setSelected:selected];
    
    [self updateBorderColor];
}

- (void)setEnabled:(BOOL)enabled {
   // [super setEnabled:enabled];
    
    [self updateBorderColor];
}

- (void)fadeHighlightOrSelectColor {
    // Ignore if it's a race condition
    if (self.enabled && !(self.highlighted || self.selected)) {
        //self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [_normalTintColor CGColor];
    }
}



- (void)updateBorderColor {

//    if (self.enabled && (self.highlighted || self.selected)) {
//        //self.backgroundColor = _normalHighlightOrSelectTintColor;
//        self.layer.borderColor = [_normalHighlightOrSelectTintColor CGColor]; // move
//    } else if(self.enabled && !(self.highlighted || self.selected)) {
//        if (self.fadeDelay > 0) {
//            [self performSelector:@selector(fadeHighlightOrSelectColor) withObject:nil afterDelay:self.fadeDelay];
//        } else {
//            [self fadeHighlightOrSelectColor];
//        }
//    } else {
//        //self.backgroundColor = [UIColor whiteColor];
//        self.layer.borderColor = [_disableTintColor CGColor];
//    }
}

+ (UIFont *)defaultFont {
    // regular, 17
//    UIFontDescriptor *descriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline];
    return [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
//    return [UIFont fontWithName:@"Helvetica Neue Thin" size:((NSNumber *)[descriptor objectForKey: UIFontDescriptorSizeAttribute]).doubleValue + 35.0];
}

@end
