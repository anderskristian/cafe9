#!/usr/bin/env bash

export JAVA_HOME=$JAVA9_HOME
mkdir -pv target/classes

find src/main -name "*.java" > target/sources.txt



#
# Function:		Will compile artifact as we used to do (8'er)
#				It does not work in Java 9 because modules
#				are protected
# ----------------------------------------------------------------------------
compile() {
	javac -sourcepath src/main/java @target/sources.txt -d target/classes
}

#
# Function:		Will compile artifact and tell 9'er to
#				export package sun.awt in module java.desktop
# 				to all unnamed modules.
# Problem:		Module java.xml.ws is not found ?
# ----------------------------------------------------------------------------
compile_export(){

# --add-exports $module/$package=$readingmodule

	javac \
	 --add-exports java.xml/org.w3c.dom=ALL-UNNAMED \
	 --add-exports java.xml.ws/javax.jws=ALL-UNNAMED \
	 --add-exports java.desktop/sun.awt=ALL-UNNAMED \
	 --add-exports java.management/sun.management=ALL-UNNAMED \
	 -sourcepath src/main/java @target/sources.txt -d target/classes

}


#compile
compile_export

# ----------------------------------------------------------------------------
# below is a list of modules that cannot be exported ...

# these modules got problems
# ?? Why ?? mostly @Deprecated(since="9"....)
#
# used from module-info.java it works ..
#
# module name in --add-exports option not found: java.xml.ws               		@Deprecated
# module name in --add-exports option not found: java.activation                @Deprecated
# module name in --add-exports option not found: java.corba                     @Deprecated
# module name in --add-exports option not found: java.jnlp                      NOT deprecated
# module name in --add-exports option not found: java.se.ee                     NOT deprecated
# module name in --add-exports option not found: java.smartcardio               NOT deprecated
# module name in --add-exports option not found: java.transaction				@Deprecated
# module name in --add-exports option not found: java.xml.bind					@Deprecated
# module name in --add-exports option not found: java.xml.ws.annotation			@Deprecated
# module name in --add-exports option not found: javafx.deploy                  NOT deprecated
# module name in --add-exports option not found: jdk.charsets					NOT deprecated
# module name in --add-exports option not found: jdk.crypto.cryptoki			NOT deprecated
# module name in --add-exports option not found: jdk.crypto.ec					NOT deprecated
# module name in --add-exports option not found: jdk.deploy						NOT deprecated
# module name in --add-exports option not found: jdk.deploy.controlpanel
# module name in --add-exports option not found: jdk.editpad
# module name in --add-exports option not found: jdk.hotspot.agent
# module name in --add-exports option not found: jdk.incubator.httpclient
# module name in --add-exports option not found: jdk.internal.vm.ci
# module name in --add-exports option not found: jdk.javaws
# module name in --add-exports option not found: jdk.jcmd
# module name in --add-exports option not found: jdk.jstatd
# module name in --add-exports option not found: jdk.localedata
# module name in --add-exports option not found: jdk.naming.dns
# module name in --add-exports option not found: jdk.naming.rmi
# module name in --add-exports option not found: jdk.pack
# module name in --add-exports option not found: jdk.plugin
# module name in --add-exports option not found: jdk.plugin.server
# module name in --add-exports option not found: jdk.policytool
# module name in --add-exports option not found: jdk.rmic
# module name in --add-exports option not found: jdk.scripting.nashorn.shell
# module name in --add-exports option not found: jdk.snmp
# module name in --add-exports option not found: jdk.xml.bind
# module name in --add-exports option not found: jdk.xml.ws
# module name in --add-exports option not found: jdk.zipfs


