//
//  VCParseJson.m
//  UI
//
//  Created by release on 2019/11/16.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCParseJson.h"
#import "NewsListTableViewCell.h"
#import "NewsModel.h"
#import <SDWebImage.h>


@interface VCParseJson ()
{
    UITableView* _tableView;
    NSMutableArray* _arrayNewsModel;
}
@end

@implementation VCParseJson

- (void)viewDidLoad {
    [super viewDidLoad];
    [self parseJson];
    [self initView];
}

-(void)parseJson{
    //获取文件路径
    NSString* path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
    //返回二进制文件的格式数据
    NSData* dataJson = [NSData dataWithContentsOfFile:path];
    //将json数据解析为字典格式
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:dataJson options:NSJSONReadingMutableContainers error:nil];

    if ([dic isKindOfClass:[NSDictionary class]]) {
        //开始解析
        _arrayNewsModel = [[NSMutableArray alloc]init];
        NSNumber* code = [dic objectForKey:@"code"];
        NSString* msg = [dic objectForKey:@"msg"];
        YCLog(@"code===%@   ,msg====%@",code,msg);
        YCLog(@"json===%@",dic);
        
        //解析根数据
        NSArray* newslist = [dic objectForKey:@"newslist"];
        //遍历数组对象
        for (int i =0 ; i<newslist.count; i++) {
            NSDictionary* dicNews = [newslist objectAtIndex:i];
            NSString* ctime = [dicNews objectForKey:@"ctime"];
            NSString* picUrl = [dicNews objectForKey:@"picUrl"];
            NSString* title = [dicNews objectForKey:@"title"];
            NSString* url = [dicNews objectForKey:@"url"];
            
            NewsModel* _newsModel = [[NewsModel alloc]init];
            _newsModel.mCtime = ctime;
            _newsModel.mPicUrl = picUrl;
            _newsModel.mTitile = title;
            _newsModel.mUrl = url;
            [_arrayNewsModel addObject:_newsModel];
        }
    }
    
}

-(void)initView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = (id)self;
    _tableView.dataSource = (id)self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    _tableView.scrollEnabled = YES;//石否可以有滚动效果
    _tableView.bounces = YES;//是否可以边缘弹动效果
    _tableView.alwaysBounceVertical = YES;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 80)];
    [self.view addSubview:_tableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayNewsModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* indentify = @"cellr4rfrklfkre";
    NewsListTableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:indentify];
    
    if (!cell) {
        cell = [[NewsListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
    }
    
    NewsModel* _newsModel =  _arrayNewsModel[indexPath.row];
    
    cell.mTitleLable.text = _newsModel.mTitile;
    cell.mCtimeLable.text = _newsModel.mCtime;
    [cell.mImageView sd_setImageWithURL:[NSURL URLWithString:_newsModel.mPicUrl]
    placeholderImage:[UIImage imageNamed:@"guide_1"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    YCLog(@"点击条目%d",(int)indexPath.row);
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
