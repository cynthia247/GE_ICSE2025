import pandas as pd

# Assuming your data is stored in a CSV or DataFrame
# Replace 'your_data_file.csv' with the actual file path if loading from a CSV
df = pd.read_csv('2024.csv')

# Forward fill the missing paper titles
df['Paper Title'] = df['Paper Title'].ffill()

# Step 1: Identify papers that have at least one female author
papers_with_female_authors = df[df['Gender'] == 'Female']['Paper Title'].unique()
print(len(papers_with_female_authors))

result_dict = {}
contribution_list = ['Conceptualization',	'Data Curation',	'Formal Analysis',	'Funding Acquisition',	'Investigation',	'Methodology',	'Project Administration',	'Resources',	'Software',	'Supervision',	'Validation',	'Visualization',	'Writing – Original Draft',	'Writing – Review & Editing']
for i in contribution_list:
    # Filter the papers that have at least one female author with Conceptualization value 1
    filtered_papers = df[(df['Gender'] == 'Male')& (df['Supervision'] == 1) & (df[i] == '1') & (df['Paper Title'].isin(papers_with_female_authors))]
    num_papers = filtered_papers['Paper Title'].nunique()
    print(f'The number of papers with at least one female author contributing to {i}: {num_papers}')

    result_dict[i] =num_papers

results_df = pd.DataFrame([result_dict])

# Save the results to a CSV file
results_df.to_csv('contribution_summary.csv', index=False)

