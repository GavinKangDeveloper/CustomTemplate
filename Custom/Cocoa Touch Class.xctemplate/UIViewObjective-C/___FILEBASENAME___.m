//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - LifeCycle
- (void)dealloc {
    [self removeNotificationObserver];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //设置view
        [self setupView];

        //请求数据
        [self requestData];

        //添加通知
        [self addNotificationObserver];
    }
    return self;
}

#pragma mark - View
- (void)setupView {
    
}

#pragma mark - Network
- (void)requestData {
    
}

#pragma mark- Delegate
#pragma mark UITableDatasource & UITableviewDelegate


#pragma mark - Private


#pragma mark - Event


#pragma mark - Public


#pragma mark - NSNotificationCenter
- (void)addNotificationObserver {
    
}

- (void)removeNotificationObserver {
    
}

#pragma mark - Setter


#pragma mark - Getter


@end
