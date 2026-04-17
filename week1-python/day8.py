import pandas as pd

df = pd.read_csv("week1-python/data.csv")

print(df.groupby("user")["amount"].count())
df["bet"] = df.apply(lambda x: x["amount"] if x["type"]
                     == "bet" else 0, axis=1)
df["win"] = df.apply(lambda x: x["amount"] if x["type"]
                     == "win" else 0, axis=1)

summary = df.groupby("user")[["bet", "win"]].sum()
print(summary)
print(summary[summary["win"] > summary["bet"]])
summary["status"] = summary.apply(
    lambda x: "Profit" if x["win"] > x["bet"] else "Loss",
    axis=1
)

print(summary)
