//
//  KTRecommendAerobicModel.h
//  KTDoctor
//
//  Created by 张敬 on 2019/5/7.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

/*
 {
 code = 0;
 msg = "\U6210\U529f";
 rows =     (
 );
 total = 2;
 }
 */

@class KTRecommendAerobicItem, TypeList;

@interface KTRecommendAerobicModel : BaseModel

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) NSString *total;
@property (nonatomic, copy) NSArray<KTRecommendAerobicItem *> *rows;

@end


/*
 {
 createTime = "2019-01-08 17:30:32";
 daysPerWeek = 5;
 difficultyLevel = "";
 disease = "\U2161\U578b\U7cd6\U5c3f\U75c5";
 doctorId = 0;
 id = 63;
 orgCode = 1001;
 riskLevel = 1;
 sectionNum = 5;
 targetCalorie = 0;
 targetDuration = 1980;
 timing = 1;
 title = "\U6a21\U677f\U6d4b\U8bd5";
 treatmentPeriod = 6;
 type = 9;
 typeList =             (
  );
 useCount = 0;
 },
 */

@interface KTRecommendAerobicItem : BaseModel

@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *daysPerWeek;
@property (nonatomic, copy) NSString *difficultyLevel;
@property (nonatomic, copy) NSString *disease;

@property (nonatomic, copy) NSString *doctorId;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *orgCode;
@property (nonatomic, copy) NSString *riskLevel;

@property (nonatomic, copy) NSString *sectionNum;
@property (nonatomic, copy) NSString *targetCalorie;
@property (nonatomic, copy) NSString *timing;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *treatmentPeriod;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *useCount;
@property (nonatomic, copy) NSArray<TypeList *> *typeList;

@end

/*
 id = 9;
 name = "\U529f\U7387\U8f66";
 */
@interface TypeList : BaseModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;

@end


NS_ASSUME_NONNULL_END
