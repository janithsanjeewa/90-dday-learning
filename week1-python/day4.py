import pandas as pd

# Load data
df = pd.read_csv("data.csv")

# Show data
print("Full Data:")
print(df)

# Filter bets only
bets = df[df["type"] == "bet"]
print("\nBets only:")
print(bets)

# Total bet amount
total_bet = bets["amount"].sum()
print("\nTotal Bet:", total_bet)

# Group by country
country_bet = bets.groupby("country")["amount"].sum()
print("\nBet per country:")
print(country_bet)

# High value transactions
high_value = df[df["amount"] > 300]
print("\nHigh transactions:")
print(high_value)
