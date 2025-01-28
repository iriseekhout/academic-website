##JAN 2024 >> deze werkt. Soms loopt hij vast bij bepaalde publicaties. Dus dat even goed checken. Ook de scholar list output goed cleanen.

source("scripts/bibtex_2academic.R")
my_bibfile <- "static/bibfiles/googlescolar_2025_01.bib"
outfold <- "content/publication"
# Use the conversion function
bibtex_2academic(my_bibfile,
                             outfold,
                             abstract = FALSE,
                             overwrite = FALSE
)
