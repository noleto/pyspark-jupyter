FROM jupyter/minimal-notebook:3.2

MAINTAINER Leonardo Noleto

USER root

# Spark dependencies
ENV APACHE_SPARK_VERSION 1.5.1

# Install necessary packages
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends openjdk-7-jre-headless && \
    apt-get clean

# Download pre-compiled Apache Spark
RUN wget -qO - http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-hadoop2.6.tgz | tar -xz -C /usr/local/

RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop2.6 spark

#Use unprivileged user provided by base image
USER jovyan

# Install Python 3 packages
RUN conda install --yes \
    'pandas=0.16*' \
    'matplotlib=1.4*' \
    'scipy=0.15*' \
    'seaborn=0.6*' \
    'scikit-learn=0.16*' \
    && conda clean -yt


#Prepare environment
ENV SPARK_HOME /usr/local/spark
ENV PYSPARK_SUBMIT_ARGS="--master local[*] pyspark-shell"
#ENV PYTHONPATH $SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip

RUN ipython profile create pyspark

COPY 00-pyspark-setup.py $HOME/.ipython/profile_pyspark/startup/00-pyspark-setup.py
COPY ipython_notebook_config.py $HOME/.ipython/profile_pyspark/

COPY data $HOME/work/data
#COPY and ADD don't add as the current user https://github.com/docker/docker/issues/7390, https://github.com/docker/docker/pull/13600
USER root
RUN chown jovyan:jovyan $HOME/work/data -R

#Back to our unprivileged user
USER jovyan

EXPOSE 4040

CMD ipython notebook --no-browser --profile=pyspark