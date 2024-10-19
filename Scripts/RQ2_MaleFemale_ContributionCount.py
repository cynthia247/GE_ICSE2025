import pandas as pd

# # Load the dataset from the CSV file
# df = pd.read_csv('Final_result.csv')

# # Forward fill the 'Paper Title' column to associate all rows with their respective papers
# df['Paper Title'] = df['Paper Title'].ffill()

# # Total number of male authors = Total Authors - Female Authors
# df['Total Male Authors'] = df['Total Authors'] - df['Female Authors']

# # Filter rows where 'Conceptualization' contribution is made (assuming 1 indicates contribution)
# conceptualization_data = df[df['Conceptualization'] == 1]

# # Contributions by male and female authors for each paper
# male_contrib = conceptualization_data[conceptualization_data['Gender'] == 'Male'].groupby('Paper Title').size()
# female_contrib = conceptualization_data[conceptualization_data['Gender'] == 'Female'].groupby('Paper Title').size()

# # Create a DataFrame combining the total authors and contributions
# contrib_ratio = pd.DataFrame({
#     'Paper Title': df['Paper Title'],
#     'Total Male Authors': df['Total Male Authors'],
#     'Total Female Authors': df['Female Authors'],
# })

# # Merge with the contributions data
# contrib_ratio = contrib_ratio.merge(male_contrib.rename('Male Contribution'), on='Paper Title', how='left')
# contrib_ratio = contrib_ratio.merge(female_contrib.rename('Female Contribution'), on='Paper Title', how='left')

# # Fill NaN values with 0 for contributions where no contributions were made by a gender
# contrib_ratio = contrib_ratio.fillna(0)

# # Calculate the male and female contribution ratios
# contrib_ratio['Male Contribution Ratio'] = contrib_ratio['Male Contribution'] / contrib_ratio['Total Male Authors']
# contrib_ratio['Female Contribution Ratio'] = contrib_ratio['Female Contribution'] / contrib_ratio['Total Female Authors']

# # Replace NaN values in the ratio with 0 for cases where no authors of a gender are present
# contrib_ratio['Male Contribution Ratio'] = contrib_ratio['Male Contribution Ratio'].fillna(0)
# contrib_ratio['Female Contribution Ratio'] = contrib_ratio['Female Contribution Ratio'].fillna(0)

# # Merge the contribution ratios back to the original DataFrame without changing the order
# df['Male Contribution Ratio'] = contrib_ratio['Male Contribution Ratio']
# df['Female Contribution Ratio'] = contrib_ratio['Female Contribution Ratio']

# # Save the results to a CSV file without changing the order of the original Paper Title
# output_file_path = 'Male_Female_Contribution_Ratio.csv'
# df.to_csv(output_file_path, index=False)

# # Display the path to the saved file
# # output_file_path




# Let's re-run the previous process to ensure the Male and Female Contribution Ratio columns are properly assigned
# and apply the logic to only fill in the first row for each Paper Title.

# Load the dataset from the CSV file
df = pd.read_csv('Final_result.csv')

# Forward fill the 'Paper Title' column to associate all rows with their respective papers
df['Paper Title'] = df['Paper Title'].ffill()

# Total number of male authors = Total Authors - Female Authors
df['Total Male Authors'] = df['Total Authors'] - df['Female Authors']

# Filter rows where 'Conceptualization' contribution is made (assuming 1 indicates contribution)
contribution= 'Resources'
conceptualization_data = df[df[contribution] == 1]

# Contributions by male and female authors for each paper
male_contrib = conceptualization_data[conceptualization_data['Gender'] == 'Male'].groupby('Paper Title').size()
female_contrib = conceptualization_data[conceptualization_data['Gender'] == 'Female'].groupby('Paper Title').size()

# Create a DataFrame combining the total authors and contributions
contrib_ratio = pd.DataFrame({
    'Paper Title': df['Paper Title'],
    'Total Male Authors': df['Total Male Authors'],
    'Total Female Authors': df['Female Authors'],
})

# Merge with the contributions data
contrib_ratio = contrib_ratio.merge(male_contrib.rename('Male Contribution'), on='Paper Title', how='left')
contrib_ratio = contrib_ratio.merge(female_contrib.rename('Female Contribution'), on='Paper Title', how='left')

# Fill NaN values with 0 for contributions where no contributions were made by a gender
contrib_ratio = contrib_ratio.fillna(0)

# Calculate the male and female contribution ratios
contrib_ratio['Male Contribution Ratio'] = contrib_ratio['Male Contribution'] / contrib_ratio['Total Male Authors']
contrib_ratio['Female Contribution Ratio'] = contrib_ratio['Female Contribution'] / contrib_ratio['Total Female Authors']

# Replace NaN values in the ratio with 0 for cases where no authors of a gender are present
contrib_ratio['Male Contribution Ratio'] = contrib_ratio['Male Contribution Ratio'].fillna(0)
contrib_ratio['Female Contribution Ratio'] = contrib_ratio['Female Contribution Ratio'].fillna(0)

# Only keep the ratio for the first appearance of each paper title
contrib_ratio['Male Contribution Ratio'] = contrib_ratio.groupby('Paper Title')['Male Contribution Ratio'].transform(lambda x: [x.iloc[0]] + [None]*(len(x)-1))
contrib_ratio['Female Contribution Ratio'] = contrib_ratio.groupby('Paper Title')['Female Contribution Ratio'].transform(lambda x: [x.iloc[0]] + [None]*(len(x)-1))

# Merge the contribution ratios back to the original DataFrame without changing the order

df[f'Female {contribution} Ratio'] = contrib_ratio['Female Contribution Ratio']
df[f'Male {contribution} Ratio'] = contrib_ratio['Male Contribution Ratio']

# Save the updated DataFrame to a CSV file
output_file_path = 'Male_Female_Contribution_Ratio.csv'
df.to_csv(output_file_path, index=False)

# Display the path to the saved file
output_file_path
