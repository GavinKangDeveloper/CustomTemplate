//___FILEHEADER___

#import "___FILEBASENAME___.h"

static dispatch_once_t _onceToken;
static ___FILEBASENAMEASIDENTIFIER___ *_manager;

@interface  ___FILEBASENAMEASIDENTIFIER___()<NSCopying, NSMutableCopying>

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)invalidate {
    _onceToken = 0;
    _manager = nil;
}

+ (___FILEBASENAMEASIDENTIFIER___ *)sharedManager {
    dispatch_once(&_onceToken, ^{
        _manager = [[super allocWithZone:NULL] init];
    });
    return _manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];;
}

+ (instancetype)new {
    return  [self alloc];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
