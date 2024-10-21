import pandas as pd

# Load the dataset
df = pd.read_csv('RQ3male.csv')

# Forward fill missing paper titles to associate rows with their respective papers
df['Paper Title'] = df['Paper Title'].ffill()

# Filter the dataset where 'female_lead?' column value is 1 for each paper
female_lead_papers = df[df['Female_lead?'] == 1]

# Define the search pattern for affiliations
search_pattern = r"(?i)\b(university|school|UniversitÃ|Universitat|Instituto|institute|college|Universidad)\b"  # Replace this with the actual pattern you're searching for

# Create a new column to check if all affiliations in a paper contain the search pattern
# Group by 'Paper Title' and check if all affiliations within that group contain the search pattern
grouped_affiliation_check = df.groupby('Paper Title').apply(
    lambda group: group['Affiliation'].str.contains(search_pattern, case=False, na=False).all()
).reset_index(name='All_Affiliations_Contain_Pattern')

# Merge the result with the original DataFrame
merged_df = df.merge(grouped_affiliation_check, on='Paper Title', how='left')

# Keep only the first occurrence of 'Paper Title' and replace the rest with an empty string
merged_df['All_Affiliations_Contain_Pattern'] = merged_df.groupby('Paper Title')['All_Affiliations_Contain_Pattern'].transform(lambda x: [x.iloc[0]] + [None]*(len(x)-1))

# Save the updated DataFrame to a new CSV file
merged_df.to_csv('merged_filtered_papers.csv', index=False)

# Print the first few rows for verification
print(merged_df.head())
