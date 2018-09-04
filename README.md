# Data Munging with PySpark
	
## What it Gives You

* Basically the same as [Jupyter Notebook Python, Spark, Mesos Stack](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/specifics.html#apache-spark)
* Data for the workshop
* Startup Notebook to check everything is Ok!

## Basic Use

The following command starts a container with the Notebook server listening for HTTP connections on port 8888 without authentication configured.

```
docker run -d -p 8888:8888 -p 4040:4040 noleto/pyspark-jupyter
```

## Using Spark Local Mode

This configuration is nice for using Spark on small, local data.

0. Run the container as shown above.
2. Open a Python 3 notebook.

For example, the first few cells in a Python 3 notebook might read:

```python
import pyspark
sc = pyspark.SparkContext('local[*]')

# do something to prove it works
rdd = sc.parallelize(range(1000))
rdd.takeSample(False, 5)
```

## Notebook Options

See base image page [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html) 