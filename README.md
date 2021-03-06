# Cafe 9
Demo code for jCafe about Java 9

* This page: https://github.com/anderskristian/cafe9/blob/master/README.md


Good links

* https://docs.oracle.com/javase/9/index.html - Oracle JDK 9 Documentation (Contains migration guide)

* https://www.youtube.com/watch?v=CMMzG8I23lY - Simon Ritter (Azul) 55 new features

* https://blog.jetbrains.com/idea/2017/10/real-world-java-9/ - Trisja Gee IntelliJ

* https://www.youtube.com/watch?v=VrI6rJNO2x4 - JDK 9 Information (Oracle)

* https://blog.codefx.org/java/five-command-line-options-to-hack-the-java-9-module-system/#Accessing-Internal-APIs-With--add-exports - about exports

* My problems below: https://stackoverflow.com/questions/46882786/java9-javac-add-exports-java-xml-ws-javax-xml-ws-all-unnamed-warning-option


## Getting started


```
subl ~/.bash_profile

export | grep JAVA
declare -x JAVA8_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"
declare -x JAVA9_HOME="/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home"
declare -x JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home"

mkdir cafe9
cd cafe9

# or use
git clone https://github.com/anderskristian/cafe9.git

```

## Java 8

https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html


```
mvn archetype:generate -DgroupId=dk.javagruppen -DartifactId=java8 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

cd java8
find src
subl src/main/java/dk/javagruppen/App.java
java -version

```
### Compile
```

mkdir target/classes
javac -sourcepath src/main/java src/main/java/dk/javagruppen/App.java -d target/classes
javac -sourcepath src/main/java src/main/java/dk/javagruppen/*.java -d target/classes

find src/main -name "*.java" > target/sources.txt
javac -sourcepath src/main/java @target/sources.txt -d target/classes

```
### Run

```

java -cp target/classes dk.javagruppen.App

```

### Maven

```
mvn package

java -cp target/java8-1.0-SNAPSHOT.jar dk.javagruppen.App
```

### Trying java 9

```
export JAVA_HOME=$JAVA9_HOME

javac -sourcepath src/main/java @target/sources.txt -d target/classes
java -cp target/classes dk.javagruppen.App

export JAVA_HOME=$JAVA8_HOME
java -cp target/classes dk.javagruppen.App
# see that java fails to run

```


### Maven on Java 9

```
export JAVA_HOME=$JAVA9_HOME
mvn clean package
# see that mvn fails to run

# add maven-compiler-plugin to build
java -cp target/java8-1.0-SNAPSHOT.jar dk.javagruppen.App

```



#### Most code can be compiled by JAVA9 (in 8 mode) .. except
* maven-compiler-plugin x.x.x - upgrade 3.7.0
* aspectj-maven-plugin expects tools.jar (upgrade to version 1.11 (not released yet))
* maven-assembly-plugin 2.5.2 - upgrade 3.1.0


##### non modulized
 add --add-modules $module


##### modulized 
 
 add module-info.java




## moduarity

```
ll $JAVA_HOME/jmods
java --list-modules

mvn archetype:generate -DgroupId=dk.javagruppen -DartifactId=hello9 -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

cd hello9

```
## Hello 9


#### compile
./compile.sh

#### run 
./do_run

#### Maven
mvn clean package
java -jar target/hello9-1.0-SNAPSHOT.jar

## Hello Module

```

mvn archetype:generate -DgroupId=dk.javagruppen -DartifactId=hellomodule -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

cd hellomodule

mvn clean package

java -jar target/hellomodule-1.0-SNAPSHOT.jar
# did not work .. missing package dependencies

java --module-path target/hellomodule-1.0-SNAPSHOT.jar  --module dk.javagruppen.hellomodule/dk.javagruppen.App



```

# Summary

* Java 9 can compile all (<=8)
* Java 9 can run - most (<=8)) - i.e. Maven it self.
* Converting existing 8's to 9'er can give some troubles
* AOP ... ( aspectj-maven-plugin )

## Prepare (from now on)
* Remove all warings in 8'er code. 
* Find replacements for troublesome inner JDK methods

# Jshell

```

alias jshell='JAVA_HOME=$JAVA9_HOME; $JAVA_HOME/bin/jshell'

```
