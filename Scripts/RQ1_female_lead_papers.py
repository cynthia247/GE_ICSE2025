import pandas as pd

df = pd.read_csv('RQ3.csv')
# Forward fill missing paper titles to associate rows with their respective papers
df['Paper Title'] = df['Paper Title'].ffill()

# Filter the dataset where 'female_lead?' column value is 1 for each paper
female_lead_papers = df[df['Female_lead?'] == 1]

# Merge the filtered_papers dataset with the main dataset where the Paper Title matches
merged_df = df[df['Paper Title'].isin(female_lead_papers['Paper Title'])]

# Keep only the first occurrence of 'Paper Title' and replace the rest with an empty string
merged_df['Paper Title'] = merged_df['Paper Title'].where(~merged_df.duplicated(subset=['Paper Title']), '')

# Save the updated DataFrame to a new CSV file
merged_df.to_csv('merged_filtered_papers.csv', index=False)

# Print the first few rows for verification
print(merged_df.head())

