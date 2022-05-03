#Install R-version 3.6.3 as image
FROM rocker/r-ver:3.6.3

#installing required ubuntu libraries for 'mlr'
RUN apt-get update -qq && apt-get install -y \
  libgdal-dev libgeos-dev libproj-dev r-cran-udunits2 libgsl-dev libgmp-dev libglu-dev  r-cran-rjags libmpfr-dev libopenmpi-dev

#install required libraries
RUN R -e "install.packages('beakr')"
RUN R -e "install.packages('mlr')"
RUN R -e "install.packages('randomForest')"

# Expose the used port from beakr
EXPOSE 8001

#load Skript with model
ADD . /app

# set current working directory to the added app directory
WORKDIR /app

# Run the R script that contains the application
CMD ["Rscript", "./Startup.R"]