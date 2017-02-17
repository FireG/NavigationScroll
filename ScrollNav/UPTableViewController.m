//
//  UPTableViewController.m
//  ScrollNav
//
//  Created by gzh on 2017/2/17.
//  Copyright © 2017年 gzh. All rights reserved.
//

#import "UPTableViewController.h"

@interface UPTableViewController ()
@property (nonatomic,assign)CGFloat endOffsetY;
@end

@implementation UPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat offsetY = self.tableView.contentInset.top + scrollView.contentOffset.y;
    CGFloat directionY = [scrollView.panGestureRecognizer translationInView:self.tableView].y;
    
    NSLog(@"%f",directionY);
    
    
    if(offsetY > 65 ){
        
//        [UIView animateWithDuration:0.3 animations:^{
//            self.navigationController.navigationBar.transform =  CGAffineTransformMakeTranslation(0, -64);
//        }];
        
        if(directionY>0){
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }else{
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
        
        
        
    }else{
         [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    
    
}









- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc]init];
    }
    [cell setBackgroundColor:RandomColor];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
