import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# 1
df = pd.read_csv("medical_examination.csv")

# 2
df['overweight'] = np.where((df["weight"] / (df["height"] / 100) ** 2) > 25, 1, 0)

# 3
for i in df["cholesterol"]:
    if i == 1: df["cholesterol"] = df.iloc[i, 7] = "0"
    elif i > 1: df["cholesterol"] = df.iloc[i, 7] = "1"
    else: pass

for i in df["gluc"]:
    if i == 1: df["gluc"] = df.iloc[i, 7] = "0"
    elif i > 1: df["gluc"] = df.iloc[i, 7] = "1"
    else: pass

# 4 
def draw_cat_plot():
    # 5
    columns = ["cholesterol", "gluc", "smoke", "alco", "active", "overweight"]
    df_cat = pd.melt(df, id_vars = ["cardio"], value_vars = columns)

    # 6
    df_cat = df_cat.reset_index() \
            .groupby(["variable", "cardio", "value"]) \
            .agg("count") \
            .rename(columns = {"index" : "total"}) \
            .reset_index()
            
    # 7
    
    # 8
    fig = sns.catplot(
        x = "variable",
        y = "total",
        col = "cardio",
        hue = "value",
        data = df_cat,
        kind = "bar"
    )

    # 9
    fig.savefig('catplot.png')
    return fig

draw_cat_plot()


# 10
def draw_heat_map():
    # 11
    df_heat = df[
        (df["ap_lo"] <= df["ap_hi"]) & 
        (df["height"] >= df["height"].quantile(0.025)) & 
        (df["height"] <= df["height"].quantile(0.075)) & 
        (df["weight"] >= df["weight"].quantile(0.025)) & 
        (df["weight"] <= df["weight"].quantile(0.075))
    ]

    # 12
    corr = df_heat.corr()

    # 13
    mask = np.zeros_like(corr)
    mask[np.triu_indices_from(mask)] = True

    # 14
    fig = plt.figure(figsize = (12, 6))

    # 15
    sns.heatmap(
        corr,
        mask = mask,
        annot = True,
        fmt = ".1f"
    )

    # 16
    fig.savefig('heatmap.png')
    return fig

draw_heat_map()
