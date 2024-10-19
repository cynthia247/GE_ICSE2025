# import pandas as pd

# # Load your dataset from a CSV file (replace 'your_file.csv' with the actual path to your file)
# df = pd.read_csv('2020.csv')

# # Forward fill missing paper titles to associate rows with their respective papers
# df['Paper Title'] = df['Paper Title'].ffill()

# # Step 1: Filter papers where the lead author is female
# lead_female_papers = df[(df['Gender'] == 'Female') & (df['lead?'] == '0')]['Paper Title'].unique()

# # Step 2: Count the number of female and male authors for those papers
# filtered_authors = df[df['Paper Title'].isin(lead_female_papers)]
# female_authors_count = filtered_authors[filtered_authors['Gender'] == 'Female'].shape[0]
# male_authors_count = filtered_authors[filtered_authors['Gender'] == 'Male'].shape[0]

# # Output the results
# print(f'Number of female authors where a female is the lead: {female_authors_count}')
# print(f'Number of male authors where a male is the lead: {male_authors_count}')


# import pandas as pd

# # Load your dataset from a CSV file (replace 'your_file.csv' with the actual path to your file)
# df = pd.read_csv('2024.csv')

# # Forward fill missing paper titles to associate rows with their respective papers
# df['Paper Title'] = df['Paper Title'].ffill()

# # Step 1: Identify papers where at least one female author is present
# papers_with_females = df[df['Gender'] == 'Female']['Paper Title'].unique()

# # Step 2: Filter the dataset to only include papers that have female authors
# df_with_females = df[df['Paper Title'].isin(papers_with_females)]

# # Step 3: Ensure that only the first row of each paper contains the title, other rows should be empty in the 'Paper Title' column
# df_with_females['Paper Title'] = df_with_females['Paper Title'].where(df_with_females['Paper Title'].ne(df_with_females['Paper Title'].shift()))

# # Save the filtered DataFrame to a new CSV file (replace 'filtered_papers.csv' with your desired output filename)
# df_with_females.to_csv('filtered_papers.csv', index=False)

# print("Filtered papers have been saved to 'filtered_papers.csv'")


# import pandas as pd

# # Load your dataset from a CSV file (replace 'your_file.csv' with the actual path to your file)
# df = pd.read_csv('all_data.csv')

# # Forward fill missing paper titles to associate rows with their respective papers
# df['Paper Title'] = df['Paper Title'].ffill()

# # Step 1: Identify papers where any female is a supervisor
# papers_with_female_supervisor = df[(df['Gender'] == 'Male') & (df['Supervision'] == 1)]['Paper Title'].unique()

# # Step 2: Identify papers where the lead author is a woman
# papers_with_female_lead = df[(df['Gender'] == 'Male') & (df['lead?'] == '0')]['Paper Title'].unique()

# # Step 3: Find papers where there is both a female supervisor and the lead author is female
# papers_with_female_lead_and_supervisor = set(papers_with_female_supervisor).intersection(papers_with_female_lead)

# # Step 4: Output the result
# if len(papers_with_female_lead_and_supervisor) > 0:
#     print(f'The following papers have a female supervisor and a female lead author:')
#     print(len(papers_with_female_lead_and_supervisor))
# else:
#     print('No papers found where a female is both a supervisor and the lead author is female.')



# ########## FEMALE_LEAD COUNTRIES #########
# import pandas as pd

# # Load your dataset from a CSV file (replace 'your_file.csv' with the actual path to your file)
# df = pd.read_csv('all_data.csv')

# # Forward fill missing paper titles to associate rows with their respective papers
# df['Paper Title'] = df['Paper Title'].ffill()

# # Step 1: Identify rows where the lead author is a female
# female_lead_rows = df[(df['Gender'] == 'Female') & (df['lead?'] == '0') & (df['Supervision'] == 1)].count()
# print(female_lead_rows)
# # Step 2: Extract the countries of the female lead authors
# female_lead_countries = female_lead_rows['Country'].unique()

# # Output the result
# if len(female_lead_countries) > 0:
#     print(f'Countries of female lead authors:')
#     print(female_lead_countries)
# else:
#     print('No female lead authors found.')


# -----------------------------------------------------------
# import pandas as pd

# # Load the dataset from the CSV file
# df = pd.read_csv('all_data.csv')

# # Forward fill missing 'Paper Title' values, if necessary
# df['Paper Title'] = df['Paper Title'].ffill()

# # Filter for female authors who are neither lead authors nor supervisors
# filtered_female_authors = df[
#     (df['Gender'] == 'Male') &  # Female authors
#     (df['lead?'] != '1') & # Not the lead author
#     (df['Supervision'] != 1)  # Not supervisors
# ]

# # Extract their contributions
# contributions = filtered_female_authors[['Author Name', 'Paper Title', 'Conceptualization', 'Data Curation', 
#                                          'Formal Analysis', 'Funding Acquisition', 'Investigation', 
#                                          'Methodology', 'Project Administration', 'Resources', 
#                                          'Software', 'Supervision' , 'Validation', 'Visualization', 
#                                          'Writing – Original Draft', 'Writing – Review & Editing']]

# # Save the results to a CSV file
# contributions.to_csv('female_non_lead_non_supervisor_contributions.csv', index=False)

# female_paper_titles = contributions['Paper Title'].unique()
# print(len(female_paper_titles))
# # Print the contributions for quick view
# print(female_paper_titles)


# result_dict = {}
# contribution_list = ['Conceptualization',	'Data Curation',	'Formal Analysis',	'Funding Acquisition',	'Investigation',	'Methodology',	'Project Administration',	'Resources',	'Software',	'Supervision',	'Validation',	'Visualization',	'Writing – Original Draft',	'Writing – Review & Editing']
# for i in contribution_list:
#     # Filter the papers that have at least one female author with Conceptualization value 1
#     filtered_papers = contributions[(contributions[i] == 1.0)]
#     num_papers = filtered_papers['Paper Title'].nunique()
#     print(f'The number of papers with at least one female author contributing to {i}: {num_papers}')

#     result_dict[i] =num_papers

# results_df = pd.DataFrame([result_dict])

# --------------------------------------

import pandas as pd

# Load the dataset from the CSV file
df = pd.read_csv('all_data.csv')

# Forward fill missing 'Paper Title' values, if necessary
df['Paper Title'] = df['Paper Title'].ffill()

# Step 1: Identify all paper titles where 'lead?' is 1
papers_with_lead = df[df['lead?'] == '0']['Paper Title'].unique()
print(len(papers_with_lead))

# Step 2: Filter out rows where 'Paper Title' matches any of those identified papers
df_filtered = df[~df['Paper Title'].isin(papers_with_lead)]

df_filtered.to_csv('test.csv', index=False)

papers_with_female_supervisor = df_filtered[(df_filtered['Gender'] == "Male") & (df_filtered['Supervision'] == 1)]['Paper Title'].unique()

df_filtered2 = df_filtered[~df_filtered['Paper Title'].isin(papers_with_female_supervisor)]
print(len(df_filtered2))
df_filtered2.to_csv('test2.csv', index=False)


result_dict = {}
contribution_list = ['Conceptualization',	'Data Curation',	'Formal Analysis',	'Funding Acquisition',	'Investigation',	'Methodology',	'Project Administration',	'Resources',	'Software',	'Supervision',	'Validation',	'Visualization',	'Writing – Original Draft',	'Writing – Review & Editing']
for i in contribution_list:
    # Filter the papers that have at least one female author with Conceptualization value 1
    filtered_papers = df_filtered2[(df_filtered2['Gender'] == "Male") &(df_filtered2[i] == 1.0)]
    num_papers = filtered_papers['Paper Title'].nunique()
    print(f'The number of papers with at least one female author contributing to {i}: {num_papers}')

    result_dict[i] =num_papers

results_df = pd.DataFrame([result_dict])

# # Step 3: Further filter for male authors who are neither lead authors nor supervisors
# filtered_male_authors = df_filtered[
#     (df_filtered['Gender'] == 'Male') &  # Male authors
#     (df_filtered['lead?'] != '1') &      # Not the lead author
#     (df_filtered['Supervision'] != 1)    # Not supervisors
# ]

# # Extract their contributions
# contributions = filtered_male_authors[['Author Name', 'Paper Title', 'Conceptualization', 'Data Curation', 
#                                        'Formal Analysis', 'Funding Acquisition', 'Investigation', 
#                                        'Methodology', 'Project Administration', 'Resources', 
#                                        'Software', 'Supervision', 'Validation', 'Visualization', 
#                                        'Writing – Original Draft', 'Writing – Review & Editing']]

# # Optionally, display or save the results
# print(contributions)
# contributions.to_csv('filtered_male_contributions.csv', index=False)
