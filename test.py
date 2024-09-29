import fitz  # PyMuPDF
import re

def extract_pdf_content(pdf_path):
    # Open the PDF
    doc = fitz.open(pdf_path)
    text = ""
    
    # Extract text from all pages
    for page_num in range(doc.page_count):
        page = doc.load_page(page_num)
        text += page.get_text("text")
    
    return text

def extract_section(text, section_title, next_section_title=None):
    """
    Extracts a section from the text starting with section_title and ends before next_section_title.
    """
    pattern = rf"{section_title}(.*?){next_section_title if next_section_title else ''}"
    match = re.search(pattern, text, re.DOTALL | re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return None

def extract_title(text):
    """Extract the title (assumed to be the first major line in the PDF)."""
    lines = text.splitlines()
    for line in lines:
        if len(line.split()) > 5:  # Consider as title if it's a longer sentence
            return line.strip()
    return None

def extract_authors(text):
    """Extracts the author names (usually near the title)."""
    # Here we assume authors are listed within the first few lines after the title
    lines = text.splitlines()
    author_section = []
    for line in lines[:10]:  # Assuming authors are listed within first 10 lines after the title
        if re.match(r'[A-Za-z,\s]+$', line):  # Rough heuristic for author names
            author_section.append(line.strip())
    return ' '.join(author_section).strip()

def extract_affiliations(text):
    """Extracts the affiliations."""
    # Looking for common affiliation keywords such as 'University', 'Institute', etc.
    affiliation_keywords = ['University', 'Institute', 'Department', 'Lab', 'School', 'Center', 'Company']
    affiliations = []
    for line in text.splitlines():
        if any(keyword in line for keyword in affiliation_keywords):
            affiliations.append(line.strip())
    return '\n'.join(affiliations)

def extract_abstract(text):
    """Extracts the abstract from the text."""
    return extract_section(text, "abstract", "introduction")

def extract_credit_authorship(text):
    """Extracts the CRediT authorship contribution statement."""
    return extract_section(text, "CRediT authorship contribution statement", "Acknowledgments")

# Example usage
pdf_path = "/home/uji657/Downloads/src/Successful_Female_Researchers/JSS_Papers/2024/-piler--Compilers-in-search-of-compilatio_2024_Journal-of-Systems-and-Softwa.pdf"
text = extract_pdf_content(pdf_path)

title = extract_title(text)
authors = extract_authors(text)
affiliations = extract_affiliations(text)
abstract = extract_abstract(text)
credit_authorship = extract_credit_authorship(text)

print("Title:", title)
print("Authors:", authors)
print("Affiliations:", affiliations)
print("Abstract:", abstract)
print("CRediT Authorship Contribution Statement:", credit_authorship)
