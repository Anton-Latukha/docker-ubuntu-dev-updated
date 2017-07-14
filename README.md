# Image for development of Ubuntu based images

[![Release][release-img]][release-url]

<div class="row">

  <div class="col-sm-4"><img class="width="200px" src="https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/docker-logo.svg" alt="Docker"></div>
  
  <div class="col-sm-4"><img class="width="200px" src="https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/ubuntu-logo.svg" alt="Ubuntu"></div>
  
  <div class="col-sm-4"><img class="width="200px" src="https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/dev-logo.svg" alt="dev"></div>
  
  </div>
  
</div>


![Docker](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/docker-logo.svg)
![Ubuntu](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/ubuntu-logo.svg)
![dev](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/dev-logo.svg)


| ![Docker](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/docker-logo.svg) | 
![Ubuntu](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/ubuntu-logo.svg) | 
![dev](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/dev-logo.svg) |

| ![Docker](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/docker-logo.svg) | ![Ubuntu](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/ubuntu-logo.svg) | ![dev](https://cdn.rawgit.com/Anton-Latukha/docker-ubuntu-dev-updated/master/images/dev-logo.svg) |

----
Image for more convenient and rapid  development on Ubuntu-base images.

But don't forget to switch `FROM` on moving toward production.

* Image is always stays current. You can always do `docker pull latukha/ubuntu-dev-updated` for up to date state of Ubuntu distribution. So your development stay current. Stock Ubuntu image updates ~1 month, but it happens very sporadically, so updates can surprise with problems. Ubuntu-dev image is always current, so current update errors get tracked and sorted-out on development.
* `ENV DEBIAN_FRONTEND noninteractive` used, that disables ncurses interactive menus used in some packages.
* `update` and `upgrade` layers preserved. Start image with your `RUN apt-get update` and `RUN apt-get upgrade` - they in Docker cache already.
* `/var/lib/apt/lists/*` package metadata information preserved, so `apt-get update` not redownloads data every time on your builds, `apt` already has it stored.
----

## Installation

Linux & Windows & OS X:

```sh
docker pull latukha/ubuntu-dev-updated
```

## Usage example

It is a base image, just use it to build your solution, like:

```Dockerfile
FROM latukha/ubuntu-dev-updated
RUN apt update 
RUN apt upgrade
MAINTAINER Your Name <mail@addres.com>
RUN apt install -y --no-install-recommends <packages>
...
```

While image reach stable setup move MAINTAINER on top, switch to Ubuntu, optimize resulting Dockerfile.

_For more examples and usage, please refer to the [Wiki][wiki]._

## Discussion, suggestions

Proposing features and voting happens at:
(http://www.tricider.com/brainstorming/31pIk5URCjR)

## Development on this image

Ways to develop:

a) Straight creating Dockerfile for image, on top of this image.

b) Logging in to container, with `docker run -it latukha/ubuntu-dev-updated /bin/bash`. Building setup and observing process live. Then `exit`. And it can be saved with `docker commit --author "Name mail@email.com" --pause <containerID> <your/repository><:tag>`, and then pushed. Better translate youw work to Dockerfile. And build new image from it.

c) Using a mix of Dockerfile and live logging in to your image container `docker run -it <image> /bin/bash`

## Release History

* 1.0.0
    * ENV DEBIAN_FRONTEND noninteractive
    * RUN apt update && apt upgrade && apt autoclean && apt autoremove
    * RUN apt-get update
    * RUN apt-get upgrade
    * README.md and starting work

## Contributing

Happy for improvements and reuse by you.

Anton Latukha – [@piroxiline](https://twitter.com/piroxiline) – Anton.Latukha+docker@gmail.com

1. Fork it (https://github.com/Anton-Latukha/docker-ubuntu-dev-updated/fork)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Please tick `Squash and merge` while creating Pull Request
6. Send the Pull Request
7. Thank you 8)

<!-- Markdown link & img dfn's -->
[release-img]: https://img.shields.io/badge/release-1.0.0-brightgreen.svg?style=flat-square
[release-url]: https://github.com/Anton-Latukha/docker-ubuntu-dev-updated
[wiki]: https://github.com/Anton-Latukha/docker-ubuntu-dev-updated/wiki
