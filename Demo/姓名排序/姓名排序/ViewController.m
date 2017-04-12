//
//  ViewController.m
//  姓名排序
//
//  Created by Adobe on 17/1/13.
//  Copyright © 2017年 龚. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView *tableView;
@property (strong,nonatomic)NSMutableDictionary *dataArray;
@property (strong,nonatomic)NSMutableArray *titleArray;
@property (strong,nonatomic)NSMutableArray *startArray;
@end
static NSString *const CELLID = @"CELLID";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startArray = @[].mutableCopy;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"user.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableDictionary *addressBookDict = [NSMutableDictionary dictionary];
    for (NSMutableDictionary *dict in array) {
        User *model = [[User alloc]initWithDictonary:dict];
        //获取到姓名的大写首字母
        NSString *firstLetterString = [self getFirstLetterFromString:model.name];
        //如果该字母对应的联系人模型不为空,则将此联系人模型添加到此数组中
        if (addressBookDict[firstLetterString])
        {
            [addressBookDict[firstLetterString] addObject:model];
        }
        //没有出现过该首字母，则在字典中新增一组key-value
        else
        {
            //创建新发可变数组存储该首字母对应的联系人模型
            NSMutableArray *arrGroupNames = [NSMutableArray arrayWithObject:model];
            //将首字母-姓名数组作为key-value加入到字典中
            [addressBookDict setObject:arrGroupNames forKey:firstLetterString];
        }
        if (model.uid == 325) {
            [self.startArray addObject:model];
        }
    }
    self.dataArray = addressBookDict;
    // 将addressBookDict字典中的所有Key值进行排序: A~Z
    NSArray *nameKeys = [[addressBookDict allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    // 将 "#" 排列在 A~Z 的后面
    if ([nameKeys.firstObject isEqualToString:@"#"])
    {
        NSMutableArray *mutableNamekeys = [NSMutableArray arrayWithArray:nameKeys];
        [mutableNamekeys insertObject:nameKeys.firstObject atIndex:nameKeys.count];
        [mutableNamekeys removeObjectAtIndex:0];
        self.titleArray = mutableNamekeys;
    }else{
         self.titleArray = [NSMutableArray arrayWithArray:nameKeys];
    }
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 60;
        tableView.sectionHeaderHeight = 30;
        [self.view addSubview:tableView];
        [self.tableView reloadData];
        tableView;
    });
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.startArray.count > 0) {
        
        return self.titleArray.count + 1;
    }else{
        return self.titleArray.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     if (self.startArray.count > 0) {
         if ( 0 == section) {
             return 1;
         }else{
             NSString *key = self.titleArray[section - 1];
             return [self.dataArray[key] count];
         }
     }else{
         NSString *key = self.titleArray[section];
         return [self.dataArray[key] count];
     }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELLID];
    }
    if (self.startArray.count > 0) {
        if (indexPath.section == 0) {
            User *model = self.startArray[indexPath.section];
            cell.textLabel.text = model.name;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"uid : %ld",model.uid];
            return cell ;
        }else{
            NSString *key = self.titleArray[indexPath.section - 1];
            User *model = [self.dataArray[key] objectAtIndex:indexPath.row];
            cell.textLabel.text = model.name;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"uid : %ld",model.uid];
            return cell ;
        }
    }else{
        NSString *key = self.titleArray[indexPath.section];
        User *model = [self.dataArray[key] objectAtIndex:indexPath.row];
        cell.textLabel.text = model.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"uid : %ld",model.uid];
        return cell ;
    }

}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (self.startArray.count > 0) {
        NSMutableArray *array = @[@"★"].mutableCopy;
        
        ///  添加自定义符号图标
        for (NSString *str in self.titleArray) {
            [array addObject:str];
        }
        return array[section];
    }else{
        return self.titleArray[section];
    }
   
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.startArray.count > 0) {
        NSMutableArray *array = @[@"{search}",@"★"].mutableCopy;
        
        ///  添加自定义符号图标
        for (NSString *str in self.titleArray) {
            [array addObject:str];
        }
        return array;
    }else{
        NSMutableArray *array = @[@"★"].mutableCopy;
        
        ///  添加自定义符号图标
        for (NSString *str in self.titleArray) {
            [array addObject:str];
        }
        return array;
 
    }
  
}

#warning  如果添加了自定义符号/图标就要自己实现以下方法
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    if (self.startArray.count > 0) {
        if ([title isEqualToString:@"★"]|| ([title isEqualToString:@"{search}"])) {
            return 0;
        }else{
            return  index -1;
        }
    }else{
        if ([title isEqualToString:@"★"]) {
            return 0;
        }else{
            return  index -1;
        }
    }
}

#pragma mark - 获取联系人姓名首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)getFirstLetterFromString:(NSString *)aString
{
    /**
     * **************************************** START ***************************************
     * 之前PPGetAddressBook对联系人排序时在中文转拼音这一部分非常耗时
     * 参考博主-庞海礁先生的一文:iOS开发中如何更快的实现汉字转拼音 http://www.olinone.com/?p=131
     * 使PPGetAddressBook对联系人排序的性能提升 3~6倍, 非常感谢!
     */
    NSMutableString *mutableString = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    NSString *pinyinString = [mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    /**
     *  *************************************** END ******************************************
     */
    
    // 将拼音首字母装换成大写
    NSString *strPinYin = [[self polyphoneStringHandle:aString pinyinString:pinyinString] uppercaseString];
    // 截取大写首字母
    NSString *firstString = [strPinYin substringToIndex:1];
    // 判断姓名首位是否为大写字母
    NSString * regexA = @"^[A-Z]$";
    NSPredicate *predA = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexA];
    // 获取并返回首字母
    return [predA evaluateWithObject:firstString] ? firstString : @"#";
    
}

/**
 多音字处理
 */
- (NSString *)polyphoneStringHandle:(NSString *)aString pinyinString:(NSString *)pinyinString
{
    if ([aString hasPrefix:@"长"]) { return @"chang";}
    if ([aString hasPrefix:@"沈"]) { return @"shen"; }
    if ([aString hasPrefix:@"厦"]) { return @"xia";  }
    if ([aString hasPrefix:@"地"]) { return @"di";   }
    if ([aString hasPrefix:@"重"]) { return @"chong";}
    return pinyinString;
}
@end
