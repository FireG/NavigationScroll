//
//  ViewController.m
//  ScrollNav
//
//  Created by gzh on 2017/2/17.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "ViewController.h"
#import "UPTableViewController.h"





@interface ViewController ()
@property (nonatomic,strong)UIImageView *headTitleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 80;
    
    [self navHeadView];
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y + self.tableView.contentInset.top;
    
   
    
    if (offsetY <= 0 && offsetY > -100){
        self.headTitleView.transform = CGAffineTransformMakeScale(1 + ABS(offsetY/100) , 1 + ABS(offsetY/100));
    }else if(offsetY > 0 && offsetY < 150) {
        self.headTitleView.transform = CGAffineTransformMakeScale(1 - (offsetY/150)*0.55 , 1 - (offsetY/150)*0.55);
    }else if(offsetY >150 ){
        self.headTitleView.transform = CGAffineTransformMakeScale(1 - 0.55 , 1 - 0.55);
    }else if(offsetY < -100 ){
        self.headTitleView.transform = CGAffineTransformMakeScale(1 + 1 , 1 + 1 );
    }

  

   
    CGRect frame = self.headTitleView.frame;
    frame.origin.y = 5;
    self.headTitleView.frame = frame;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc]init];
    }
    
    switch (indexPath.row) {
        case 0:
            [cell setBackgroundColor:RandomColor];
            break;
        case 1:
            [cell setBackgroundColor:[UIColor whiteColor]];
            cell.textLabel.text = @"上滑动隐藏navigationBar";
            break;
        default:
            [cell setBackgroundColor:RandomColor];
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UPTableViewController *up = [UPTableViewController new];
   
    
    switch (indexPath.row) {
        case 1:
            [self.navigationController pushViewController:up animated:YES];
            break;
        default:
            break;
    }
    
}

-(void)navHeadView{
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 78, 44)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 78, 78)];
    imageView.image = [UIImage imageNamed:@"head"];
    [titleView addSubview:imageView];
    self.headTitleView = imageView;
    self.navigationItem.titleView = titleView;
    
}



@end
