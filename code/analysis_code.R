View(All_Countries_data)

#column 1 for analysis: GDP
gdp_data <- All_Countries_data$gdp

# Plotting histogram for GDP
hist(gdp_data, main = "Distribution of GDP", xlab = "GDP", ylab = "Frequency", col = "lightblue", border = "black", breaks= 50)

#----------------------------- x x x ----------------------------------------------

#column 2 for analysis: unemployment_pct

updated_unemployment_data <- All_Countries_data$unemployment_pct

# Plotting histogram for Unemployment Percentage
hist(updated_unemployment_data, main = "Distribution of Unemployment Percentage", xlab = "Unemployment Percentage", ylab = "Frequency", col = "lightgreen", border = "black", breaks= 30)

#----------------------------- x x x ----------------------------------------------

#column 3 for analysis: continent
continent_data <- All_Countries_data$continent

# Plotting bar chart for Continent
barplot(table(continent_data), main = "Distribution of Countries by Continent", xlab = "Continent", ylab = "Frequency", col = "skyblue")

#----------------------------- x x x ----------------------------------------------

#column 4 for analysis: inflation

inflation_data <- All_Countries_data$inflation

# Plotting histogram for Unemployment Percentage
hist(inflation_data, main = "Distribution of inflation data", xlab = "inflation", ylab = "Frequency", col = "coral", border = "black", breaks= 50)

# ------------------------------------------------------------------------------------------------------------
# -------------------------- Re-doing histograms for few more columns for better regression - 11/19/23 ------------
# ------------------------------------------------------------------------------------------------------------

#column 5 for analysis: population
population_data <- All_Countries_data$population

# Plotting histogram for GDP
hist(population_data, main = "Distribution of population", xlab = "population", ylab = "Frequency", col = "yellow", border = "black", breaks= 100)

#----------------------------- x x x ----------------------------------------------

#column 6 for analysis: central_government_debt_pct_gdp

central_government_debt_pct_data <- All_Countries_data$central_government_debt_pct_gdp

# Plotting histogram for GDP
hist(central_government_debt_pct_data, main = "Distribution of central government debt pct of gdp", xlab = "central government debt pct of gdp", ylab = "Frequency", col = "blue", border = "black", breaks= 30)

#----------------------------- x x x ----------------------------------------------

#column 7 for analysis: expense_pct_gdp

expense_pct_gdp_data <- All_Countries_data$expense_pct_gdp

# Plotting histogram for GDP
hist(expense_pct_gdp_data, main = "Distribution of expense pct of gdp", xlab = "expense pct of gdp", ylab = "Frequency", col = 'red', border = "black", breaks= 50)

#----------------------------- x x x ----------------------------------------------

#column 8 for analysis: internet_pct

internet_pct_data <- All_Countries_data$internet_pct

# Plotting histogram for GDP
hist(internet_pct_data, main = "Distribution of internet pct", xlab = "internet pct", ylab = "Frequency", col = 'darkgreen', border = "black", breaks= 50)


#----------------------------- x x x ----------------------------------------------

------------------------------------------------------------------------------------------------------------
# ----------------------------------  Milestone 4: Missing data and outliers------------------------------------ 
# ------------------------------------------------------------------------------------------------------------

#--------------------- Missing data and outliers for GDP: ---------------------- 

  # we noticed from the histogram for GDP that it has few very high GDP on the right end which can be a barrier for analyzing the data 
    # since that will prevent the data to represent most of the countries.
  # here we will remove these outliers

# checking for null values
sum(is.na(All_Countries_data$gdp))

# we found 1 null value in gdp coloumn so we will replace with 0
# Replace NA values in the "gdp" column with 0
All_Countries_data$gdp <- replace(All_Countries_data$gdp, is.na(All_Countries_data$gdp), 0)

# we count the median value for gdp in the dataset
mediangdp <- median(All_Countries_data$gdp)
mediangdp

# Replace the gdp in all rows where it is 0 with the median gdp
All_Countries_data$gdp[All_Countries_data$gdp == 0] <- mediangdp

# now we remove outliers for gdp column
data_wOut_gdp_outlier <- subset(All_Countries_data, gdp< 4.0e+12)

data_wOut_gdp_outlier

hist(data_wOut_gdp_outlier$gdp, main = "Distribution of GDP after removing outliers", xlab = "GDP", ylab = "Frequency", col = "lightblue", border = "black", breaks= 50)
# Null Value remove effect: from the histogram we don't see enough change in the frequency of any GDP values
                  # it is because we have only replaced one null value with median value

# Outliers remove effect: In the histogram we notice there only GDP values upto (4.0 * 10^12)
                  # it is beacause we have removed oultliers bigger than that value

#--------------------- Missing data and outliers for Unemployment: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$unemployment_pct))
# we found 15 null values for unemployment_pct

#replace null value with -1
All_Countries_data$unemployment_pct <- replace(All_Countries_data$unemployment_pct, is.na(All_Countries_data$unemployment_pct), -1)

# we count the median value for unemployment_pct in the dataset
median_unemployment_pct <- median(All_Countries_data$unemployment_pct)
median_unemployment_pct

# Replace the unemployment_pct in all rows where it is -1 with the median unemployment_pct
All_Countries_data$unemployment_pct[All_Countries_data$unemployment_pct == -1] <- median_unemployment_pct

# checking for null values again to make sure no missing data there
sum(is.na(All_Countries_data$unemployment_pct))

# making histogram for the updated unemployment data
updated_unemployment_data <- All_Countries_data$unemployment_pct
hist(updated_unemployment_data, main = "Distribution of Unemployment Percentage after null removal", xlab = "Unemployment Percentage", ylab = "Frequency", col = "lightgreen", border = "black", breaks= 30)
# Null value remove effect: from the histogram of updated unemployment percentage we do see that the frequency of median has increased 
                      # it is because we replaced 15 null values with median value 

# for unemployment data there were no outliers that needs to be removed

#--------------------- Missing data and outliers for inflation data: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$inflation))
# we found 10 null values for unemployment_pct

#replace null value with -1
All_Countries_data$inflation <- replace(All_Countries_data$inflation, is.na(All_Countries_data$inflation), -1)

# we count the median value for unemployment_pct in the dataset
median_inflation <- median(All_Countries_data$inflation)
median_inflation

# Replace the inflation in all rows where it is -1 with the median median_inflation
All_Countries_data$inflation[All_Countries_data$inflation == -1] <- median_inflation

# checking for null values again to make sure no missing data there
sum(is.na(All_Countries_data$median_inflation))

# making histogram for the updated inflation data
inflation_data <- All_Countries_data$inflation
hist(inflation_data, main = "Distribution of inflation Percentage", xlab = "Inflation Percentage", ylab = "Frequency", col = "coral", border = "black", breaks= 30)

# removing outliers from inflation data
# here we see most of the countries inflation data are below 60 % and there is one outlier which is at 250% inflation so we remove that

data_wOut_inflation_outlier <- subset(All_Countries_data, inflation< 160)

data_wOut_inflation_outlier
hist(data_wOut_inflation_outlier$inflation, main = "Distribution of inflation Percentage after removing outliers", xlab = "Inflation Percentage", ylab = "Frequency", col = "coral", border = "black", breaks= 30)
# Null remove effect: from the histogram we notice frequency of median value has increased to 85 from 75
                    # it is because we have replaced 10 null values with median value

# Outliers remove effect: from the histogram we do notice that now we have inflation percent only upto 150 
                    # it is beacue we have removed outliers

# ------------------------------------------------------------------------------------------------------------
# -------------------------- Re-doing data cleaning for few more columns for better regression - 11/19/23 ------------
# ------------------------------------------------------------------------------------------------------------

#--------------------- Missing data and outliers for population: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$population))

# we found 0 null value in population coloumn. So there is nothing to remove from this

#----------------------------- x x x ----------------------------------------------

#--------------------- Missing data and outliers for central_government_debt_pct_gdp: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$central_government_debt_pct_gdp))

# we found 74 null value in population coloumn. 
#replace null value with -1
All_Countries_data$central_government_debt_pct_gdp <- replace(All_Countries_data$central_government_debt_pct_gdp, is.na(All_Countries_data$central_government_debt_pct_gdp), -1)

# we count the median value for central_government_debt_pct_gdp in the dataset
median_central_government_debt_pct_gdp <- median(All_Countries_data$central_government_debt_pct_gdp)
median_central_government_debt_pct_gdp

# Replace the central_government_debt_pct_gdp in all rows where it is -1 with the median central_government_debt_pct_gdp
All_Countries_data$central_government_debt_pct_gdp[All_Countries_data$central_government_debt_pct_gdp == -1] <- median_central_government_debt_pct_gdp

# checking for null values again to make sure no missing data there
sum(is.na(All_Countries_data$central_government_debt_pct_gdp))

# making histogram for the updated central government debt pct gdp
updated_central_government_debt_pct_gdp <- All_Countries_data$central_government_debt_pct_gdp
hist(updated_central_government_debt_pct_gdp, main = "Distribution of central government debt pct gdp after null removal", xlab = "central government debt pct gdp", ylab = "Frequency", col = "blue", border = "black", breaks= 30)
# Null value remove effect: from the histogram of updated central government debt pct gdp we do see that the frequency of median has increased 
# it is because we replaced 74 null values with median value 


#----------------------------- x x x ----------------------------------------------

#--------------------- Missing data and outliers for expense_pct_gdp: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$expense_pct_gdp))

# we found 38 null value in population coloumn. 
#replace null value with -1
All_Countries_data$expense_pct_gdp <- replace(All_Countries_data$expense_pct_gdp, is.na(All_Countries_data$expense_pct_gdp), -1)

# we count the median value for expense_pct_gdp in the dataset
median_expense_pct_gdp <- median(All_Countries_data$expense_pct_gdp)
median_expense_pct_gdp

# Replace the expense_pct_gdp in all rows where it is -1 with the median central_government_debt_pct_gdp
All_Countries_data$expense_pct_gdp[All_Countries_data$expense_pct_gdp == -1] <- median_expense_pct_gdp

# checking for null values again to make sure no missing data there
sum(is.na(All_Countries_data$expense_pct_gdp))

# making histogram for the updated expense pct gdp
updated_expense_pct_gdp <- All_Countries_data$expense_pct_gdp
hist(updated_expense_pct_gdp, main = "Distribution of expense pct gdp after null removal", xlab = "expense pct gdp", ylab = "Frequency", col = "red", border = "black", breaks= 30)
# Null value remove effect: from the histogram of updated expense pct gdp we do see that the frequency of median has increased 
# it is because we replaced 38 null values with median value 

#----------------------------- x x x ----------------------------------------------

#--------------------- Missing data and outliers for internet_pct: ---------------------- 

# checking for null values
sum(is.na(All_Countries_data$internet_pct))

# we found 0 null value in population coloumn. So there is no null removal required for internet_pct

#----------------------------- x x x ----------------------------------------------

# =========================================== Selecting a dataset to do rest of the data analysis for predicting inflation of a country ==================================

#Since we are predicting GDP of a country, we will use dataset with out GDP outlier for our predictions

# Specify the selected columns
selected_columns <- c('inflation', 'gdp', 'central_government_debt_pct_gdp', 'unemployment_pct', 'population', 'internet_pct', 'agricultural_land', 'electricity_access_pct', 'democracy_score', 'net_migration', 'birth_rate', 'self_employed_pct')

# Check for null values in selected columns
null_counts <- colSums(is.na(data_wOut_gdp_outlier[, selected_columns]))

# Display the results
print(null_counts)

# Select rows with complete data in the selected columns
selected_dataframe <- data_wOut_gdp_outlier[complete.cases(data_wOut_gdp_outlier[, selected_columns]), selected_columns]
selected_dataframe
# =========================================== selected the datframe 'selected_dataframe' above # ===========================================

# ------------------------------------------------------------------------------------------------------------
  # ----------------------------------  Milestone 5: Measures of center and spread------------------------------------ 
# ------------------------------------------------------------------------------------------------------------
  
#--------------------- Measures of center and spread for GDP: ---------------------- 

# Calculating 2% trimmed mean for GDP

# even though we removed outliers for GDP data we can see there are still some extreme value on both side of the histogram 
    # so we will remove them by 2% trimmed mean to eliminate the influence of outliers or data points on the tails
trimmed_mean_gdp <- mean(data_wOut_gdp_outlier$gdp, trim= 0.02)
cat('Trimmed mean for GDP is:', trimmed_mean_gdp, '\n')
# output: Trimmed mean for GDP is: 208523310859 
# -----------------------------------------------------------never mind this section-------------------------------------------------
# # Identify excluded data
# excluded_data_gdp <- data_wOut_gdp_outlier$gdp[!(data_wOut_gdp_outlier$gdp >= quantile(data_wOut_gdp_outlier$gdp, 0.02) & data_wOut_gdp_outlier$gdp <= quantile(data_wOut_gdp_outlier$gdp, 0.98))]
# 
# # Print results
# print(paste("Trimmed Mean:", trimmed_mean_gdp))
# print("Excluded Data:")
# print(excluded_data_gdp)
# ------------------------------------------------------------------------------------------------------------

# Calculating median for GDP 
median_gdp <- median(data_wOut_gdp_outlier$gdp)
cat('Median for GDP is:', median_gdp, '\n')
# output: Median for GDP is: 39464500000 
# Calculating variance for GDP 
variance_gdp <- var(data_wOut_gdp_outlier$gdp)
cat('variance for GDP is:', variance_gdp, '\n')
#output: variance for GDP is: 2.944512e+23 

# Calculating standard deviation for GDP 
standard_deviation_gdp <- sd(data_wOut_gdp_outlier$gdp)
cat('standard deviation for GDP is:', standard_deviation_gdp, '\n')
# output: standard deviation for GDP is: 542633606743

#--------------------- Measures of center and spread for Unemployment Percentage: ---------------------- 

# Calculating trimmed mean for Unemployment Percentage

# we can see there are some extreme value on both side of the Unemployment Percentage histogram 
# so we will remove them by 2% trimmed mean to eliminate the influence of outliers or data points on the tails
trimmed_mean_unemployment_pct <- mean(updated_unemployment_data, trim = 0.02)
cat('Trimmed Mean for unemployment pct is:', trimmed_mean_unemployment_pct, '\n')
# output: Trimmed Mean for unemployment pct is: 7.054032 
# ----------------------------------------------------------------never mind this section------------------------
# # Identify excluded data
# excluded_data_unemployment <- updated_unemployment_data[!(updated_unemployment_data >= quantile(updated_unemployment_data, 0.02) & updated_unemployment_data <= quantile(updated_unemployment_data, 0.98))]
# 
# # Print results
# print(paste("Trimmed Mean:", trimmed_mean_unemployment_pct))
# print("Excluded Data:")
# print(excluded_data_unemployment)
# ------------------------------------------------------------------------------------------------------------

# Calculating median for Unemployment percentage 
median_unemployment_pct <- median(updated_unemployment_data)
cat('Median for Unemployment percentaget is:', median_unemployment_pct, '\n')
# output: Median for Unemployment percentaget is: 5.2005

# Calculating variance for Unemployment percentage  
variance_unemployment_pct <- var(updated_unemployment_data)
cat('variance for Unemployment percentage is:', variance_unemployment_pct, '\n')
# output: variance for Unemployment percentage is: 30.00741

# Calculating standard deviation for Unemployment percentage  
standard_deviation_unemployment_pct <- sd(updated_unemployment_data)
cat('standard deviation for Unemployment percentage is:', standard_deviation_unemployment_pct, '\n')
# output: standard deviation for Unemployment percentage is: 5.477902

#--------------------- Measures of center and spread for Inflation Percentage: ---------------------- 

# Calculating 2% trimmed mean for Inflation Percentage

# even though we removed outliers for Inflation Percentage data we can see there are still some extreme value on both side of the Inflation Percentage histogram 
# so we will remove them by 2% trimmed mean to eliminate the influence of outliers or data points on the tails
trimmed_mean_inflation <- mean(data_wOut_inflation_outlier$inflation)
cat('Trimmed mean for inflation is:', trimmed_mean_inflation, '\n')
# output: Trimmed mean for inflation is: 11.51069 

# -------------------------------------------------------------never mind this section------------------------
# # Identify excluded data
# excluded_data_inflation <- data_wOut_inflation_outlier$inflation[!(data_wOut_inflation_outlier$inflation >= quantile(data_wOut_inflation_outlier$inflation, 0.02) & data_wOut_inflation_outlier$inflation <= quantile(data_wOut_inflation_outlier$inflation, 0.98))]
# 
# # Print results
# print(paste("Trimmed Mean:", trimmed_mean_inflation))
# print("Excluded Data:")
# print(excluded_data_inflation)
# ------------------------------------------------------------------------------------------------------------

# Calculating median for inflation 
median_inflation <- median(data_wOut_inflation_outlier$inflation)
cat('Median for inflation is:', median_inflation, '\n')
# output: Median for inflation is: 7.593975

# Calculating variance for inflation 
variance_inflation <- var(data_wOut_inflation_outlier$inflation)
cat('variance for inflation is:', variance_inflation, '\n')
# output: variance for inflation is: 326.2146 

# Calculating standard deviation for inflation 
standard_deviation_inflation <- sd(data_wOut_inflation_outlier$inflation)
cat('standard deviation for inflation is:', standard_deviation_inflation, '\n')
# output: standard deviation for inflation is: 18.06141

#----------------------------- x x x ----------------------------------------------

# ------------------------------------------------------------------------------------------------------------
# -------------------------- Re-doing measure of center and spread for few more columns for better regression - 11/19/23 ------------
# ------------------------------------------------------------------------------------------------------------



# ------------------------------------------------------------------------------------------------------------
  # ----------------------------------  Milestone 6: Scatterplots and correlation ------------------------------------ 
# ------------------------------------------------------------------------------------------------------------

#------------------------------------ (GDP v/s inflation) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without inflation outlier 'selected_dataframe' -------------------

# Scatterplot of GDP (x axis) vs inflation (y axis).

plot(inflation ~ gdp, data = selected_dataframe, xlab = "GDP of countries", ylab = "Inflation of countries", main = " (GDP v/s inflation) scatter plot")

# Correlation of GDP & inflation 
cat('Correlation of GDP & inflation is: ',cor(selected_dataframe$inflation, selected_dataframe$gdp))

  # output: Correlation of GDP & inflation is:  -0.05123742


#------------------------------------ (Unemployment v/s inflation) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use original dataset without inflation outlier 'selected_dataframe' -------------------

# Scatterplot of unemployment (x axis) vs inflation (y axis).

plot(inflation ~ unemployment_pct, data = selected_dataframe, xlab = "Unemployment Percentage", ylab = "Inflation of countries", main = " (Unemployment v/s inflation) scatter plot")

# Correlation of Unemployment & inflation 
cat('Correlation of Unemployment & inflation is: ',cor(selected_dataframe$inflation, selected_dataframe$unemployment_pct))

  # output: Correlation of Unemployment & inflation is:  0.1296782



#------------------------------------ (Unemployment v/s GDP) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without GDP outlier -------------------

# Scatterplot of Unemployment (x axis) vs GDP (y axis).

plot(gdp ~ unemployment_pct, data = data_wOut_gdp_outlier, xlab = "Unemployment percentage of countries", ylab = "GDP of countries", main = " (Unemployment v/s GDP) scatter plot")

# Correlation of Unemployment & GDP 
cat('Correlation of Unemployment & GDP is: ',cor(data_wOut_gdp_outlier$gdp, data_wOut_gdp_outlier$unemployment_pct))

# output: Correlation of Unemployment & GDP is:  -0.1117381


#----------------------------- x x x ----------------------------------------------

# ------------------------------------------------------------------------------------------------------------
# -------------------------- Re-doing scatterplots for few more columns for better regression - 11/19/23 ------------
# ------------------------------------------------------------------------------------------------------------

#------------------------------------ (population v/s GDP) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without GDP outlier 'selected_dataframe' -------------------

# Scatterplot of population % (x axis) vs inflation (y axis).

plot(gdp ~ population, data = data_wOut_gdp_outlier, xlab = "population", ylab = "GDP of countries", main = " (population v/s GDP) scatter plot")

# Correlation of population % & GDP 
cat('Correlation of population % & GDP is: ',cor(selected_dataframe$gdp, selected_dataframe$population))
# Correlation of population % & GDP is:  0.557045
#----------------------------- x x x ----------------------------------------------


#------------------------------------ (Agricultural land v/s GDP) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without GDP outlier 'selected_dataframe' -------------------

# Scatterplot of Agricultural land (x axis) vs GDP (y axis).

plot(gdp ~ agricultural_land, data = data_wOut_gdp_outlier, xlab = "agricultural land", ylab = "GDP of countries", main = " (agricultural land v/s GDP) scatter plot")

# Correlation of agricultural_land & GDP 
cat('Correlation of agricultural_land & GDP is: ',cor(selected_dataframe$gdp, selected_dataframe$agricultural_land))
# Correlation of agricultural_land & GDP is:  0.5086035
#----------------------------- x x x ----------------------------------------------


#------------------------------------ (Democracy score v/s GDP) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without GDP outlier 'selected_dataframe' -------------------

# Scatterplot of Democracy score (x axis) vs GDP (y axis).

plot(gdp ~ democracy_score, data = data_wOut_gdp_outlier, xlab = "democracy score", ylab = "GDP of countries", main = " (democracy score v/s GDP) scatter plot")

# Correlation of agricultural_land & GDP 
cat('Correlation of democracy_score & GDP is: ',cor(selected_dataframe$gdp, selected_dataframe$democracy_score))
# Correlation of democracy_score & GDP is:  0.3302314
#----------------------------- x x x ----------------------------------------------


#------------------------------------ (Net migration v/s GDP) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without GDP outlier 'selected_dataframe' -------------------

# Scatterplot of Net migration (x axis) vs GDP (y axis).

plot(gdp ~ net_migration, data = data_wOut_gdp_outlier, xlab = "net migration", ylab = "GDP of countries", main = " (net migration v/s GDP) scatter plot")

# Correlation of net_migration & GDP 
cat('Correlation of net_migration & GDP is: ',cor(selected_dataframe$gdp, selected_dataframe$net_migration))
# Correlation of net_migration & GDP is:  0.1369982
#----------------------------- x x x ----------------------------------------------


#------------------------------------ (central government debt % v/s inflation) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without inflation outlier 'selected_dataframe' -------------------

# Scatter plot of central government debt % (x axis) vs inflation (y axis).

plot(inflation ~ central_government_debt_pct_gdp, data = selected_dataframe, xlab = "central government debt %", ylab = "Inflation of countries", main = " (central government debt % v/s inflation) scatter plot")

# Correlation of central government debt % & inflation 
cat('Correlation of central government debt % & inflation is: ',cor(selected_dataframe$inflation, selected_dataframe$central_government_debt_pct_gdp))
# Correlation of central government debt % & inflation is:  0.003494778
#----------------------------- x x x ----------------------------------------------

#------------------------------------ (expense pct gdp v/s inflation) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without inflation outlier 'selected_dataframe' -------------------

# Scatter plot of population % (x axis) vs inflation (y axis).

plot(inflation ~ expense_pct_gdp, data = selected_dataframe, xlab = "expense pct gdp", ylab = "Inflation of countries", main = " (expense pct gdp v/s inflation) scatter plot")

# Correlation of expense_pct_gdp & inflation

cat('Correlation of expense pct gdp & inflation is: ',cor(selected_dataframe$inflation, selected_dataframe$expense_pct_gdp))
# Correlation of expense pct gdp & inflation is:  -0.103015
#----------------------------- x x x ----------------------------------------------

#------------------------------------ (internet pct v/s inflation) scatter plot and co-relation ---------------------------------

# ------------------ for this calculation we will use dataset without inflation outlier 'selected_dataframe' -------------------

# Scatter plot of internet % (x axis) vs inflation (y axis).

plot(inflation ~ internet_pct, data = selected_dataframe, xlab = "internet pct", ylab = "Inflation of countries", main = " (internet pct v/s inflation) scatter plot")

# Correlation of internet_pct & inflation

cat('Correlation of internet pct & inflation is: ',cor(selected_dataframe$inflation, selected_dataframe$internet_pct))
# Correlation of internet pct & inflation is:  -0.07903079




# ------------------------------------------------------------------------------------------------------------
# ----------------------------------  Milestone 7: Confidence Intervals------------------------------------ 
# ------------------------------------------------------------------------------------------------------------

# ----------------------------------- for this milestone i'm using dataset without outliers. ----------------
#--------------------- Confidence Intervals for GDP: ---------------------- 

# Compute 95% confidence interval
gdp_confidence_interval <- t.test(data_wOut_gdp_outlier$gdp)$conf.int

# Print the confidence interval
cat('95% confidence interval for GDP is: (',gdp_confidence_interval[1], ',', gdp_confidence_interval[2], ')')

# Output : 95% confidence interval for GDP is: ( 172910486053 , 328219916783 )


#--------------------- Confidence Intervals for Unemployment Percentage: ---------------------- 

# Compute 95% confidence interval
unemployment_confidence_interval <- t.test(All_Countries_data$unemployment_pct)$conf.int

# Print the confidence interval
cat('95% confidence interval for Unemployment Percentage is: (',unemployment_confidence_interval[1], ',', unemployment_confidence_interval[2], ')')

# Output : 95% confidence interval for Unemployment Percentage is: ( 6.495471 , 8.046869 )


#--------------------- Confidence Intervals for Inflation: ---------------------- 

# Compute 95% confidence interval
inflation_confidence_interval <- t.test(data_wOut_inflation_outlier$inflation)$conf.int

# Print the confidence interval
cat('95% confidence interval for inflation is: (',inflation_confidence_interval[1], ',', inflation_confidence_interval[2], ')')

# Output : 95% confidence interval for inflation is: ( 8.9464 , 14.07498 )


#----------------------------- x x x ----------------------------------------------

# ------------------------------------------------------------------------------------------------------------
# ----------------------------------  Milestone 8: Linear Regression (predicting GDP)------------------------------------ 
# ------------------------------------------------------------------------------------------------------------

# ----------------------------------- for this milestone i'm using dataset without outliers. ----------------

#------------------ first model -----------------------------
# # new
# independent_columns <- c('inflation', 'unemployment_pct', 'population', 'internet_pct', 'agricultural_land', 'electricity_access_pct', 'democracy_score', 'net_migration', 'birth_rate', 'self_employed_pct')
# 
# # Assuming 'gdp' is the dependent variable
# formula <- as.formula(paste("gdp ~", paste(independent_columns, collapse = "+")))
# 
# # Create the linear regression model
# model <- lm(formula, data = selected_dataframe)
# 
# # Summary of the linear regression model
# summary(model)
#------------------ end of first model -----------------------------

#------------------ last but better model -----------------------------

independent_columns2 <- c('unemployment_pct', 'population', 'agricultural_land', 'democracy_score', 'net_migration', 'self_employed_pct')

# Assuming 'gdp' is the dependent variable
formula <- as.formula(paste("gdp ~", paste(independent_columns2, collapse = "+")))

# Create the linear regression model
model <- lm(formula, data = selected_dataframe)

# Summary of the linear regression model
summary(model)

#------------------ end of last but better model -----------------------------

# ------------------- Histogram of residuals ----------------------

# Histogram of residuals
hist(residuals(model), main = "Histogram of Residuals", xlab = "Residuals",col = "coral" )

# Scatter plot of actual vs. residuals
plot(selected_dataframe$gdp, residuals(model), main = "Actual vs. Residuals", xlab = "Actual", ylab = "Residuals")

#----------------------------- x x x ----------------------------------------------

# ------------------------------------------------------------------------------------------------------------
# ----------------------------------  Milestone 9: Hypothesis Testing------------------------------------ 
# ------------------------------------------------------------------------------------------------------------

#----------------------------- x x x ----------------------------------------------


# Set the significance level (alpha)
alpha <- 0.05


#-------------------------------------------
# Hypothesis 1: Effect of Population on GDP
#-------------------------------------------

# Null Hypothesis: Population has no significant effect on GDP
# Alternative Hypothesis: Population has a significant effect on GDP

# Use the summary of the linear regression model to get the p-value for 'population'
coef_population <- summary(model)$coefficients["population", "Estimate"]
p_value_population <- summary(model)$coefficients["population", "Pr(>|t|)"]

# Conduct the Hypothesis Test
if (p_value_population < alpha) {
  if (coef_population > 0) {
    cat('Reject the null hypothesis. There is evidence of a significant positive effect of population on GDP.\n')
  } else if (coef_population < 0) {
    cat('Reject the null hypothesis. There is evidence of a significant negative effect of population on GDP.\n')
  } else {
    cat('Reject the null hypothesis. Population has a significant effect on GDP, but the direction is not specified.\n')
  }
} else {
  cat('Fail to reject the null hypothesis. There is no evidence of a significant effect of population on GDP.\n')
}
#------------------------------------------------------------------------------------------------------------
    # Result: Reject the null hypothesis. There is evidence of a significant positive effect of population on GDP.
#------------------------------------------------------------------------------------------------------------


#-------------------------------------------
# Hypothesis 2: Effect of Democracy Score on GDP
#-------------------------------------------

# Null Hypothesis: Democracy score has no significant effect on GDP
# Alternative Hypothesis: Democracy score has a significant effect on GDP

# Use the summary of the linear regression model to get the p-value for 'democracy_score'
coef_democracy <- summary(model)$coefficients["democracy_score", "Estimate"]
p_value_democracy <- summary(model)$coefficients["democracy_score", "Pr(>|t|)"]

# Conduct the Hypothesis Test
if (p_value_democracy < alpha) {
  if (coef_democracy > 0) {
    cat('Reject the null hypothesis. There is evidence of a significant positive effect of democracy score on GDP.\n')
  } else if (coef_democracy < 0) {
    cat('Reject the null hypothesis. There is evidence of a significant negative effect of democracy score on GDP.\n')
  } else {
    cat('Reject the null hypothesis. Democracy score has a significant effect on GDP, but the direction is not specified.\n')
  }
} else {
  cat('Fail to reject the null hypothesis. There is no evidence of a significant effect of democracy score on GDP.\n')
}

#------------------------------------------------------------------------------------------------------------
      # Reject the null hypothesis. There is evidence of a significant positive effect of democracy score on GDP.
#------------------------------------------------------------------------------------------------------------


#-------------------------------------------
# Hypothesis 3: Effect of self_employed_pct on GDP
#-------------------------------------------

# Null Hypothesis: self_employed_pct has no significant effect on GDP
# Alternative Hypothesis: self_employed_pct has a significant effect on GDP

# Using the summary of the linear regression model to get the p-value for 'self_employed_pct'
coef_self_employed <- summary(model)$coefficients["self_employed_pct", "Estimate"]
p_value_self_employed <- summary(model)$coefficients["self_employed_pct", "Pr(>|t|)"]

# Conduct the Hypothesis Test
if (p_value_self_employed < alpha) {
  if (coef_self_employed > 0) {
    cat('Reject the null hypothesis. There is evidence of a significant positive effect of self_employed_pct on GDP.\n')
  } else if (coef_self_employed < 0) {
    cat('Reject the null hypothesis. There is evidence of a significant negative effect of self_employed_pct on GDP.\n')
  } else {
    cat('Reject the null hypothesis. Self_employed_pct has a significant effect on GDP, but the direction is not specified.\n')
  }
} else {
  cat('Fail to reject the null hypothesis. There is no evidence of a significant effect of self_employed_pct on GDP.\n')
}

#------------------------------------------------------------------------------------------------------------
    #Reject the null hypothesis. There is evidence of a significant negative effect of self_employed_pct on GDP.
#------------------------------------------------------------------------------------------------------------