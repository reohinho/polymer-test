## BUILDING
##   (from project root directory)
##   $ docker build -t minideb-for-reohinho-polymer-test .
##
## RUNNING
##   $ docker run minideb-for-reohinho-polymer-test

FROM gcr.io/stacksmith-images/minideb-buildpack:jessie-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="62u0qam" \
    STACKSMITH_STACK_NAME="minideb for reohinho/polymer-test" \
    STACKSMITH_STACK_PRIVATE="1"

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating
