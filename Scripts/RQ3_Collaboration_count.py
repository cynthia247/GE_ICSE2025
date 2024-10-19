import pandas as pd

# Load your dataset
df = pd.read_csv('RQ3.csv')

# Forward fill missing paper titles to associate rows with their respective papers
df['Paper Title'] = df['Paper Title'].ffill()

# Convert collaboration columns to numeric, forcing non-numeric values to NaN
df['local_Contribution?'] = pd.to_numeric(df['local_Contribution?'], errors='coerce')
df['national_collaboration?'] = pd.to_numeric(df['national_collaboration?'], errors='coerce')
df['International_collaboration?'] = pd.to_numeric(df['International_collaboration?'], errors='coerce')

# Step 1: Identify papers that have at least one female author
papers_with_female_authors = df[df['Gender'] == 'Female']['Paper Title'].unique()
print(f'The number of papers with at least one female author: {len(papers_with_female_authors)}')

# Step 2: Identify papers where both male and female have supervision contribution
# Group by paper and gender, then check for supervision contributions
grouped_supervision = df[df['Supervision'] == 1].groupby(['Paper Title', 'Gender']).size().unstack(fill_value=0)

# Identify papers with both male and female supervision
papers_with_both_supervision = grouped_supervision[(grouped_supervision['Male'] > 0) & (grouped_supervision['Female'] > 0)].index

# Step 3: Filter papers where only female authors have supervision contribution (excluding papers with both)
filtered_papers = df[(df['MaleSupervision'] == 1) & (~df['Paper Title'].isin(papers_with_both_supervision))]
print("Filter papers where only female authors have supervision contribution (excluding papers with both) ", len(filtered_papers))
filtered_papers.to_csv('filtered_papers.csv', index=False)

# Step 4: Count the number of papers with local, national, and international collaboration for those filtered papers
num_papers = filtered_papers['Paper Title'].nunique()
print("the number of papers with local, national, and international collaboration for those filtered papers", num_papers)

local_count = 0.0
national_count = 0.0
int_count = 0.0

for i, row in df.iterrows():
    if row['Paper Title'] in (filtered_papers['Paper Title']).values:  # Compare if the row paper is in the filtered paper list
        if row['local_Contribution?'] == 1.0:
           local_count += row['local_Contribution?']
        if row['national_collaboration?'] == 1.0:
           national_count += row['national_collaboration?']        
        if row['International_collaboration?'] == 1.0:
           int_count += row['International_collaboration?']

print('local: ', local_count)
print('national: ', national_count)
print('international: ', int_count)

# Merge the filtered_papers dataset with the main dataset where the Paper Title matches
merged_df = df[df['Paper Title'].isin(filtered_papers['Paper Title'])]

# Keep only the first occurrence of 'Paper Title' and replace the rest with an empty string
merged_df['Paper Title'] = merged_df['Paper Title'].where(~merged_df.duplicated(subset=['Paper Title']), '')

# Save the updated DataFrame to a new CSV file
merged_df.to_csv('merged_filtered_papers.csv', index=False)

# Print the first few rows for verification
print(merged_df.head())

