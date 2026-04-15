import pandas as pd
df = pd.read_csv("week1-python/data.csv")
wins = df[df["type"] == "win"]
print(wins)

print(wins["amount"].sum())

bets = df[df["type"] == "bet"]
print(bets.groupby("user")["amount"].sum())

total = bets.groupby("user")["amount"].sum()
print(total.sort_values(ascending=False).head(1))
