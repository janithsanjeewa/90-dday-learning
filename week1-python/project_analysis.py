import pandas as pd

# Load data
df = pd.read_csv("week1-python/data.csv")

print("=== FULL DATA ===")
print(df)

# Separate bets and wins
bets = df[df["type"] == "bet"]
wins = df[df["type"] == "win"]

# Total bet per user
bet_total = bets.groupby("user")["amount"].sum()

# Total win per user
win_total = wins.groupby("user")["amount"].sum()

# Combine into one table
summary = pd.DataFrame({
    "Total Bet": bet_total,
    "Total Win": win_total
}).fillna(0)

# Calculate GGR
summary["GGR"] = summary["Total Bet"] - summary["Total Win"]

print("\n=== USER SUMMARY ===")
print(summary)

# High risk users
high_risk = summary[summary["Total Bet"] > 500]

print("\n=== HIGH VALUE USERS ===")
print(high_risk)

# Top users
top_users = summary.sort_values(by="Total Bet", ascending=False).head(3)

print("\n=== TOP USERS ===")
print(top_users)
