# chromium-lambda-build

Lambda supported [Chromium](https://opensource.google/projects/chromium) browser build (lightweight, headless shell).

This purpose of this build is to workaround AWS [Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html) container image [read-only restrictions](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-reqs).

## Dependencies

- [Docker](https://www.docker.com/get-started)

## System requirements

- 40GB of free disk space
- 8GB memory available

## Start the compilation process

    $ docker build -t chromium-headless .
    $ docker run -d -v $PWD:$PWD -w $PWD chromium-headless

### Build time

This soley depends on your network speed and system hardware.

For example, when run on a fast network using a system running an [Intel i7](https://www.intel.com/content/www/us/en/products/details/processors/core/i7.html) with 32GB RAM the entire process takes about 4 hours to complete.  Moveover, this processing time can be further reduced by writing to an [SSD](https://en.wikipedia.org/wiki/Solid-state_drive) / [SSHD](https://en.wikipedia.org/wiki/Hybrid_drive) in conjunction with proper [sysctl](https://www.golinuxcloud.com/sysctl-config-for-high-performance-servers) tuning.

## References

- [Docker requirements](https://chromium.googlesource.com/chromium/src/+/main/docs/linux/build_instructions.md#Docker-requirements)
- [GN build configuration](https://www.chromium.org/developers/gn-build-configuration)
- [GN args template](https://source.chromium.org/chromium/chromium/src/+/main:build/args/headless.gn)

## Versioning

This package is maintained under the [Semantic Versioning](https://semver.org) guidelines.

## License and Warranty

This package is distributed in the hope that it will be useful, but without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose.

_chromium-lambda-build_ is provided under the terms of the [MIT license](http://www.opensource.org/licenses/mit-license.php)

[AWS](https://aws.amazon.com) is a registered trademark of Amazon Web Services, Inc.

## Author

[Marc S. Brooks](https://github.com/nuxy)
