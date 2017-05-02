//
//  NSArray+avoidCrash.m
//  CrashDemo
//
//  Created by xietao on 2017/4/25.
//  Copyright © 2017年 xietao3. All rights reserved.
//

#import "NSArray+avoidCrash.h"
#import "AvoidCrash.h"

@implementation NSArray (avoidCrash)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");

        // 初始化方法
        [self sel_exchangeClass:NSClassFromString(@"__NSPlaceholderArray") FirstSel:@selector(initWithObjects:count:) secondSel:@selector(avoidCrash_initWithObjects:count:)];

        // 包含多个对象的数组
        [self sel_exchangeClass:__NSArrayI FirstSel:@selector(objectAtIndex:) secondSel:@selector(avoidCrash_arrayI_objectAtIndex:)];
        // 只包含1个对象的数组
        [self sel_exchangeClass:__NSSingleObjectArrayI FirstSel:@selector(objectAtIndex:) secondSel:@selector(avoidCrash_singleObjectArray_objectAtIndex:)];
        // 空数组
        [self sel_exchangeClass:__NSArray0 FirstSel:@selector(objectAtIndex:) secondSel:@selector(avoidCrash_array0_objectAtIndex:)];
        

    });
    
}

- (instancetype)avoidCrash_initWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)count {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrash_initWithObjects:objects count:count];
    } @catch (NSException *exception) {
        [AvoidCrash setErrorWithException:exception remark:nil];
    } @finally {
        return returnArray;
    }

}

- (instancetype)avoidCrash_arrayI_objectAtIndex:(NSInteger)index {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrash_arrayI_objectAtIndex:index];
    } @catch (NSException *exception) {
        [AvoidCrash setErrorWithException:exception remark:nil];
    } @finally {
        return returnArray;
    }
    
}

- (instancetype)avoidCrash_singleObjectArray_objectAtIndex:(NSInteger)index {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrash_singleObjectArray_objectAtIndex:index];
    } @catch (NSException *exception) {
        [AvoidCrash setErrorWithException:exception remark:nil];
    } @finally {
        return returnArray;
    }
    
}

- (instancetype)avoidCrash_array0_objectAtIndex:(NSInteger)index {
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrash_array0_objectAtIndex:index];
    } @catch (NSException *exception) {
        [AvoidCrash setErrorWithException:exception remark:nil];
    } @finally {
        return returnArray;
    }
    
}

@end
