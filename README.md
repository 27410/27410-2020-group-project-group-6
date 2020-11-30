[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/27410/[27410-2020-group-project-group-6]/main)

# 27410 - Group assignment - Group 6 - E. coli as a cell factory for Serine production

> Dear students, thank you for accepting the group assignment. Please fill in the
> requested information below and above ([Group Number] and [TITLE]) and remove this quoted part before submission (everything prepended with a >).
> Please also replace `[PUT-YOUR-REPOSITORY-HERE]` up in the first line 👆 with the name of your repository here on GitHub.
> That way someone can click on the Binder badge icon and open your project in Jupyter lab to explore it.
> For this to work you will also have to keep `requirements.txt` up to date (by running `pip freeze > requirements.txt`).
> Furthermore, this will only work if you decide to make your repository public (which you can do under Settings -> Options),
> which I would encourage you to do – up to you. A lot of good science happens out in the open these days.
> Good luck!

## Project summary (<300 words)
This project aims to find ways to optimise the use of Escherichia coli as cell factory for production of L-serine. For the modelling purposes, the iML1515 model will be used to predict knockout/over-expression strategies that would increase the cells' production and export of L-serine. Gene modifications shown to increase L-serine titer in vivo in E. coli found in literature will also be tested in the model. 

## Project overview
The main report is found in the 'Report.ipynp' file. This notebook includes introduction, the main code and results, discussion and a conclusion to the project. 

Requirements for running the code can be found in 'requirements.txt'.

The GSM model iML1515 is included in the repository as 'iML1515.xml' and the quality of this model was assessed with the MEMOTE python software, the result of which can be found in the file 'iML1515_memote_Snapshot.html'. 

The folder 'Working files' contains a notebook with the FSEOF analysis in its entirety, 'FSEOF.ipynb',  and a notebook with the code for a Gecko enchancement of the model, 'Gecko algorithm.ipynb'. For the Gecko analysis, another GSM model was also used, included as 'eciML1515_batch.xml' in the folder. Finally, a file 'iJO1366.Central metabolism with Serine.json' in the Working files folder is necessary for visualization of the Escher maps in 'Report.ipynp'. 
