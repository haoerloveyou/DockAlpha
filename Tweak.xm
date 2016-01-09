#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


static void killSpringBoard() {
	system("/usr/bin/killall -9 SpringBoard");
}

@interface SBWallpaperEffectView : UIView
@end

@interface SBDockView : UIView
@property(nonatomic) CGFloat alpha;
@property(retain, nonatomic) SBWallpaperEffectView *_backgroundView;
@end

%hook SBDockView

- (void)setBackgroundAlpha:(double)arg1
{
	%orig;
	id r = [[NSUserDefaults standardUserDefaults] objectForKey:@"DockAlpha"];
	#if CGFLOAT_IS_DOUBLE // Thanks PoomSmart!
		CGFloat tintAlpha = r ? [r doubleValue] : 0.65f;
		#else
		CGFloat tintAlpha = r ? [r floatValue] : 0.65f;
		#endif
	 MSHookIvar<SBWallpaperEffectView *>(self, "_backgroundView").alpha = tintAlpha;
}

- (void)layoutSubviews
{
	%orig;
}
%end