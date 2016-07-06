//
//  SVTBook.m
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTBook.h"

@implementation SVTBook

- (instancetype)initWithBookValue:(NSString *)bookName yearBook:(int)bookYear bookType:(bookType)bookCoverType {
    self = [super init];
    if (self != nil) {
        _nameBook = bookName;
        _yearBook = bookYear;
        _bookType = bookCoverType;
    }
    return self;
}

+ (instancetype)bookWithName:(NSString *)name yearBook:(int)year bookType:(bookType)newType {
    return [[[self alloc] initWithBookValue:name yearBook:year bookType:newType] autorelease];
}

- (NSString *)nameBook {
    return _nameBook;
}

- (void)setNameBook:(NSString *)newNameBook {
    if (newNameBook != _nameBook) {
        [newNameBook retain];
        [_nameBook release];
        _nameBook = newNameBook;
    }
}

- (int)yearBook {
    return _yearBook;
}

- (void)setYearBook:(int)newYearBook {
    if (newYearBook != _yearBook) {
        _yearBook = newYearBook;
    }
}

- (bookType)bookType {
    return _bookType;
}

- (void)SetBookType:(bookType)newSetBookType {
    if (newSetBookType != _bookType) {
        _bookType = newSetBookType;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\n\nName: %@;\nYear: %d;\nType of Book: %@;\n\n", [self nameBook], [self yearBook], [self bookType] == paperBack ? @"Paperback" : @"Hardcover"];
}

@end
