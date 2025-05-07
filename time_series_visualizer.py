import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
df = pd.read_csv("fcc-forum-pageviews.csv", index_col = "date")
df.index = pd.to_datetime(df.index)

# Clean data
total = df["value"].sum()
lowerThan, upperThan = list(), list()
for i in df["value"]:
    if i > total * 0.025 / 100:
        upperThan.append(i)
    elif i < total * 0.025 / 100:
        lowerThan.append(i)
    else: pass

def draw_line_plot():
    # Draw line plot
    date = [f"{i.year}-{i.month}" for i in df.index]
    values = [i for i in df["value"]]
    df_lineplot = pd.DataFrame(zip(date, values))
    df_lineplot = df_lineplot.groupby(0)[1].sum()

    fig = plt.figure(figsize = (15, 6))
    plt.plot(df_lineplot, color = "red")
    plt.title("Daily freeCodeCamp Forum Page Views 5/2016-12/2019")
    plt.xlabel("Date")
    plt.ylabel("Page Views")
    plt.xticks(rotation = 45)

    # Save image and return fig (don't change this part)
    fig.savefig('line_plot.png')
    return fig

draw_line_plot()

def draw_bar_plot():
    # Copy and modify data for monthly bar plot
    df["Month"] = df.index.month_name()
    columns = ["Year", "Month", "Value"]
    bar_plot = pd.DataFrame([df.index.year, df["Month"], df["value"]]).T

    bar_plot.rename(columns = {0 : "Year", 1 : "Month", 2 : "Value"}, inplace = True)
    
    # Draw bar plot
    X = bar_plot["Year"]
    Y = bar_plot["Value"]
    fig = plt.figure(figsize = (12, 8))
    sns.barplot(data = bar_plot, x = X, y = Y, hue = bar_plot["Month"], palette = "rainbow", legend = "auto")
    plt.ylabel("Average Page Views")
    plt.xlabel("Years")

    # Save image and return fig (don't change this part)
    fig.savefig('bar_plot.png')
    return fig

draw_bar_plot()

# Prepare data for box plots (this part is done!)
df_box = df.copy()
df_box.reset_index(inplace=True)
df_box['year'] = [d.year for d in df_box.date]
df_box['month'] = [d.strftime('%b') for d in df_box.date]

def draw_box_plot():
    # Prepare data for box plots (this part is done!)
        df_box = df.copy()
        df_box.reset_index(inplace=True)
        df_box['year'] = [d.year for d in df_box.date]
        df_box['month'] = [d.strftime('%b') for d in df_box.date]

        # Draw box plots (using Seaborn)
        fig, axes = plt.subplots(1, 2, figsize = (10, 4), sharey = False)
        df_box = df_box[df_box["value"] < 200000]

        # Views by year
        sns.boxplot(ax = axes[0], data = df_box, x = "year", y = "value", palette = "rainbow", hue = "year", legend = False)
        axes[0].set_title("Year-wise Box Plot (Trend)")
        plt.xlabel("Year")
        plt.ylabel("Page Views")
        plt.ticklabel_format(style = "plain", axis = "y")

        df_box = df.copy()
        month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        values = [df_box[df_box["Month"] == f"{i}"]["value"] for i in month]
        month_list, value_list = list(), list()

        for i in range(len(values)):
            for j in range(len(values[i])):
                month_list.append(month[i])
                value_list.append(values[i][j])  

        df_box = pd.DataFrame(zip(month_list, value_list), columns = ["Month", "Value"])
        df_box = df_box[df_box["Value"] < 200000]

        # Views by month
        sns.boxplot(ax = axes[1], data = df_box, x = "Month", y = "Value", palette = "rainbow", hue = "Month", legend = False)
        axes[1].set_title("Month-wise Box Plot (Seasonality)") 
        plt.xlabel("Month")
        plt.xticks(rotation = 45)


        # Save image and return fig (don't change this part)
        fig.savefig('box_plot.png')
        return fig

draw_box_plot()