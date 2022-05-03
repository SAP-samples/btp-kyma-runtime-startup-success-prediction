
# load required libraries
library(beakr)
library(mlr)


#load trained model named 'rforest' from the current working directory
load("RandomForest.RData")


# function that combines the observations in a 
# dataframe, calculates a prediction with the previously loaded model and returns 
# the prediction

# Requirements:
# - Variables of the observed startup (no missing data is allowed)
#
# Output:
# - Result of the prediction returned in a string

get_prediction = function(longitude, latitude, affy, alfy, afmy, almy, relationships,
                          funding_rounds, funding_total_usd, milestones, is_CA, is_NY, 
                          is_MA, is_otherstate, is_software, is_web, is_mobile, 
                          is_enterprise, is_advertising, is_othercategory, has_VC,
                          has_angel, has_roundA, has_roundB, has_roundC, has_roundD,
                          is_top500){
  
  # combine parameters in data.frame
  startup_obs = data.frame(
    # latitude of the startup
    latitude = as.numeric(as.vector(latitude)),
    # longitude of the startup
    longitude = as.numeric(as.vector(longitude)),
    # age in years at the first funding round
    age_first_funding_year = as.numeric(as.vector(affy)),
    longitude = as.numeric(as.vector(longitude)),
    # age in years at the last funding round
    age_last_funding_year = as.numeric(as.vector(alfy)),
    longitude = as.numeric(as.vector(longitude)),
    # age in years at reaching the first milestone
    age_first_milestone_year = as.numeric(as.vector(afmy)),
    longitude = as.numeric(as.vector(longitude)),
    # age in years at reaching the last milestone
    age_last_milestone_year = as.numeric(as.vector(almy)),
    # number of relationships (ex. accountants, vendors, investors, mentors,...)
    relationships = as.integer(as.vector(relationships)),
    # number of executed funding rounds
    funding_rounds = as.integer(as.vector(funding_rounds)),
    # overall raised money during funding rounds
    funding_total_usd = as.numeric(as.vector(funding_total_usd)),
    # number of reached milestones
    milestones = as.integer(as.vector(milestones)),
    # 1 if startup is located in California, else 0
    is_CA = factor(is_CA, levels = c(0, 1)),
    # 1 if startup is located in New York, else 0
    is_NY = factor(is_NY, levels = c(0, 1)),
    # 1 if startup is located in Massachusetts, else 0
    is_MA = factor(is_MA, levels = c(0, 1)),
    # 1 if startup is located in another state, else 0
    is_otherstate = factor(is_otherstate, levels = c(0, 1)),
    # 1 if startup is working in the software industry, else 0
    is_software = factor(is_software, levels = c(0, 1)),
    # 1 if startup is working in the web industry, else 0
    is_web = factor(is_web, levels = c(0, 1)),
    # 1 if startup is working in the mobile industry, else 0
    is_mobile = factor(is_mobile, levels = c(0, 1)),
    # 1 if startup is working in the enterprise industry, else 0
    is_enterprise = factor(is_enterprise, levels = c(0, 1)),
    # 1 if startup is working in the advertising industry, else 0
    is_advertising = factor(is_advertising, levels = c(0, 1)),
    # 1 if startup is working in another industry, else 0
    is_othercategory = factor(is_othercategory, levels = c(0, 1)),
    # 1 if startup has raised venture capital, else 0
    has_VC = factor(has_VC, levels = c(0, 1)),
    # 1 if startup has an business angel, else 0
    has_angel = factor(has_angel, levels = c(0, 1)),
    # 1 if startup conducted 1 funding round, else 0
    has_roundA = factor(has_roundA, levels = c(0, 1)),
    # 1 if startup conducted 2 funding rounds, else 0
    has_roundB = factor(has_roundB, levels = c(0, 1)),
    # 1 if startup conducted 3 funding rounds, else 0
    has_roundC = factor(has_roundC, levels = c(0, 1)),
    # 1 if startup conducted 4 funding rounds, else 0
    has_roundD = factor(has_roundD, levels = c(0, 1)),
    # 1 if startup was ranked among the top 500, else 0
    is_top500 = factor(is_top500, levels = c(0, 1)))

  
  # calculate prediction for the observed startup
  pred = predict(rforest, newdata = startup_obs)
  #return the prediction
  return((paste0("The prediction for the observed startup is: ", 
                as.numeric(as.vector(pred$data$response)), "\n", "With a probability of ",
                100 * pred$data$prob.1, "% for a prediction of a successful startup (Threshold is 50%)")))
}


# generate new beakr server 
newBeakr() %>% 
  # Respond to GET requests at the "/predict" route
  httpGET(path = "/predict", decorate(get_prediction)) %>% 
  # Handle any errors with a JSON response
  handleErrors() %>%
  # Start the server on port 8001
  listen(host = "0.0.0.0", port = 8001)


