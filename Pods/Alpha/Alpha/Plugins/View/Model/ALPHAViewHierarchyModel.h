//
//  ALPHAViewHierarchyModel.h
//  Alpha
//
//  Created by Dal Rupnik on 15/06/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

#import "ALPHAModel.h"

#import "ALPHASerializableView.h"

@interface ALPHAViewHierarchyModel : ALPHAModel

@property (nonatomic, copy) NSArray<ALPHASerializableView> *views;

@end
