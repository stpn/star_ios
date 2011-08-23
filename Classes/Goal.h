@interface Goal : NSObject {
    NSString *user_id;
    NSString *x_coord;
    NSString *y_coord;
    NSString *star_id;
    NSDate *createdAt;
    NSDate *updatedAt;
}

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *x_coord;
@property (nonatomic, copy) NSString *y_coord;

@property (nonatomic, copy) NSString *star_id;
@property (nonatomic, retain) NSDate *createdAt;
@property (nonatomic, retain) NSDate *updatedAt;


+ (NSArray *)makeGoalsFromJSONArray:(NSArray *)results;



- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)JSONRepresentation;

@end
