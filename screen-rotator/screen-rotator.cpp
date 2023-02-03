// c++ -Wall -Wextra -O3 screen-rotator.cpp -o ~/bin/screen-rotator

#include <csignal>
#include <fstream>
#include <iostream>
#include <unistd.h>

// On the OneMix 3, the sensor lives in the screen, and is configured as follows, when observed from laptop orientation
// x = upward
// y = rightward
// z = out of screen
//
// The matrices are correct, but the xrandr output orientation is rotated once left to accomodate this device's orientation in the chassis.
#define SYSFS "/sys/bus/iio/devices/iio:device0/"

static const char * const mtx_ident[]   = {"1", "0", "0", "0", "1", "0", "0", "0", "1"};
static const char * const mtx_inverse[] = {"-1", "0", "1", "0", "-1", "1", "0", "0", "1"};
static const char * const mtx_left[]    = {"0", "-1", "1", "1", "0", "0", "0", "0", "1"};
static const char * const mtx_right[]   = {"0", "1", "0", "-1", "0", "1", "0", "0", "1"};

int main() {
	std::signal(SIGCHLD, SIG_IGN);

	chdir(std::getenv("HOME"));

	bool verbose                  = std::getenv("VERBOSE");
	const char * const * last_mtx = NULL;

start:
	// usleep(150 * 1000);
	sleep(1);

	if(!access(".cache/no-spin-screen", F_OK))
		goto start;

	double x{}, y{}, z{}, scale{};  // no offsets on this device
	std::ifstream{SYSFS "in_accel_x_raw"} >> x;
	std::ifstream{SYSFS "in_accel_y_raw"} >> y;
	std::ifstream{SYSFS "in_accel_z_raw"} >> z;
	std::ifstream{SYSFS "in_accel_scale"} >> scale;

	x = (x + 0.0) * scale;
	y = (y + 0.0) * scale;
	z = (z + 0.0) * scale;

	if(verbose)
		std::cout << x << "\t" << y << "\t" << z << "\t(" << scale << ")\t";

	if(std::abs(z) > 8.5) {
		if(verbose)
			std::cout << "flat\n";
		goto start;
	}

	const char * rot{};
	const char * deg{};
	const char * const * mtx{};
	if(std::abs(x) > std::abs(y)) {
		// verticaler
		if(verbose)
			std::cout << ((x < 0) ? "upright" : "inverse") << "\n";
		rot = (x < 0) ? "left" : "right";
		mtx = (x < 0) ? mtx_ident : mtx_inverse;
		deg = (x < 0) ? "0" : "180";
	} else {
		// horizontaler
		if(verbose)
			std::cout << ((y < 0) ? "left" : "right") << "\n";
		rot = (y < 0) ? "normal" : "inverted";
		mtx = (y < 0) ? mtx_right : mtx_left;
		deg = (x < 0) ? "270" : "90";
	}

	if(mtx == last_mtx)
		goto start;

	if(vfork() == 0) {
		execl("/bin/xrandr", "xrandr", "--output", "eDP-1", "--rotate", rot, (void *)nullptr);
		_exit(69);
	}

	for(auto && prop :
	    {"GXTP7386:00 27C6:0113", "GXTP7386:00 27C6:0113 Stylus Pen (0)", "GXTP7386:00 27C6:0113 Stylus Eraser (0)", "HAILUCK CO.,LTD USB KEYBOARD Mouse"})
		if(vfork() == 0) {
			execl("/bin/xinput", "xinput", "set-prop", prop, "Coordinate Transformation Matrix",  //
			      mtx[0], mtx[1], mtx[2], mtx[3], mtx[4], mtx[5], mtx[6], mtx[7], mtx[8], (void *)nullptr);
			_exit(69);
		}

	if(vfork() == 0) {
		execl(".fehbg", ".fehbg", deg, (void *)nullptr);
		_exit(69);
	}


	last_mtx = mtx;
	goto start;
}
