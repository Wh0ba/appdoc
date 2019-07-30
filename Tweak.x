#import "Tweak.h"




%group AppDoc

%hook SBIconView


%property (nonatomic, retain) UISwipeGestureRecognizer *swipeUpGesture;

- (void)setLocation:(long long)arg1 {

  %orig;

  if (!self.swipeUpGesture) {

    self.swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedUp:)];

    self.swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;

    [self addGestureRecognizer:self.swipeUpGesture];
  }
}


%new
- (void)swipedUp:(UISwipeGestureRecognizer *)recognizer {

		  NSString *bundleID = [self.icon applicationBundleID];

		  if (!bundleID) return;



		  LSApplicationProxy *proxy = [%c(LSApplicationProxy) applicationProxyForIdentifier:bundleID];
		  if (!proxy) return;

		  NSURL *dataURL = [proxy dataContainerURL];
		  if (!dataURL) return;

		  NSString *oFilza = [NSString stringWithFormat:@"%@%@", @"filza://view", [dataURL.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]]];


		  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"AppDoc" message:@"Open In Filza?" preferredStyle:UIAlertControllerStyleAlert];

		  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Open" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

					 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:oFilza]];

		  }];

		  UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
		  [alert addAction:cancel];
		  [alert addAction:ok];
		  [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

%end //end SBIconView hook
%end //end Group



%ctor {
	%init(AppDoc);
}
