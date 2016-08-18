#!/bin/bash

ACTIVEMQ_VERSION=5.13.4

if [ ! -f "SOURCES/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz" ]; then
    (
        cd SOURCES
        wget --output-document apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz "http://www.apache.org/dyn/closer.cgi?filename=/activemq/${ACTIVEMQ_VERSION}/apache-activemq-${ACTIVEMQ_VERSION}-bin.tar.gz&action=download"
    )
fi

mkdir -p BUILD RPMS SRPMS

rpmbuild -D '%_topdir %(echo $PWD)' -ba SPECS/activemq.spec
