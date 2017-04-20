//
//  QJStartView.h
//  QJStarView
//
//  Created by 瞿杰 on 2017/4/20.
//  Copyright © 2017年 yiniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJStartView :UIView

@property (nonatomic , copy)NSString * starImageNameNormal ;
@property (nonatomic , copy)NSString * starImageNameSelection ;

@property (nonatomic , assign)CGFloat selectionProgress;

@end
