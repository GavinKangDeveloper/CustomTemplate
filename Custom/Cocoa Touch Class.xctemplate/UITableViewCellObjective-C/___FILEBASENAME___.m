//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        //设置view
        [self setupView];
    }
    return self;
}

#pragma mark - View
- (void)setupView {
    
}

#pragma mark - Private


#pragma mark - Public
- (void)updateWith:(<# model #> *)<# model #> {
    
}

+ (CGFloat)getHeight {
    return <# height #>;
}

#pragma mark - Setter


#pragma mark - Getter


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
