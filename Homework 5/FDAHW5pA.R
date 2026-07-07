# Two-factor model on daily log returns of eight stocks
# Data: Stock_FX_Bond.csv

data <- read.csv("Stock_FX_Bond.csv", header = TRUE)

# Select adjusted-close columns for the eight stocks
tickers <- c("GM_AC", "F_AC", "UTX_AC", "CAT_AC", "MRK_AC", "PFE_AC", "IBM_AC", "MSFT_AC")
prices <- data[, tickers]

# Compute daily log returns: r_t = log(P_t) - log(P_{t-1})
log_returns <- as.data.frame(apply(log(prices), 2, diff))
colnames(log_returns) <- c("GM", "Ford", "UTX", "CAT", "Merck", "Pfizer", "IBM", "Microsoft")

cat("Number of return observations:", nrow(log_returns), "\n\n")

# Fit two-factor model, no rotation
fa_fit <- factanal(log_returns, factors = 2, rotation = "none")

print(fa_fit, digits = 3, cutoff = 0)
