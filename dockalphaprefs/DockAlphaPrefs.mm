#import <Preferences/Preferences.h>

@interface DockAlphaPrefsListController: PSListController {
}
@end

@implementation DockAlphaPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"DockAlphaPrefs" target:self] retain];
	}
	return _specifiers;
}

-(void) killSpringBoard {
	system("/usr/bin/killall -9 SpringBoard");
}
@end

// vim:ft=objc
