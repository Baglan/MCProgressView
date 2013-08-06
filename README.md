# MCProgressBarView

Progress bar view with custom images.

![Sample](https://raw.github.com/Baglan/MCProgressView/master/sample.png)

## Installation

1. Add the QuartzCore framework to your project;
2. Copy files from the 'Classes' folder into your project.

## Usage

You will first need to create custom images for background and foreground or copy the ones coming with this project to your project.

	#import "MCProgressBarView.h"
	
Initialize the images:

    UIImage * backgroundImage = [[UIImage imageNamed:@"progress-bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    UIImage * foregroundImage = [[UIImage imageNamed:@"progress-fg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)];

Notice the [UIImage -resizableImageWithCapInsets:] call. You can read more about it in the documnetation for this method. Essentiually, it defines which parts of the image will not be stretched when image is resized. Here, it's used to mark the left and the right edges.

Create the view and add it to the view hierarchy:

	MCProgressBarView * _progressBarView = [[MCProgressBarView alloc] initWithFrame:CGRectMake(25, 100, 270, 20)
		backgroundImage:backgroundImage
		foregroundImage:foregroundImage];
		
    [self.view addSubview:_progressBarView];
	
Now, the progress you set (in the range of 0.0 to 1.0), will be reflected in the component:

	_progressBarView.progress = 0.25;

### offsetForZero

[Matt Curtis](https://github.com/matt-curtis) pointed out that when progress is 0.0, there is still some initial progress indicator shown (see the image above). After some consideration, I've decided that there are situations when that is desirable and some situations when no progress should be shown. To address this, a new property has been added:

    @property (nonatomic, assign) CGFloat offsetForZero;

The default value of this property is the sum of the left and the right cap inset for the foreground image. To "taper off" the initial size of the progress indicator, you can set it to a lower value. For the images in the sample project, that value can be set to 10.0:

    progressBarView.offsetForZero = 10.0;

See the sample image above to see the effect. That value can vary depending on the images you use in your project.

## License

Code in this project is available under the MIT license.