#import "Tweak.h"



%group AppDoc

%hook SBIconView


%property (nonatomic, retain) UISwipeGestureRecognizer *swipeGesture;

- (void)setLocation:(long long)arg1 {

  %orig;

  if (!self.swipeGesture) {

    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(appdocSwipe:)];

    self.swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;

    [self addGestureRecognizer:self.swipeGesture];
  }
}


%new
- (void)appdocSwipe:(UISwipeGestureRecognizer *)recognizer {


		if (self.isInDock) return;

		  NSString *bundleID = [self.icon applicationBundleID];

		  if (!bundleID) return;
		  if ([bundleID isEqualToString:@"com.textasticapp.textastic-universal"]) return;



		  LSApplicationProxy *proxy = [%c(LSApplicationProxy) applicationProxyForIdentifier:bundleID];
		  if (!proxy) return;

		  NSURL *dataURL = [proxy dataContainerURL];
		  if (!dataURL) return;

		  NSString *oFilza = [NSString stringWithFormat:@"%@%@", @"filza://view", [dataURL.path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]]];


		  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Open In Filza" message:nil preferredStyle:UIAlertControllerStyleAlert];

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


