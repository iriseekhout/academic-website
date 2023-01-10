
##how to import publications from a bibtex file

# create bibtex file in google scholar
# open cmd
#then type the following command to install the academic package (python)

 pip3 install academic==0.5.1

#them move to the website folder
 cd C:\Users\eekhouti\OneDrive - TNO\Documents\GitHub\academic-website

#then run the import commands
 academic import --bibtex googlescholarexport.bib --overwrite
