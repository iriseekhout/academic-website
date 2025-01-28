
##how to import publications from a bibtex file
#in python prompt:


import subprocess
import sys

def install(package):
  subprocess.check_call([sys.executable, "-m", "pip", "install", package])

# Install the academic package
install("academic")


# create bibtex file in google scholar
# open cmd
#then type the following command to install the academic package (python)

 pip3 install academic

#them move to the website folder
 cd C:\Users\eekhouti\OneDrive - TNO\Documents\GitHub\academic-website


 ## This code finally worked when the academic python package was installed..
 # https://github.com/GetRD/academic-file-converter
 C:\Users\eekhouti\AppData\Roaming\Python\Python312\Scripts\academic import --bibtex googlescholarexport.bib content/publication/ --overwrite


 ##NOTE that publication type needs to be a number (not string) so "2" for journal article.



