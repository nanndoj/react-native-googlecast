#import <GoogleCast/GoogleCast.h>

static const NSTimeInterval kCastControlBarsAnimationDuration = 0.20;

@interface RNTMiniMediaControlsViewController: UIViewController<GCKUIMiniMediaControlsViewControllerDelegate> {
    __weak IBOutlet UIView *_miniMediaControlsContainerView;
    __weak IBOutlet NSLayoutConstraint *_miniMediaControlsHeightConstraint;
    GCKUIMiniMediaControlsViewController *_miniMediaControlsViewController;
}

@property(nonatomic, weak, readwrite) UINavigationController *navigationController;

@property(nonatomic, assign, readwrite) BOOL miniMediaControlsViewEnabled;
@property(nonatomic, assign, readwrite) BOOL miniMediaControlsItemEnabled;

@end
