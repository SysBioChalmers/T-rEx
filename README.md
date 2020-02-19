# T-REX
## A S. cerevisiae Transcription factor Explorer toolbox
This repository is administered by David Bergenholm (https://github.com/DavidBergenholm), Division of Systems and Synthetic Biology, Department of Biology and Biological Engineering, Chalmers University of Technology

## TRANSCRIPTION FACTOR SUMMARY

The first page in the toolbox includes a summary of the transcription factors included in the toolbox.

  ### SELECT TRANSCRIPTION FACTOR 
  Generates a table of identified targets and number of peaks. The consensus motif (generated from the meme-suit), the sequence map for generating the motif and the reads profile as well as the peak distribution profile.

  ### SELECT CONDITION
  allows the user to select one or more conditions.

  The targets list is downloadable in two formats. 

  ### PEAKLIST 
  Contains the Target gene, the condition and amount of bindings identified on said gene.

  ### PEAKLIST ADVANCED 
  Contains the Target gene, chromosome, position of gene start, strand of gene, distance of the peak from TSS, the strength of binding for each individual peak and the condition. Were the strength referring to log2(S/N).

## TRANSCRIPTION FACTOR BINDING DATA

This page allows the user to interact directly with the transcription factor binding data.

  ### SELECT GENE 
  allows you to find a gene either by the common name or the systematic name where one can search through the list.
  A Gene info box will appear with relevant information about the selected gene. This includes the systematic and common name, the gene start and chromosome, orientation, what gene is upstream and what gene is downstream.

  ### SELECT TRANSCRIPTION FACTOR 
  allows the user to include one or more TFs. 

  ### SELECT CONDITION
  allows the user to select one or more conditions.
  
  * Press Load Data

  ### LEGEND 
  has three options are available. 
  TF BS: Include all found binding sites based on the same data as displayed in Transcription factor summary. 
  TATA: Include the TATA/like box identified
  Fixed y-axis: Make scaling of the data easier to compare between conditions

  ### MOTIF 
  allows the user to include one or more motifs
  * Press Search (must be done for each new gene)

  ### SEQUENCE RELATIVE TO TSS
  Allows the user to get a specific sequence out relative to the TSS
  * Press Search

  ### DOWNLOAD DATA   
  The user can download the reads that are displayed for the individual conditions.
 
## TRANSCRIPTION FACTOR GO ANALYSIS

This page allows the user to do statistical testing of the transcription factors included in the toolbox.
      
  ### DATASET
  The Peaks dataset uses all identified peaks for any given transcription factor on any given promoter
  The SNR dataset uses all reads for any given transcription factor on any given promoter
  ### SELECT CONDITION
  allows the user to select one or more conditions.

  ### EXCLUDE OR INCLUDE DATA
  The user can here choose to include all genes in the Cen.PK genome or exclude dubious ORFs and only include genes available in Yeast8.

  ### GO-TERM
  The user can select one or several GO-terms. All the GO-terms included is displayed in the table “The selected GO-terms from search result”.

  ### TEST
  User selected statistical test to be used on the selected GO-term.
  
  ### SHARED TARGETS
  
  Here the user can see the overlapping targets between transcription factors
  
  * Press Search
  
  ## INCLUDE DATA SET
  Allows the user to include one more data set that can be analyzed in the TRANSCRIPTION FACTOR BINDING DATA or TRANSCRIPTION FACTOR GO ANALYSIS
## More info
For more info about new functions, the libraries used and how to incorporate more data or new conditions see the T-rEx_Documentation.pdf

## CONTRIBUTORS
- [Christoph Boerlin](https://www.chalmers.se/en/staff/Pages/borlinc.aspx); Chalmers University of Technology, Gothenburg Sweden
- [David Bergenholm](https://www.chalmers.se/en/staff/Pages/david-jullesson.aspx); Chalmers University of Technology, Gothenburg Sweden
- Petter Holland; Chalmers University of Technology, Gothenburg Sweden
- Jens Nielsen; Chalmers University of Technology, Gothenburg Sweden 
