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

# Switch back to root so that supervisord runs under that user
USER root

#COPY and ADD don't add as the current user https://github.com/docker/docker/issues/7390, https://github.com/docker/docker/pull/13600
RUN chown $NB_USER:$NB_GID $HOME/work -R

USER $NB_UID

