# Quick reference

Nothing special, just adds aws-cli v2 on top of official [Gradle image](https://hub.docker.com/_/gradle). This is to 
support interactions with AWS (deployment, publishing/downloading artifacts) in Bitbucket Pipelines, but can be used 
elsewhere as well. 

`amd64` and `arm64` architectures are supported at this moment.

Maintained by: [Bitweb OÜ](https://bitweb.ee).

# Supported tags

Only Gradle versions actively supported by [Gradle](https://endoflife.date/gradle) are published.

Supported Java versions: 8, 11, 17, 21, 25.

If the version you need is not available, or you need different architecture, please file an issue in this repository. Pull requests are also very welcome.

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

Deployment is done automatically to Docker Hub from main branch. Updates are made when new Gradle versions are published.

New Gradle/JDK versions need to be added manually.

## Adding a new version (tag)

1. Add new version to respective JDK arrays in [build workflow](https://github.com/BitWeb/docker-gradle-awscli/blob/main/.github/workflows/build.yml)
2. Update readme when needed (new Gradle major version or JDK)
3. Create a PR with changes

# License

See [LICENSE.MD](https://github.com/BitWeb/docker-gradle-awscli/blob/main/LICENSE.MD)
