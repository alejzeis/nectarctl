import std.stdio;
import std.conv;
import std.getopt;

import consoled : foreground, Fg, FontStyle, writec;

immutable string SOFTWARE_VERSION = "nectarctl 1.6.2-0";
immutable size_t API_VERSION_MAJOR = 6;
immutable size_t API_VERSION_MINOR = 2;
immutable string NECTAR_VERSION = "API " ~ to!string(API_VERSION_MAJOR) ~ "-" ~ to!string(API_VERSION_MINOR);

int main(string[] args) {
	auto old = foreground;

	if(args.length < 2) {
		writec(Fg.lightRed, "Arguments required. Type \"nectarctl --help\" for a list of options.\n");
		foreground = old;
		return 1;
	}

	bool help = false, version_ = false;
	getopt(args, "help", &help, "version", &version_);

	if(help) {
		writeln("Usage: \"nectarctl [args]\"\n");
		writeln("--help   \t\tDisplays usage information on how to use nectarctl.");
		writeln("--version\t\tDisplays the version information of nectarctl.");
	}

	if(version_) {
		writeln("nectarctl version: \"" ~ SOFTWARE_VERSION ~ "\"");
		writeln("Nectar API version: \"" ~ NECTAR_VERSION ~ "\"");
	}

	foreground = old;
	return 0;
}
