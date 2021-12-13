# Hypothesis testing
## Step to do:
### Step to do:

#### Step 0 Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)

Step 1 State the hypothesis
Step 2 Select Level of significance (alpha)
Step 3 Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
Step 4 Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
Step 5 Compare P-value with alpha or z/t with zalpha/talpha
Step 6 Conclusion
