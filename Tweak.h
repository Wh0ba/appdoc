

@interface SBIcon : NSObject
- (BOOL)isApplicationIcon;
- (NSString *)applicationBundleID;
- (NSString *)leafIdentifier;
@end

@interface SBIconView : UIView
@property (nonatomic,retain) SBIcon *icon;
@property (nonatomic, retain) UISwipeGestureRecognizer * swipeGesture;
@property (nonatomic, assign) BOOL isInDock;
@end



@interface SBSApplicationShortcutItem : NSObject <NSCopying>

@property (nonatomic,copy) NSString * type;
@property (nonatomic,copy) NSString * localizedTitle;
@property (nonatomic,copy) NSString * localizedSubtitle;
@property (nonatomic,copy) NSString * bundleIdentifierToLaunch;

@end

@interface SBUIAppIconForceTouchControllerDataProvider : NSObject

-(NSString *)applicationBundleIdentifier;

@end




@interface LSApplicationProxy : NSObject
@property (nonatomic, readonly) long bundleModTime;
@property (nonatomic, readonly) NSString *applicationIdentifier;
@property (nonatomic, readonly) NSDictionary *entitlements;
@property (nonatomic, readonly) NSString *signerIdentity;
@property (nonatomic, readonly) BOOL profileValidated;
@property (nonatomic, readonly) NSString *shortVersionString;
@property (nonatomic, readonly) NSNumber *staticDiskUsage;
@property (nonatomic, readonly) NSString *teamID;
@property (nonatomic, readonly) NSURL *bundleURL;
@property (nonatomic, readonly) NSURL *dataContainerURL;
@property (nonatomic,readonly) NSString * applicationType; 
+ (id)applicationProxyForIdentifier:(id)arg1;
- (BOOL)isSystemOrInternalApp;
- (id)localizedName;
@end