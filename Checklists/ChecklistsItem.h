

@interface ChecklistsItem : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, assign, getter = isChecked) BOOL checked;

@end
