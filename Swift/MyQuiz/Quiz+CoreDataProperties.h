//
//  Quiz+CoreDataProperties.h
//  MyQuiz
//
//  Created by Shinya Yamamoto on 2016/05/18.
//  Copyright © 2016年 Shinya Yamamoto. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Quiz.h"

NS_ASSUME_NONNULL_BEGIN

@interface Quiz (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *english;

@end

NS_ASSUME_NONNULL_END
