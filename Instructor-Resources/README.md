## Resources for Instructors

The resources in this directory are primarily for re-delivery.

There are multiple ways to run this workshop. You can run it using any system that has Microsoft R Server installed. An Azure DSVM is one highly attractive option, since it has a complete ML Server installation, with RStudio, Visual Studio, and many other machine learning/AI tools that aren't convered in this class. You can deploy an AzureDSVM easily using the provided script [deploydsvm.sh](./deploydsvm.sh). Just make sure you login first: `az login` from any shell with Azure CLI 2.0. It'll create a file called `creds.txt` with credentials to access your VM. Most of the script has hopefully reasonable default parameters, but you can change these defaults as you feel.

Alternatively, you can use my [R client docker image](https://github.com/akzaidi/mrclient-rstudio), which conveniently loads this package and runs the make file described next.

To install all the necessary packages for this course, simply make this directory, i.e., `make`. If you have created a single server for all the students to share, run it as `root` so that the packages are installed to the system library rather than your user library. The makefile will save the output to a file called log.txt in this directory. Check the file for any errors.
