FROM jupyter/pyspark-notebook:137a295ff71b 

MAINTAINER Leonardo Noleto


#Use unprivileged user provided by base image
USER $NB_UID

ENV JUPYTER_LAB_ENABLE="yes"

#Ship some data for workshop
COPY data $HOME/work/data/
COPY 00_welcome.ipynb $HOME/work/

#Install World cloud http://amueller.github.io/word_cloud/
#Install Drag'n'Drop Pivot Tableshttps://github.com/nicolaskruchten/jupyter_pivottablejs
RUN python3 -m pip install wordcloud pivottablejs