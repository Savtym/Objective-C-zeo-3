//
//  SVTBook.h
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SVTReader; //----(3)

typedef NS_ENUM (NSInteger, bookType) {
    paperBack = 0,
    hadrCover = 1
};

@interface SVTBook : NSObject {
    @private
        NSString *_nameBook;
        int _yearBook;
        bookType _bookType;
}

- (instancetype)initWithBookValue:(NSString *)bookName yearBook:(int)bookYear bookType:(bookType)bookCoverType;
+ (instancetype)bookWithName:(NSString *)name yearBook:(int)year bookType:(bookType)newType;

- (NSString *)nameBook;
- (void)setNameBook:(NSString *)setNameBook;

- (int)yearBook;
- (void)setYearBook:(int)newYearBook;

- (bookType)bookType;
- (void)SetBookType:(bookType)newSetBookType;

- (NSString *)description;


//------------------------(3)

@property (readwrite, assign) SVTReader * owner;

@end
