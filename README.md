# BDNYCdb

## Getting the database

To download the BDNYC Database (currently version 1.0), fork this repo or download the zip file of its contents.

Please include a reference to the [Zenodo record](http://dx.doi.org/10.5281/zenodo.45169) in all publications which make use of the database.

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.45169.svg)](http://dx.doi.org/10.5281/zenodo.45169)

## Using the database

The BDNYC Database is a binary SQL file with a .db extension which can be accessed in many ways. 

However, we recommend you get the most out of your astronomy SQL databases via Python with [astrodbkit](https://github.com/BDNYC/astrodbkit.git).

Here is how you would load the database using [astrodbkit](https://github.com/BDNYC/astrodbkit.git):

```
from astrodbkit import astrodb
db = astrodb.Database('/path/to/bdnyc_database.db')
```

## Contributing your datasets

To contribute to this public repository, fork this repo, add your data using [astrodbkit](https://github.com/BDNYC/astrodbkit.git), and issue a pull request.

If you are adding spectra, we require the files to be hosted by a public online academic library or similarly long-lived data or research repository. All data in the current version are hosted by the [CUNY Academic Works](http://academicworks.cuny.edu). Please get in touch if you have any problems identifying a home for your spectra.
