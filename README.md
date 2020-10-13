# CustomTemplate
[掘金 - 自定义 Xcode 初始化的模板](https://juejin.im/post/6882678008415518734/)

**为了统一多人开发文件的框架，也为了提高开发效率，降低无效的作业，总结了以下自定义的模板，仅供大家参考，如果对你或者公司有用，[还请到 Github 下载文件的同时，绅士的给个 star ，你的 star ，也是我分享的动力](https://github.com/GavinKangDeveloper/CustomTemplate)。**

- 系统模板所在位置：

```
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File Templates/Source/Cocoa Touch Class.xctemplate
```
自己可以根据需求，直接修改系统默认的文件模版，但是遇到Xcode 升级之类的会覆盖掉原有的文件模版，也可以自定义的模板。

- 自定义模板目录：

如果之前没有自定义过模板，需要根据如下目录，创建对应的文件夹
```
~/Library/Developer/Xcode/Templates/<自定义名>/<自定义名>.xctemplate
```

![系统的内容](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a4d1b1bf4cf34c14afaaafa33a9e2bc0~tplv-k3u1fbpfcp-watermark.image)

### 自定义模板
#### 模板常用的占位宏
- `___PROJECTNAME___`：工程名
- `___FILENAME___`：包含后缀的文件名
- `___FILEBASENAME___` : 文件名
- `___FILEBASENAMEASIDENTIFIER___` ：不包含后缀的c格式文件名
- `___VARIABLE_cocoaTouchSubclass___`：继承的父类名字
- `___FULLUSERNAME___`：用户名
- `___ORGANIZATIONNAME___`：公司名
- `___COPYRIGHT___`：版权说明
- `___DATE___`：当前日期
- `___TIME___`：当前时间
- `___YEAR___`：当前年
- `___FILEHEADER___`：默认类的头文件

#### 自定义模板
创建自定义模板，首先要把系统的文件， Copy 到在对应的路径下，本次以 `~/Library/Developer/Xcode/Templates/Custom/Cocoa Touch  Class.xctemplate ` 路径讲解。下图是自定义模板定制成功后，`command + n ` 后创建类的效果图，我们自定义创建的模板入口一般在 `Other` 的下面。

![自定义模板内容](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/bb9ee75a8f154c2382b108cfb261b440~tplv-k3u1fbpfcp-watermark.image)

![自定义模板的效果](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/a9e7237539bc4f6c90c4f72fc13edd27~tplv-k3u1fbpfcp-watermark.image)

![新文件选择项](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/edb5fd31b8d5447592c83af1ed61cb9d~tplv-k3u1fbpfcp-watermark.image)

- 注意：

1、Xcode 需要 `.xctemplate`后缀才能将这些目录识别为模板。
2、自定义模板需要重启 Xcode 才生效

一个模板通常包含以下文件：
- Custom：选择新文件模板的自定义标题
- TemplateIcon.png 和 TemplateIcon@2x.png 是 Xcode 创建文件界面的图标
- TemplateInfo.plist 中的内容对应 Choose options for your new file: 中的四个选项
- 文件夹中的 `___FILEBASENAME___` 是自定义的 .h 和 .m 文件模板

#### TemplateInfo.plist 讲解
![TemplateInfo.plist](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e131a069235042a986413cc320f9a220~tplv-k3u1fbpfcp-watermark.image)

里面的四个 item 对应 Choose options for your new file 里面的四个选项，我们这里主要讲解自定义 UIView 模板用到的 item2 ，里面的 cocoaTouchSubclass 数组保存的是可选使用 XIB 的类名，比如这里新增了 UIView 可选 XIB 功能，所以需要在 cocoaTouchSubclass 中新增 UIView 项，同时在 Cocoa Touch Class.xctemplate 文件夹中需要新增 UIViewXIBObjective-C 文件夹和对应的文件，否则 UIView 选择创建 XIB ，也没有作用，不会创建任何类。

当然，这里面的功能很强大，修改还有默认的 Class 、 Subclass of、XIB 的默认选中等功能，具体还需要大家挖掘。

[下面具体的修改代码中，没有涉及到修改 XIB 的例子，实际 Github 中已经有了，其原理也是根据上面模板常用的占位宏进行对应修改的，具体可以看 Github，如果对你有帮助，请绅士的 star 吧。](https://github.com/GavinKangDeveloper/CustomTemplate)


### 修改常用模板

注意：修改模板的时候不要用 Xcode 打开，用 Xcode 可能会无法修改，可以用文本编辑进行修改，下面修改到的内容有：在 UIViewController、UIView、UITableViewCell、UICollectionViewCell 文件中新增了纯代码和 XIB 特殊注释和初始化需要的方法，UIView新增了可选创建对应的 XIB ，UITableViewCell 和 UICollectionViewCell 新增了对应类名的 Identitier。

#### UIViewControllerObjective-C & UIViewControllerXIBObjective-C

```
#pragma mark - LifeCycle
- (void)dealloc {
    [self removeNotificationObserver];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNavBar];
    
    //设置view
    [self setupView];
   
    //请求数据
    [self requestData];
    
    //添加通知
    [self addNotificationObserver];
}

#pragma mark - View
- (void)setupNavBar {
    
}

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


#pragma mark - MemoryWarning
- (void)didReceiveMemoryWarning {
    
}
```

#### UIViewObjective-C & UIViewXIBObjective-C

```
//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - LifeCycle
- (void)dealloc {
    [self removeNotificationObserver];
}

<!--纯代码-->
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

<!--XIB-->
- (void)awakeFromNib {
    [super awakeFromNib];
     //设置view
     [self setupView];
    
     //请求数据
     [self requestData];
     
     //设置通知
     [self addNotificationObserver];
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

```

#### UITableViewCellObjective-C & UITableViewCellXIBObjective-C

 .h 文件
```
//___FILEHEADER___

___IMPORTHEADER_cocoaTouchSubclass___

NS_ASSUME_NONNULL_BEGIN

@interface ___FILEBASENAMEASIDENTIFIER___ : ___VARIABLE_cocoaTouchSubclass___

- (void)updateWith:(<# model #> *)<# model #>;
+ (CGFloat)getHeight;

@end

NS_ASSUME_NONNULL_END

```

.m 文件
```
//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

<!--纯代码-->
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        //设置view
        [self setupView];
    }
    return self;
}

<!--XIB-->
- (void)awakeFromNib {
    [super awakeFromNib];
    
    //设置view
    [self setupView];
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

```
#### UICollectionViewCellObjective-C & UICollectionViewCellXIBObjective-C
.h 文件

```
//___FILEHEADER___

___IMPORTHEADER_cocoaTouchSubclass___

NS_ASSUME_NONNULL_BEGIN

@interface ___FILEBASENAMEASIDENTIFIER___ : ___VARIABLE_cocoaTouchSubclass___

- (void)updateWith:(<# model #> *)<# model #>;
+ (CGSize)getSize;

@end

NS_ASSUME_NONNULL_END
```

.m 文件

```
//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ ()

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

<!--纯代码-->
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置view
        [self setupView];
    }
    return self;
}

<!--XIB-->
- (void)awakeFromNib {
    [super awakeFromNib];
   
    //设置view
    [self setupView];
}

#pragma mark - View
- (void)setupView {
    
}

#pragma mark - Private


#pragma mark - Public
- (void)updateWith:(<# model #> *)<# model #> {
    
}

+ (CGSize)getSize {
    return CGSizeMake(<#CGFloat width#>, <#CGFloat height#>);
}

#pragma mark - Setter


#pragma mark - Getter


@end

```
 
