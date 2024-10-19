import pandas as pd

# Load your dataset
df = pd.read_csv('RQ3_supervised.csv')

# Forward fill missing paper titles to associate rows with their respective papers
df['Paper Title'] = df['Paper Title'].ffill()

# Group by 'Paper Title' and calculate the number of unique affiliations for each paper
unique_affiliations_per_paper = df.groupby('Paper Title')['Affiliation'].apply(lambda x: len(set(x.dropna()))).reset_index()

# Rename the column for clarity
unique_affiliations_per_paper.columns = ['Paper Title', 'Unique Institute Count']

# Merge the 'unique_affiliations_per_paper' DataFrame with the original 'df' DataFrame to add the 'Unique Institute Count' column
df = pd.merge(df, unique_affiliations_per_paper, on='Paper Title', how='left')

# Keep only the first occurrence of 'Unique Institute Count' for each paper, set other rows to empty
df['Unique Institute Count'] = df.groupby('Paper Title')['Unique Institute Count'].transform(lambda x: [x.iloc[0]] + [None]*(len(x)-1))

# Save the updated DataFrame to a new CSV file with the 'Unique Institute Count' column
df.to_csv('unique_institute_count.csv', index=False)

# Print the first few rows for verification
print(df.head())
