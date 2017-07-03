# WebExamples

Contains some example code for my [blog posts](http://piersshepperson.co.uk/programming/). 

## minimal_map

Code to support the [auto-build script post for Qt Projects](http://piersshepperson.co.uk/programming/2017/06/18/autobuild-script-qt-projects/)

The aim here was to create simple  auto-deploy script for Qt Creator projects. This is the simplist form of deployment tool and is good enough for many projects. 

The files of interest are: For Windows [buildWin_minimal_map_final.bat](https://github.com/Sriep/WebExamples/blob/master/minimal_map/deploy/buildWin_minimal_map_final.bat) and for linux [buildLinux_minimal_map.sh](https://github.com/Sriep/WebExamples/blob/master/minimal_map/deploy/buildLinux_minimal_map.sh). 

These scripts will work as is for many small projects by setting the envoirmental varables correctly and configuring tthe .iss file for use by [inno setup](http://www.jrsoftware.org/isinfo.php) the windows installer.

### Evniormental varables

The following envoirmental varables defined in scripts need to be modified to fit the project.

* PROJECTNAME The name of the project, should also be the name of the .pro file, source directory, executable and .iss file for Windows.
* GITHUB_URL The GihHub URL to clone for your project. It shouled be easy to ammend the script for other source control systems.
* BUILD_DIR Where you want the build to go.
* QT_DIR Location of the Qt binaries that you want to compile with. This is the parent directory not the bin directory.
* QT_CREATORDIR Location of the Qt Creator binary you wisth to use.
* MAKE_DIR For linux the location of the directory the version of make you want to use is located.
* LINUXDEPLOY For linux the location where you have installed linuxdeploy.
* SRCDIR Location of the source directory.

Further modification might be needed for more complicated projects. See simpletextviere for ideas of how to handle that.

## simpletextviewer

Code to support the [auto-build for Qt Projects using assistant post](http://piersshepperson.co.uk/programming/2017/06/18/autobuild-qt-project-assitant/)
