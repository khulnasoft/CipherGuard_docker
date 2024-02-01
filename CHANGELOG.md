# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased](https://github.com/khulnasoft/cipherguard_docker/compare/4.0.0...HEAD)

## [4.0.0](https://github.com/khulnasoft/cipherguard_docker/compare/v3.10.0...4.0.0) - 2023-06-15

### Changed
- bookworm as base container
- php version set to 8.2
- Mariadb set to 10.11
- Updated rootless superchronic to 0.2.25
- Supervisor php-fpm command updated to php-fpm8.2
- Small refactor in kitchen tests

## [3.10.0](https://github.com/khulnasoft/cipherguard_docker/compare/v3.9.4...v3.10.0) - 2023-05-02

### Added
- Make rootless docker image to own the supervisor files [#197](https://github.com/khulnasoft/cipherguard_docker/pull/197)

## [3.9.4](https://github.com/khulnasoft/cipherguard_docker/compare/v3.9.3...v3.9.4) - 2023-04-18

### Added
- Update mariadb to version 10.10 [#190](https://github.com/khulnasoft/cipherguard_docker/pull/190)
- Added CIPHERGURD_GPG_SERVER_KEY_FINGERPRINT_FORCE env variable. Fixes [#192](https://github.com/khulnasoft/cipherguard_docker/issues/192)
- Arm arch support for arm64/v8, arm/v7 and arm/v5 linux architectures.

## [3.9.3](https://github.com/khulnasoft/cipherguard_docker/compare/v3.9.2...v3.9.3) - 2023-03-17

### Added
- Allow SHA1 overwrite from build_args [#191](https://github.com/khulnasoft/cipherguard_docker/pull/191)
- Bumped supercronic to latest version on rootless images 0.2.2
- Updated dev container to work with ldap

### Fixed
- Docker compose ports [#180](https://github.com/khulnasoft/cipherguard_docker/pull/180)

## [3.9.2](https://github.com/khulnasoft/cipherguard_docker/compare/v3.9.1...v3.9.2) - 2023-02-09

### Fixed
- Fix trivy entrypoint on vulnerability test jobs

## [3.9.1](https://github.com/khulnasoft/cipherguard_docker/compare/v3.9.0...v3.9.1) - 2023-01-31

### Fixed
- Github actions on new path for development composer files

## [3.9.0](https://github.com/khulnasoft/cipherguard_docker/compare/v3.8.1...v3.9.0) - 2023-01-31

### Changed

- Now environment is dumped during entrypoint script running instead of during cron runs
- Migrations are executed without clearing the cache by default and only core and model caches are cleared.

### Added

- Development only: Configuration for xdebug to ease working with IDES

### Fixed

- Ports for rootless version pointing to 4433 on docker-compose files

## [3.8.1](https://github.com/khulnasoft/cipherguard_docker/compare/v3.8.0...v3.8.1) - 2023-01-18

### Changed

- Minor changes on the internal publishing process

## [3.8.0](https://github.com/khulnasoft/cipherguard_docker/compare/v3.7.5...v3.8.0) - 2023-01-13

### Added

- Support for docker secrets
- Shellspec for entrypoint testing

### Changed

- Entrypoint refactor in separated libraries for increased testability

## [3.7.5](https://github.com/khulnasoft/cipherguard_docker/compare/v3.7.4...v3.7.5) - 2022-12-01

### Added

- Improved logging for cron tasks

## [3.7.4](https://github.com/khulnasoft/cipherguard_docker/compare/v3.7.3...v3.7.4) - 2022-11-17

### Added

- Directory sync commands on docker-compose pro

### Fixed

- Multiple merge request from community. Thanks a lot to all of you who contributed!

## [3.7.3](https://github.com/khulnasoft/cipherguard_docker/compare/v3.0.2...v3.7.3) - 2022-11-04

### Added

- PB-19792 add github actions to automate release creation
- Fix dev Dockerfile ln command syntax
- PB-19311: directory sync command on entrypoint for pro
- PB-14006: docker-compose file for postgresql
- Add new subscription file machinery
- Add pro dependencies

### Changed
- Default key length from 2048 to 3072
- Bump php version to 8 on dev Dockerfile
- PB-14373 fix composer files
- PB-14373 use relative paths on build field
- PB-14373 bump php version to 7.4
- PB-14111: Set https://cipherguar.local as APP_FULL_BASE_URL
- PB-13681 add subaltname parameter on the automatic certs
- PB-13552 check jwt variable before executing create_jwt_keys
- PB-13533 add create_jwt_keys in the entrypoint
- PB-13533 remove jwt keys during build
- Security upgrade php from 7.3.31-fpm to 7.3.33-fpm
- Refactor dockerfile args and vars
- PB-9399 fix ipv6 http port on rootless image
- Security upgrade php from 7.3.30-fpm to 7-fpm
- PB-8416 Use debian 11 image as base image.
- Fix deprecated license path
- Add CIPHERGURD_FLAVOUR env variable
- Fix ln command syntax

## [3.0.2](https://github.com/khulnasoft/cipherguard_docker/compare/v3.0.1...v3.0.2) - 2021-03-12

- This is a sync release. Check [changes](https://github.com/khulnasoft/cipherguar_api/compare/v3.0.1...v3.0.2) for cipherguar_api

## [3.0.1](https://github.com/khulnasoft/cipherguard_docker/compare/v3.0.0...v3.0.1) - 2021-02-24

- This is a sync release. Check [changes](https://github.com/khulnasoft/cipherguar_api/compare/v3.0.0...v3.0.1) for cipherguar_api

## [3.0.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.13.5...v3.0.0) - 2021-02-23

We are happy to announce the release of cipherguar docker 3.0.0!

This release contains cipherguar-api 3.0.0 as well as some new additions and deprection
notices.

Cipherguard docker images now rely on cipherguar's debian package. As a result the dockerfiles
are now using debian-slim as base images and not longer rely on docker php library images.

As a result of using debian packages some paths such as /var/www/cipherguar are going to be
deprecated. This release still supports both paths by symlinking so users should not
be impacted by the path changes. We strongly recommend that you update your volumes
accordingly.

We have also released a rootless image that runs entirely under www-data user and uses
supercronic instead of plain cron to run the background tasks. We aim to make a transition
to rootless images by default to make our docker images a bit more secure by default.
However, rootless alternatives are still considered beta.

As with this release cipherguar images are no longer tagged with the '-debian' suffix. Instead:

- Cipherguard docker CE images will be tagged as: khulnasoft/cipherguard:<version>-ce
- Cipherguard docker CE rootless images will be tagged as: khulnasoft/cipherguard:<version>-ce-non-root
- Cipherguard docker pro images will be tagged as: khulnasoft/cipherguard:<version>-pro
- Cipherguard docker pro rootless images will be tagged as: khulnasoft/cipherguard:<version>-pro-non-root

You can still find the old Dockerfiles on the dev/ directory as they are still quite
handy for development purposes.

### Added

- New debian package based docker images
- New rootless images
- Supercronic introduced on rootless images

### Changed

- Cipherguard installation uses official cipherguar debian packages
- /var/www/cipherguar files are now in /usr/share/php/cipherguar
- /var/www/cipherguar/config files are no in /etc/cipherguar
- Default workdir is now /usr/share/php/cipherguar
- Old docker images moved to dev/ directory
- debian Dockerfiles moved to debian/ directory
- Deprecation message is shown on startup of the containers if old paths detected

## [2.13.5](https://github.com/khulnasoft/cipherguard_docker/compare/v2.13.1...v2.13.5) - 2020-08-04

- Cipherguard api bumped to 2.13.5

## [2.13.1](https://github.com/khulnasoft/cipherguard_docker/compare/v2.13.0...v2.13.1) - 2020-07-07

- Cipherguard api bumped to 2.13.1

## [2.13.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.12.1...v2.13.0) - 2020-06-23

- Cipherguard api bumped to 2.13.0
- PHP version pinned to 7.3.19

## [2.12.1](https://github.com/khulnasoft/cipherguard_docker/compare/v2.12.0...v2.12.1) - 2020-04-14

### Changed

- Dockerfile pins specific php version for better control
- Cipherguard code version bumped to 2.12.1

## [2.12.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.11.0...v2.12.0) - 2019-12-06

### Changed

- Timeout set to 0 in wait-for.sh. Fixes [#133](https://github.com/khulnasoft/cipherguard_docker/issues/133)

## [2.11.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.10.0...v2.11.0) - 2019-08-08

### Changed

- Base Container switched to php7.3 and debian 10
- Entrypoint runs supervisor with exec to take over PID 1
- Minor changes: Maintainer label

## [2.10.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.9.0...v2.10.0) - 2019-05-16

- This is a sync release. Check [changes](https://github.com/khulnasoft/cipherguar_api/compare/v2.9.0...v2.10.0) for cipherguar_api

## [2.9.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.8.4...v2.9.0) - 2019-04-24

### Added

- Build arg to pass headers to curl
- Removed git as dev dependency

### Fixed

- Fix typo in Readme [#125](https://github.com/khulnasoft/cipherguard_docker/pull/125)

## [2.8.4](https://github.com/khulnasoft/cipherguard_docker/compare/v2.8.3...v2.8.4) - 2019-04-17

This is a sync release. Check [changes](https://github.com/khulnasoft/cipherguar_api/compare/v2.8.3...v2.8.4) for cipherguar_api

## [2.8.3](https://github.com/khulnasoft/cipherguard_docker/compare/v2.8.2...v2.8.3) - 2019-04-02

### Added

- Documentation for CIPHERGURD_PLUGINS_EXPORT_ENABLED and CIPHERGURD_PLUGINS_IMPORT_ENABLED

## [2.8.2](https://github.com/khulnasoft/cipherguard_docker/compare/v2.8.1...v2.8.2) - 2019-04-01

This is a sync release. Check [changes](https://github.com/khulnasoft/cipherguar_api/compare/v2.8.1...v2.8.2) for cipherguar_api

## [2.8.1](https://github.com/khulnasoft/cipherguard_docker/compare/v2.7.1...v2.8.1) - 2019-04-01

### Added

- Documentation for new env variable APP_BASE to use cipherguar in a subfolder
- Added wait-for.sh to the docker image as part of [#123](https://github.com/khulnasoft/cipherguard_docker/pull/123)

### Fixed

- Now cipherguar checks for the mysql status outside of the docker image [#97](https://github.com/khulnasoft/cipherguard_docker/issues/97)

## [2.7.1](https://github.com/khulnasoft/cipherguard_docker/compare/v2.7.0...v2.7.1) - 2019-02-13

### Added

- Use php.ini-production for saner defaults in php

## [2.7.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.5.0...v2.7.0) - 2019-02-12

### Fixed

- Added small warning message when entropy is low at container startup [#121](https://github.com/khulnasoft/cipherguard_docker/issues/121)

## [2.5.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.4.0...v2.5.0) - 2018-11-15

### Added

- Enabled opcache extension to increase overall performance

## [2.4.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.3.0...v2.4.0) - 2018-10-15

### Added

- Merged: Adding SSL configuration for mysql/mariadb [#111](https://github.com/khulnasoft/cipherguard_docker/pull/111)

### Fixed

- Minor fix: Remove duplicate arg PHP_EXTENSIONS from Dockerfile

## [2.3.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.2.0...v2.3.0) - 2018-09-03

See [Changes](https://github.com/khulnasoft/cipherguar_api/compare/v2.2.0...v2.3.0) for cipherguar_api

## [2.2.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.1.0...v2.2.0) - 2018-08-13

### Added

- Added [wait-for-it](https://github.com/vishnubob/wait-for-it) instead of wait for to eliminate netcat dependency

### Changed

- Merged: hide nginx and php version [#107](https://github.com/khulnasoft/cipherguard_docker/pull/107)
- Merged: restrict MySQL port access [#109](https://github.com/khulnasoft/cipherguard_docker/pull/109)
- Supervisor config files split into conf.d/{php.conf,nginx.conf,cron.conf}
- Default stdout logging is more verbose now allowing users to see more details on the requests

## [2.1.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.7...v2.1.0) - 2018-06-14

### Fixed

- cron EmailQueue.sender job fails if db password contains certain characters [#105](https://github.com/khulnasoft/cipherguard_docker/issues/105)

## [2.0.7](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.5...v2.0.7) - 2018-05-09

Sync release. See release notes on [https://github.com/khulnasoft/cipherguar_api](cipherguar api repo)

## [2.0.5](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.4...v2.0.5) - 2018-05-08

### Fixed

- Nginx configuration file root directive for cipherguar

## [2.0.4](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.2...v2.0.4) - 2018-04-26

### Fixed

- Authentication plugin 'caching_sha2_password' cannot be loaded [#103](https://github.com/khulnasoft/cipherguard_docker/issues/103)

### Changed

- MariaDB as default SQL backend option in docker-compose files related with [#103](https://github.com/khulnasoft/cipherguard_docker/issues/103)
- Replace php copy with curl for use with proxy [#102](https://github.com/khulnasoft/cipherguard_docker/pull/102)
- Documentation requirements moved up in the README

## [2.0.3](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.2...v2.0.3) - 2018-04-20

### Fixed

- Updated path for images volume. [#101](https://github.com/khulnasoft/cipherguard_docker/pull/101)

### Changed
- Run cipherguar migrate task instead of cake migrations migrate

## [2.0.2](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.1...v2.0.2) - 2018-04-17

### Fixed

- Unable to load a jpeg image as avatar. [#100](https://github.com/khulnasoft/cipherguard_docker/issues/100)
- docker-entrypoint.sh adds email-sending-job everytime you restart the container. [#98](https://github.com/khulnasoft/cipherguard_docker/issues/98)

### Changed

- Removed composer binary after dependency installation.

## [2.0.1](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.0...v2.0.1) - 2018-04-09

- Decrypt bug fix. Check https://github.com/khulnasoft/cipherguar_api

## [2.0.0](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.0-rc2...v2.0.0) - 2018-04-09

### Changed

- Base image switched to php:7-fpm (debian based) due performance issues with cipherguar and alpine based images
- Web user is now www-data
- Supervisor provides better logging to stdout
- Upload max filesize increased to 5M for avatar uploads
- README documentation updated
- Composer file loads images directory in cipherguar container as a docker volume

### Added

- Added composer installer signature check according to official composer docs [#91](https://github.com/khulnasoft/cipherguard_docker/pull/91)

## [1.6.10](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.9-1...v1.6.10) - 2018-03-28

### Fixed

- chown fails with Docker Secrets, can't start container [#89](https://github.com/khulnasoft/cipherguard_docker/pull/89)

### Changed

The container base image has been migrated from alpine to debian. The reason behind this change
is that we have detected slower performance in alpine based images. Changing the image introduced a few changes
in the structure of the container:
- Bigger images
- www user is now www-data user
- cron jobs are managed as crontabs in /var/spool/cron/crontabs/root
- Permissions check on the cipherguar base dir has been removed as it was a big performance penalty on startup times.
- Docker hub tags will now follow the CIPHERGURD_VERSION-debian pattern

## [2.0.0-rc2](https://github.com/khulnasoft/cipherguard_docker/compare/v2.0.0-rc1...v2.0.0-rc2) - 2018-02-20

### Changed

- README documentation updated
- PECL_CIPHERGURD_EXTENSIONS, CIPHERGURD_VERSION and CIPHERGURD_URL are now a docker build arg

### Added

- Docker composer files to run cipherguard_docker in different environments
- Codacy badges and reports

### Fixed

- Minor issues regarding bash syntax shellcheck SC2034 and SC2166
- Hadolint DL3003 fixed

## [2.0.0-rc1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.9-1...v2.0.0-rc1) - 2018-01-17

### Changed

- Moved away from plain alpine to php:7-fpm-alpine series
- Environment variables interface has been revamped and moved to application domain [default.php](https://github.com/khulnasoft/cipherguar_api/blob/develop/config/default.php) and [app.default.php](https://github.com/khulnasoft/cipherguar_api/blob/develop/config/app.default.php)
- PHP extensions management no longer using alpine packages
- Introduced [supervisord](http://supervisord.org/) for process monitoring
- Introduced testing framework for development purposes based on [rspec](http://rspec.info/)
- Reduced the dependencies installed in Dockerfile
- Default user moved from nginx to www-data
- Slightly changed paths of gpg serverkeys (<CIPHERGURD_ROOT>/app/Config/gpg/serverkey.private.asc -> <CIPHERGURD_ROOT>/config/gpg/serverkey_private.asc)
- Refactor or docker-entrypoint.sh:
  - Moved away from bash to sh
  - Make it compliant with [shellcheck](https://github.com/koalaman/shellcheck)
  - Removed search and replace commands

## [1.6.9-1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.9...v1.6.9-1) - 2018-01-15

### Fixed

- Fix bug in how the email 'client' is edited. [#84](https://github.com/khulnasoft/cipherguard_docker/pull/84)

## [1.6.9](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.5+1...v1.6.9) - 2018-01-14

This release provides the last cipherguar_api 1.x series release along with several pull requests
and fixes.

### Fixed

- Unable to access default installation with http [#59](https://github.com/khulnasoft/cipherguard_docker/issues/59)
- Check and correct the permissions and ownership of /var/www/cipherguar [#67](https://github.com/khulnasoft/cipherguard_docker/issues/67)
- cp: Unrecognized option -T [#75](https://github.com/khulnasoft/cipherguard_docker/issues/75)
- turn URL config independent from SSL var [#76](https://github.com/khulnasoft/cipherguard_docker/pull/76)
- Set the default MySQL port to 3306 [#77](https://github.com/khulnasoft/cipherguard_docker/pull/77)
- Add environment variable to set email client [#81](https://github.com/khulnasoft/cipherguard_docker/pull/81)


## [1.6.5+1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.5...v1.6.5+1) - 2017-11-14

### Fixed

- Introduce EMAIL_AUTH=false Environment variable [#71](https://github.com/khulnasoft/cipherguard_docker/pull/71)
- Fixed https in App.fullBaseUrl for SSL=false. [#73]( https://github.com/khulnasoft/cipherguard_docker/pull/73)

## [1.6.5](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.3...v1.6.5) - 2017-09-14

- Refer to [cipherguar_api CHANGELOG](https://github.com/khulnasoft/cipherguar_api/blob/master/CHANGELOG.md) for a list of new features and fixes.

### Fixed
- CIPHERGURD-2406: change to LABEL, add docker-compose file for testing [#69](https://github.com/khulnasoft/cipherguard_docker/pull/69)
- CIPHERGURD-2407: Check for email cron before setting it [#63](https://github.com/khulnasoft/cipherguard_docker/issues/63)
- CIPHERGURD-2408: Strict Transport Security (HSTS)	Invalid Server provided more than one HSTS header [#65](https://github.com/khulnasoft/cipherguard_docker/issues/65)
- CIPHERGURD-2410: nginx config sub optimal [#66](https://github.com/khulnasoft/cipherguard_docker/issues/66)

## [1.6.3](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.2+1...v1.6.3) - 2017-08-31

- Refer to [cipherguar_api CHANGELOG](https://github.com/khulnasoft/cipherguar_api/blob/master/CHANGELOG.md) for a list of new features and fixes.

## [1.6.2+1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.2...v1.6.2+1) - 2017-08-16

### Fixed
- CIPHERGURD-2295: Added environment variable DB_PORT for non standard database ports (reopened) [#43](https://github.com/khulnasoft/cipherguard_docker/issues/43)

## [1.6.2](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.1+1...v1.6.2) - 2017-08-16

### Added

- CIPHERGURD-2295: Added environment variable DB_PORT for non standard database ports. [#43](https://github.com/khulnasoft/cipherguard_docker/issues/43)
- CIPHERGURD-2321: Upgraded cipherguar container to latest stable alpine (3.6)

### Fixed
- CIPHERGURD-2319: Fullbaseurl parameter was not changing when specifying URL [#50](https://github.com/khulnasoft/cipherguard_docker/issues/50)
- CIPHERGURD-2320: TLS value on email.php should not be quoted PR[#53](https://github.com/khulnasoft/cipherguard_docker/pull/53)

## [1.6.1+1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.1...v1.6.1+1) - 2017-07-31

### Notes
This release aims to distribute cipherguar-1.6.1 and include most relevant community contributions
The most notable change from user perspective is the switch from lowercase to uppercase environment variables. Users will
have to review their previous scripts and update any environment variable to match the new naming convention. Please refer to PR#39

### Added
- CIPHERGURD-2276: ENV-Variable uppercase convention PR[#39](https://github.com/khulnasoft/cipherguard_docker/pull/39)
- CIPHERGURD-2279: Allow Config files to be symbolic links PR[#32](https://github.com/khulnasoft/cipherguard_docker/pull/32)
- CIPHERGURD-2278: Allow no db environment variable setting PR[#20](https://github.com/khulnasoft/cipherguard_docker/pull/20)
- CIPHERGURD-2280: On MacOS systems note you should access it using https PR[#35](https://github.com/khulnasoft/cipherguard_docker/pull/35)

### Fixed
- CIPHERGURD-2159: Added registration env support PR[#37](https://github.com/khulnasoft/cipherguard_docker/pull/37)

## [1.6.1](https://github.com/khulnasoft/cipherguard_docker/compare/v1.6.0...v1.6.1) - 2017-06-29
### Fixed
- CIPHERGURD-2158: corrected management of fullbaseurl throug url env variable.
- CIPHERGURD-2164: corrected typo on email_transport env variable. [#24](https://github.com/khulnasoft/cipherguard_docker/issues/24)
- CIPHERGURD-2166: http to https redirection fixed. [#19](https://github.com/khulnasoft/cipherguard_docker/issues/19)
- CIPHERGURD-2167: healthcheck does not work on container. [#26](https://github.com/khulnasoft/cipherguard_docker/issues/26)

### Added

- CIPHERGURD-2165: Added TLS support through email_tls env variable. [#25](https://github.com/khulnasoft/cipherguard_docker/issues/25)

## [1.6.0](https://github.com/khulnasoft/cipherguard_docker/compare/v1.5.1...v1.6.0) - 2017-06-23
### Added
- Added email set up support though environment variables
- Added cronjob to send queued emails
- Automated builds on the docker hub
- Updated README documentation

### Fixed
- Image build fails when using alpine:latest. Switched to alpine:3.5
- Deletion of passwords on docker image
- Avoid importing already imported secret keys on the gpg keyring