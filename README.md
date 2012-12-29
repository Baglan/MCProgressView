# MCProgressBarView

Progress bar view with custom images.

![Sample](https://raw.github.com/Baglan/MCProgressView/master/sample.png)

## Installation

Copy files from the 'Classes' folder into your project.

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

## License

Code in this project is available under the MIT license.