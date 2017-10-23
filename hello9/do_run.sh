#!/usr/bin/env bash

export JAVA_HOME=$JAVA9_HOME



java -cp target/classes dk.javagruppen.App

#javac \
# --add-exports java.desktop/sun.awt=ALL-UNNAMED \
# --add-exports java.management/sun.management=ALL-UNNAMED \
# -sourcepath src/main/java @target/sources.txt -d target/classes
