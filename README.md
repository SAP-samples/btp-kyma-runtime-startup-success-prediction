[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/btp-kyma-runtime-startup-success-prediction)](https://api.reuse.software/info/github.com/SAP-samples/btp-kyma-runtime-startup-success-prediction)


# Hands-On Tutorial: Manage and Run Machine Learning Models in R through Docker and in SAP BTP, Kyma 2.0 Runtime

<!--- Register repository https://api.reuse.software/register, then add REUSE badge:
[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/REPO-NAME)](https://api.reuse.software/info/github.com/SAP-samples/REPO-NAME)
-->

## Description
This Github repository provides the material used in a HandsOn blog, which covers the following main steps:

1. Create an API endpoint to be able to communicate with the application and create predictions with a machine learning model
2. Containerize R script in Docker image with all the requirements and dependencies
3. Deploy Machine Learning Model in R with Kyma 2.0 on SAP Business Technology Plattform

## Requirements
There are some sample-specific requirements that you can find in detail in the Hands-On blog.
In summary the following software/editors are required:

- R Editor like [RStudio](https://www.rstudio.com/)
- [Docker for Windows](https://docs.docker.com/desktop/windows/install/)
- [Docker Hub Account](https://hub.docker.com/)
- Command Line Tool like [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.1)

To run the sample in the SAP BTP Trial, Kyma runtime an active SAP BTP Trial account is required with an enabled Kyma environment.

## Download and Installation
The sample files can be downloaded and used within the respective user / developer environment, e.g. R files may be opened and used within a R Editor. The sample files don't require an installation step for themselves, they are simply downloaded and then opened in the respective editor. Through the Dockerfile and the R script the following R libraries will be installed:

1. mlr
2. beakr
3. randomForest
 
 Further, some by the library 'mlr' required ubuntu libraries will be installed.
 
## Known Issues
 Currently, there are no known issues for the sample project.

## How to obtain support
[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License
Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
