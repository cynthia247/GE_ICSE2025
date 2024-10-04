import pandas as pd

# Load the first CSV (containing paper title, female author count, total author count)
df_counts = pd.read_csv('authors_summary.csv')  # Replace with your actual file name

# Load the second CSV (where you want to add the new columns)
df_papers = pd.read_csv('2024_v2.csv')  # Replace with your actual file name

# Merge the two DataFrames on the 'Paper Title' column
df_merged = pd.merge(df_papers, df_counts, on='Paper Title', how='left')

# Display the merged DataFrame (optional)
print(df_merged)

# Optionally, save the merged DataFrame to a new CSV file
df_merged.to_csv('merged_papers_with_author_counts.csv', index=False)
