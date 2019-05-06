//
//  NSObject+CheckIsLegal.m
//  XiuXiuTuanGou
//
//  Created by 张敬 on 2018/10/4.
//  Copyright © 2018年 XiuXiuTuanGou. All rights reserved.
//

#import "NSObject+CheckIsLegal.h"

@implementation NSObject (CheckIsLegal)

//剔除卡号里的非法字符
-(NSString *)getDigitsOnly:(NSString*)s
{
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < s.length; i++)
    {
        c = [s characterAtIndex:i];
        if (isdigit(c))
        {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    return digitsOnly;
}

- (BOOL)isNumber:(NSString *)aims
{
    NSString *card = @"^[0-9]*$";
    NSPredicate *regextestcard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", card];
    
    return [regextestcard evaluateWithObject:aims] ? YES: NO;
}


//检查银行卡是否合法
//Luhn算法
- (BOOL)isValidCardNumber:(NSString *)cardNumber
{
    if (cardNumber == nil ||cardNumber.length == 0) return NO;
    if (cardNumber.length<16 || cardNumber.length >21) return NO;
    
    //去重复
    int oneNum = [cardNumber characterAtIndex:0] - '0' ;
    int twoNum = 0;
    NSString *aims = nil;
    for (NSInteger k = 0; k< cardNumber.length; k++) {
        
        twoNum = [cardNumber characterAtIndex:k] - '0';
        NSString *p = [cardNumber substringWithRange:NSMakeRange(k, 1)];
        
        if (oneNum == twoNum) {
           aims = [cardNumber stringByReplacingOccurrencesOfString:p withString:@""];
        }
     }
    
    if (aims.length >0 || aims == nil) {
        
        NSString *card = @"^[0-9]*$";
        NSPredicate *regextestcard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", card];

        if ([regextestcard evaluateWithObject:cardNumber]){

            return YES;
            
        }else{
            
            return NO;
        }
        
    }else{
        return NO;
    }
    /*
    if (aims.length >0 || aims == nil) {
        
        NSString *card = @"^[0-9]*$";
        NSPredicate *regextestcard = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", card];
        
        if ([regextestcard evaluateWithObject:cardNumber]) {
            
            NSString *digitsOnly = [self getDigitsOnly:cardNumber];
            int sum = 0;
            int digit = 0;
            int addend = 0;
            BOOL timesTwo = false;
            for (NSInteger i = digitsOnly.length - 1; i >= 0; i--)
            {
                digit = [digitsOnly characterAtIndex:i] - '0';
                if (timesTwo)
                {
                    addend = digit * 2;
                    if (addend > 9) {
                        addend -= 9;
                    }
                }
                else {
                    addend = digit;
                }
                sum += addend;
                timesTwo = !timesTwo;
            }
            int modulus = sum % 10;
            return modulus == 0 ?YES :NO;
            
        }else{
            return NO;
        }

    }else{
        return NO;
    }
     */
}

//验证手机号码
-(NSString *)numberSuitScanf:(NSString*)number{
    
    //首先验证是不是手机号码
    
    NSString *MOBILE = @"1[345789]([0-9]){9}";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];

   // BOOL isOk = [regextestmobile evaluateWithObject:number];
    
    NSString *numberString = [number stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return numberString;

}

- (BOOL) IsPhoneNumber:(NSString *)number
{
    NSString *phoneRegex1=@"1[3456789]([0-9]){9}";
    NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex1];
    return  [phoneTest1 evaluateWithObject:number];
}


- (BOOL) IsEmailAdress:(NSString *)Email
{
   // NSString *emailCheck = @"^\w+@[a-z0-9]+\.[a-z]{2,4}$";
    NSString *emailCheck = @"^\\w+@[a-z0-9]+\\.[a-z]{2,4}$";

    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}


- (BOOL) isChineseName:(NSString *)name{
    
    NSString *newStr = @"^[\u4e00-\u9fa5]{2,20}$";
    NSPredicate *aims = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",newStr];
    return [aims evaluateWithObject:name];

}

- (BOOL) isEnglishName:(NSString *)name{
    
    NSString *newStr = @"^[a-zA-Z \s]{2,20}$";
    NSPredicate *aims = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",newStr];
    return [aims evaluateWithObject:name];
}


- (BOOL) IsIdentityCard:(NSString *)IDCardNumber
{
    if (IDCardNumber.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:IDCardNumber];
}


@end
