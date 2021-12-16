#!/bin/bash
title run-jruby-demo
export JAVACMD=$JAVA_HOME/bin/java
export REDC_HOME=`pwd`
export GDX_LIBS_DIR=`pwd`/libs

#echo "javacmd: $JAVACMD"

bundle exec "cd src && jruby desktop.rb"
