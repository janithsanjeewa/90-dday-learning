import pandas as pd

df = pd.read_csv("week1-python/data.csv")

print(df.head())
bets = df[df["type"] == "bet"]

country_total = bets.groupby("country")["amount"].sum()
print(country_total)

print(country_total.sort_values(ascending=False).head(1))

df["bet"] = df.apply(lambda x: x["amount"] if x["type"]
                     == "bet" else 0, axis=1)
df["win"] = df.apply(lambda x: x["amount"] if x["type"]
                     == "win" else 0, axis=1)

ggr = df.groupby("user")[["bet", "win"]].sum()
ggr["GGR"] = ggr["bet"] - ggr["win"]

print(ggr)
