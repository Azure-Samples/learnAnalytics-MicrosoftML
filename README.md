Statistical Machine Learning with MicrosoftML
===============================================

## Description

This workshop covers the fundamentals of statistical machine learning with the [MicrosoftML package](https://msdn.microsoft.com/en-us/microsoft-r/microsoftml-introduction). MicrosoftML provides a R interface to a set of scalable and distributed learning algorithms and data transformers. The package was initially developed by the research team at Microsoft (MSR), and powers the majority of machine learning applications within Microsoft and within the Azure cloud machine learning ecosystem. In this workshop, you will learn how you can use MicrosoftML’s state-of-the-art machine learning capabilities within R to train high-accuracy machine learning algorithms at blazingly fast speed. We’ll learn the core syntax of the package, how to use it in tandem with your favorite packages for tidy data processing and visualization, and finally how to deploy your trained algorithms in production environments (including Spark clusters).

[![MRS](https://img.youtube.com/vi/arskgQaKlVs/0.jpg)](https://www.youtube.com/watch?v=arskgQaKlVs)

MicrosoftML is a package that works in tandem with the [RevoScaleR](https://msdn.microsoft.com/en-us/microsoft-r/scaler-getting-started) package and Microsoft R Server. In order to use the `MicrosoftML` and `RevoScaleR` libraries, you need an installation of Microsoft R Server or Microsoft R Client. You can download **Microsoft R Server** through MSDN here: 

1. [R Server for Linux](https://msdn.microsoft.com/en-us/microsoft-r/rserver-install-linux-server)
2. [R Server for Hadoop](https://msdn.microsoft.com/en-us/microsoft-r/rserver-install-hadoop)
3. [R Server for Windows](https://msdn.microsoft.com/en-us/microsoft-r/rserver-install-windows)
4. [R Server for SQL Server (In-Database)](https://docs.microsoft.com/en-us/sql/advanced-analytics/r/set-up-sql-server-r-services-in-database)

You can download **Microsoft R Client** through the following sources:

1. [R Client for Windows](https://msdn.microsoft.com/en-us/microsoft-r/r-client-install-windows)
2. [R Client for Linux](https://msdn.microsoft.com/en-us/microsoft-r/r-client-install-linux)
3. [R Client Docker Image](https://github.com/akzaidi/mrclient-docker)
	- [R Client Docker Image with RStudio Server and Course Repository](https://github.com/akzaidi/mrclient-rstudio)

## MicrosoftML References

+ [Cheat Sheet](https://msdn.microsoft.com/en-us/microsoft-r/microsoftml-algorithm-cheat-sheet)
+ [Overview of MicrosoftML Functions](https://msdn.microsoft.com/en-us/microsoft-r/overview-microsoftml-functions)
+ [Function Reference](https://msdn.microsoft.com/en-us/microsoft-r/microsoftml/microsoftml)
+ [Quickstarts](https://msdn.microsoft.com/en-us/microsoft-r/microsoftml-quickstarts)
+ [MSDN Site for Microsoft R Server](https://msdn.microsoft.com/en-us/microsoft-r/)
+ [MSDN Site for Microsoft R Client](https://msdn.microsoft.com/en-us/microsoft-r/r-client)
	* [R Client Overview](https://channel9.msdn.com/blogs/MicrosoftR/Microsoft-Introduces-new-free-Microsoft-R-Client)

### Intended Audience

This course will be useful to anyone looking to use the advanced analytics capabilities provided by Microsoft ML Server. A minimal background in R and statistics are assumed, which you can refresh with the resources below.

## Syllabus

1. [Exploratory Data Analysis and Feature Engineering](https://azure.github.io/learnAnalytics-MicrosoftML/exploratory-data-analysis-and-feature-engineering.html)
1. [Training Regression Models with ML Server](https://azure.github.io/learnAnalytics-MicrosoftML/regression-models.html)
1. [Classification Models for Computer Vision](https://azure.github.io/learnAnalytics-MicrosoftML/classification-models-for-computer-vision.html)
1. [Convolutional Neural Networks for Computer Vision](https://azure.github.io/learnAnalytics-MicrosoftML/convolutional-neural-networks-for-computer-vision.html)
1. [Natural Language Processing and Text Classification](https://azure.github.io/learnAnalytics-MicrosoftML/natural-language-processing.html)
1. [Transfer Learning with Pre-Trained Deep Neural Network Architectures – The Shallow End of Deep Learning](https://azure.github.io/learnAnalytics-MicrosoftML/transfer-learning-with-pre-trained-deep-neural-network-architectures-the-shallow-end-of-deep-learning.html)

## Prerequisities

This course assumes some R background.

### Introductory Courses

+ [Introduction to R for Data Science](https://www.edx.org/course/introduction-r-data-science-microsoft-dat204x-6)
+ [Programming with R for Data Science](https://www.edx.org/course/programming-r-data-science-microsoft-dat209x-5)
+ [Introduction to R by DataCamp](https://www.datacamp.com/courses/free-introduction-to-r)

## Useful Resources

+ [Introduction to Statistical Learning Video Lectures](https://lagunita.stanford.edu/courses/HumanitiesSciences/StatLearning/Winter2016/about)
	* My favorite course on statistical learning
	* Worth doing twice!
+ [Introduction to Statistical Learning Textbook](http://www-bcf.usc.edu/~gareth/ISL/)
	* _Baby Statistical Learning_
+ [Elements of Statistical Learning Textbook](http://statweb.stanford.edu/~tibs/ElemStatLearn/)
	* **Papa Statistical Learning**
+ [R for Data Science](http://r4ds.had.co.nz/)
	* Covers the core tools in the [`tidyverse`](http://tidyverse.org/) ecosystem for data science and analytics
+ [STAT545 - Data wrangling, exploration and analysis with R](http://stat545.com/)
	* Jenny Bryan's incredible course and resources
	* We will use the `purrr` package a few times in this course. You can find some awesome tutorials by Jenny here at [purrr-tutorial](https://jennybc.github.io/purrr-tutorial/).
+ [Microsoft R for Data Science](https://github.com/Azure/LearnAnalytics-mr4ds)
	* My two-day workshop on Microsoft R Server for Data Science
+ [Microsoft R Server and Spark](https://github.com/Azure/LearnAnalytics-mrs-spark)
	* My 1.5 day course on Microsoft R Server and Spark Integration
+ [Scalable Data Science with Microsoft R Server and Spark](https://bookdown.org/alizaidi/mrs-spark-ml/)
	* In progress book on data science with Microsoft R Server and Spark
