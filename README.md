# Quick reference

Nothing special, just adds aws-cli v2 on top of official [Gradle image](https://hub.docker.com/_/gradle). This is to 
support interactions with AWS (deployment, publishing/downloading artifacts) in Bitbucket Pipelines, but can be used 
elsewhere as well. 

`amd64` and `arm64` architectures are supported at this moment.

Maintained by: [Bitweb OÜ](https://bitweb.ee). Updates are published every Sunday.

# Supported tags

Only Gradle versions supported by [Gradle](https://endoflife.date/gradle) are published.

Supported Java versions: 8, 11, 17, 21, 25.

If the version you need is not listed, or you need different architecture, please contact Bitweb at [tech@bitweb.ee](mailto:tech@bitweb.ee).

# Usage in Bitbucket Pipelines

It's recommended to specify only major version, this way you'll stay up-to-date with security and other updates.

    image: bitweb/gradle-awscli:9-jdk25

-- OR --

    image: bitweb/gradle-awscli:9-jdk21

-- OR --

    image: bitweb/gradle-awscli:9-jdk17

-- OR --

    image: bitweb/gradle-awscli:8-jdk11

## Deployment

Deployment is done automatically to Docker Hub from master branch. Updates are automatically done every Sunday. 

New Gradle/JDK versions need to be added manually.

Tags with patch versions will not be tolerated and provided.

## Adding a new version (tag)

1. Create a new Pipeline step (in `bitbcuket-pipelines.yml`), that extends base step and specifies deployment name and 
description. Deployment name must follow the following convention: _{gradle-version}-{jdk-version}_ Dots are not 
allowed, so remove them: 7.3-jdk11 -> 73-jdk11
2. Add the step to master list
3. Update readme
4. Create the deployment environment in production [Bitbucket Pipelines](https://bitbucket.org/bitwebou/infra-docker-gradle-awscli/admin/pipelines/deployment-settings)
5. Add deployment variable with name _VERSION_ and value as tag name from base Gradle image
6. Push and validate
7. Update README in Docker Hub. Skip _Deployment_ and _Adding a new version_ headings.

# License

View license information for [Gradle](https://gradle.org/license/) and [aws-cli v2](https://github.com/aws/aws-cli/blob/develop/LICENSE.txt).

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc
from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies 
with any relevant licenses for all software contained within.

THIS PROJECT IS NOT ENDORSED IN ANY WAY BY AMAZON OR GRADLE. 
ALL TRADEMARKS AND COPYRIGHT BELONG TO THEIR RESPECTIVE OWNERS.

# TODO

* `latest` tag (needs separating gradle image and our image tag in deployment)
