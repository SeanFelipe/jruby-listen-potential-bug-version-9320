#!/bin/bash
export JAVACMD=$JAVA_HOME/bin/java
#echo "javacmd: $JAVACMD"
cd src && jruby desktop.rb
