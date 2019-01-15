#import "RNTMiniMediaControlsViewController.h"

@implementation RNTMiniMediaControlsViewController

- (void)loadView {
    /// make a empty view to self.view
    /// after calling [super loadView], self.view won't be nil anymore.
    [super loadView];
    
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 50, 320, 430)];
};

- (void)viewDidLoad {
    [super viewDidLoad];
    GCKCastContext *castContext = [GCKCastContext sharedInstance];
    _miniMediaControlsViewController = [castContext createMiniMediaControlsViewController];
    _miniMediaControlsViewController.delegate = self;
    
    [self updateControlBarsVisibility];
    [self installViewController:_miniMediaControlsViewController
                inContainerView:_miniMediaControlsContainerView];
}

- (void)setMiniMediaControlsViewEnabled:(BOOL)miniMediaControlsViewEnabled {
    _miniMediaControlsViewEnabled = miniMediaControlsViewEnabled;
    if (self.isViewLoaded) {
        [self updateControlBarsVisibility];
    }
}

- (void)updateControlBarsVisibility {
    if (self.miniMediaControlsViewEnabled &&
        _miniMediaControlsViewController.active) {
        _miniMediaControlsHeightConstraint.constant =
        _miniMediaControlsViewController.minHeight;
        [self.view bringSubviewToFront:_miniMediaControlsContainerView];
    } else {
        _miniMediaControlsHeightConstraint.constant = 0;
    }
    [UIView animateWithDuration:kCastControlBarsAnimationDuration
                     animations:^{
                         [self.view layoutIfNeeded];
                     }];
    [self.view setNeedsLayout];
}

- (void)installViewController:(UIViewController *)viewController
              inContainerView:(UIView *)containerView {
    if (viewController) {
        [self addChildViewController:viewController];
        viewController.view.frame = containerView.bounds;
        [containerView addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
    }
}

- (void)uninstallViewController:(UIViewController *)viewController {
    [viewController willMoveToParentViewController:nil];
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"NavigationVCEmbedSegue"]) {
        self.navigationController =
        (UINavigationController *)segue.destinationViewController;
    }
}

#pragma mark - GCKUIMiniMediaControlsViewControllerDelegate events
- (void)miniMediaControlsViewController:(GCKUIMiniMediaControlsViewController *)
miniMediaControlsViewController
                           shouldAppear:(BOOL)shouldAppear {
    [self updateControlBarsVisibility];
}


@end
