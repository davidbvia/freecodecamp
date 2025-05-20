import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
    df = pd.read_csv("epa-sea-level.csv")

    # Create scatter plot
    X = df["Year"]
    Y = df["CSIRO Adjusted Sea Level"]
    plt.scatter(x = X, y = Y)

    # Create first line of best fit
    slope, intercept, r_value, p_value, std_err = linregress(X, Y)
    plt.plot(X, slope * X + intercept, color = "green")

    # Create second line of best fit
    years_pred = np.arange(2013, 2050)
    level_pred = slope * years_pred + intercept
    plt.plot(years_pred, level_pred, color = "red")



    # Add labels and title
    plt.title("Rise in Sea Level")
    plt.xlabel("Year")
    plt.ylabel("Sea Level (inches)")
    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()

draw_plot()