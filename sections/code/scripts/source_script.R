## Load packages ##

# Package list
pkg_list <- c("tidyverse", "ggplot2")

# Load packages
pacman::p_load(pkg_list, character.only = TRUE)

## Create scatter plot ##

# # Save number of cylinders (cyl) as factor
# # Otherwise, ggplot will treat it as a continuous variable
# mtcars <- mtcars %>%
#   mutate(cyl = as.factor(cyl))
# 
# # Create scatter plot
# mtcars_scatter <- ggplot(mtcars) +
#   geom_smooth(formula = y ~ x, aes(mpg, wt), method = "lm", se = TRUE, level = 0.95, 
#               fill = "#d7d8db", color = "black", size = 0.5) +
#   geom_jitter(aes(mpg, wt, color = cyl)) +
#   scale_y_continuous(expand = c(0,0), limits = c(0,6)) +
#   scale_x_continuous(expand = c(0,0), limits = c(10,35)) +
#   scale_color_brewer(type = "qual", palette = "Paired") +
#   theme_classic() +
#   labs(title = "Miles per gallon and vehicle weight are negatively correlated",
#        y = "Vehicle weight (1000 lbs)",
#        x = "Miles per gallon",
#        color = "Cylinders") +
#   theme(text=element_text(family = "LM Roman 10"))
# 
# # Save scatter plot
# ggsave("test_graph.png", plot = mtcars_scatter, width = 6, height = 3, units = "in")

## Create helper functions for formatting ##

# Make number formatting function for p values
# val is the p value I want to format
# format_code specifies whether I want to include the symbol or not
# format_code defaults to including the symbol
p_formatting <- function(val, format_code = 1) {
  
  # If I want to include the symbol (when I'm calling this variable in text)
  if (format_code == 1) {
    
    # If the p value is less than .001, get the less than symbol
    # Otherwise, get the equals symbol
    sign_type <- if_else(val < 0.001, "<", "=")
    
    # If the p value is less than .001, set the value equal to .001
    if (sign_type == "<") {
      val <- ".001"
  
      # Otherwise, get the actual p value,
      # round it to three decimal places, and
      # remove the leading zero
    } else {
      val <- sprintf("%.3f", val)
      val <- substring(val, 2)
    }
    
    # Combine the new/formatted p value with < or =,
    # depending on the p value
    val_string <- paste(sign_type, val, sep = " ")
    val_string
    
    # If I don't want the symbol (as in a table),
    # just round the value to three decimal places
    # and remove the leading zero
  } else if (format_code == 0) {
    
    val <- sprintf("%.3f", val)
    val_string <- substring(val, 2)
    val_string
    
  }
  
}

# Make number formatting function for t and F values
stat_formatting <- function(val) {
  sprintf("%.2f", abs(val))
}

# Make number formatting function for integers (e.g., reaction times in ms)
zero_formatting <- function(val) {
  sprintf("%.0f", val)
}

# Make number formatting function for percentages
pct_formatting <- function(val) {
  val %>% prod(100) %>% sprintf("%.2f", .) %>% paste0("%")
}

# Make number formatting function for degrees of freedom
df_formatting <- function(val) {
  if_else(val%%1 == 0, sprintf("%.0f", val), sprintf("%.2f", val))
}

# General number formatting
# Round to two decimal places, keep trailing zeros
# Include negative sign if less than zero
num_formatting <- function(val) {
  sprintf("%.2f", val)
}

# Make function to output APA formatting for t and F statistics
# Use with numbers already passed through df_, stat_, and p_formatting
apa_stat <- function(df, stat_val, p_val) {
  
  # Check if there are two df values (for an F statistic)
  # Or just one df value (for a t statistic)
  df <- c(df)
  
  # Format based on whether it's an F or t statistic
  if (length(df) == 2) {
    sprintf("*F*(%s, %s) = %s, *p* %s", df[1], df[2], stat_val, p_val)
  } else {
    sprintf("*t*(%s) = %s, *p* %s", df, stat_val, p_val)
  }
  
}

# Make function to output APA formatting for t and F statistics
# Use with numbers already passed through df_, num_, and p_formatting
apa_corr <- function(df, corr_val, p_val) {
  sprintf("*r*(%s) = %s, *p* %s", df, corr_val, p_val)
}