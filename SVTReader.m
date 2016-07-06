//
//  SVTReader.m
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTReader.h"

@interface SVTReader()
@property (readwrite,retain) SVTBook * currentBook;
@end

@implementation SVTReader {
    @private
    NSString *_firstName;
    NSString *_lastName;
    NSUInteger _year;
}

- (instancetype)initWithTitle:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear {
    self = [super init];
    if (self != nil) {
        _firstName = [newFirstName retain];
        _lastName = [newLastName retain];
        _year = newYear;
        _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] retain];
    }
    return self;
}

+ (instancetype)personWithName:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear {
    return [[[self alloc] initWithTitle:newFirstName lastName:newLastName year:newYear] autorelease];
}

- (void)dealloc {
    [_firstName release];
    [_lastName release];
    [_currentBook release];
    [super dealloc];
}

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)aFirstName {
    if (aFirstName != _firstName) {
        [_firstName release];
        _firstName = [aFirstName retain];
        if (_lastName != nil) {
            [_fullName release];
            _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] retain];
        }
    }
}

- (NSString *)lastName {
    return _lastName;
}

- (void)setLastName:(NSString *)aLastName {
    if (aLastName != _lastName) {
        [_lastName release];
        _lastName = [aLastName retain];
        if (_firstName != nil) {
            [_fullName release];
            _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] retain];
        }
    }
}

- (NSUInteger)year {
    return _year;
}

- (void)setYear:(NSUInteger)aYear {
    _year = aYear;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"\n%@ %@\n",[super description], [self fullName]];
}

- (BOOL)takeBook:(SVTBook *)aSVTBook {
    if (_currentBook == nil && aSVTBook.owner == nil) {
        _currentBook = [aSVTBook retain];
        aSVTBook.owner = self;
        return YES;
    }
    return NO;
}

- (BOOL)returnCurrentBook {
    if (_currentBook != nil) {
        _currentBook.owner = nil;
        self.currentBook = nil;
        return YES;
    }
    return NO;
}

@end
