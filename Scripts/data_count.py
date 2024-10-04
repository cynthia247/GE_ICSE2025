import pandas as pd

# Load the data from the CSV file
df = pd.read_csv('2024.csv')

# Forward fill the missing 'Paper Title' values
df['Paper Title'] = df['Paper Title'].fillna(method='ffill')

# Initialize a list to store the result for each paper
summary_list = []

# Loop through each unique paper title while maintaining the original order
for title in df['Paper Title'].unique():
    # Filter the dataframe for the current paper
    paper_df = df[df['Paper Title'] == title]
    
    # Count total authors for the paper
    total_authors = paper_df['Author Name'].count()
    
    # Count female authors for the paper
    female_authors = paper_df[paper_df['Gender'] == 'Female']['Author Name'].count()
    
    # Check if the first author is female
    first_author_gender = paper_df.iloc[0]['Gender']
    lead = 1 if first_author_gender == 'Female' else 0
    
    # Check if all affiliations match
    all_affiliations = paper_df['Affiliation'].nunique()  # Count unique affiliations
    local_contribution = 1 if all_affiliations == 1 else 0  # If there's only 1 unique affiliation, it's local
    
    # Check if all countries match (national collaboration)
    all_countries = paper_df['Country'].nunique()
    national_collaboration = 1 if all_countries == 1 else 0
    
    # Check for international collaboration (if more than 1 unique country)
    international_collaboration = 1 if all_countries > 1 else 0
    
    # Add the results to the summary list
    summary_list.append({
        'Paper Title': title,
        'Total Authors': total_authors,
        'Female Authors': female_authors,
        'lead?': lead,
        'local_Contribution?': local_contribution,
        'national_collaboration?': national_collaboration,
        'International_collaboration?': international_collaboration
    })

# Convert the summary list to a DataFrame
summary_df = pd.DataFrame(summary_list)

# Display the summary DataFrame
print(summary_df)

# Optionally, save the summary to a CSV file
summary_df.to_csv('authors_summary.csv', index=False)
