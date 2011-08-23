#import "Goal.h"

#import "SBJSON.h"

@implementation Goal

@synthesize user_id;
@synthesize x_coord;
@synthesize y_coord;

@synthesize star_id;
@synthesize createdAt;
@synthesize updatedAt;

- (void)dealloc {
    [user_id release];
    [x_coord release];
    [y_coord release];
    

    [star_id release];
    [createdAt release];
    [updatedAt release];
	[super dealloc];
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.user_id      = [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"user_id"]];
        self.x_coord    = [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"x_coord"]];
        self.y_coord    = [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"y_coord"]];

        self.star_id    = [NSString stringWithFormat:@"%@", [dictionary valueForKey:@"id"]];
        self.createdAt = parseDateTime([dictionary valueForKey:@"created_at"]);
        self.updatedAt = parseDateTime([dictionary valueForKey:@"updated_at"]);
    }
    return self;
}

+ (NSArray *)makeGoalsFromJSONArray:(NSArray *)results  {
    NSMutableArray *goals = [NSMutableArray array];
    
    for (NSDictionary *dictionary in results) {
        Goal *goal = [[Goal alloc] initWithDictionary:[dictionary objectForKey:@"star"]];
        [goals addObject:goal];
        [goal release];
    }
    
    return goals;    
}

- (NSString *)JSONRepresentation {    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:self.user_id forKey:@"user_id"];
    [attributes setValue:self.x_coord forKey:@"x_coord"];
    [attributes setValue:self.y_coord forKey:@"y_coord"];

    
    NSMutableDictionary *params = 
        [NSMutableDictionary dictionaryWithObject:attributes forKey:@"star"];
    
    return [params JSONRepresentation];
}

@end
