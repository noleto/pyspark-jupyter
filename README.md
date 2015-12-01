# Jupyter Notebook Python + Spark for Toulouse Data Science workshop

## What it Gives You

* Jupyter Notebook 3.2
* Conda Python 3.x
* pyspark, pandas, matplotlib, scipy, seaborn, scikit-learn pre-installed
* Spark 1.5.1 for use in local mode
* Unprivileged user `jovyan` (uid=1000, configurable, see options) in group `users` (gid=100) with ownership over `/home/jovyan` and `/opt/conda`

## Basic Use

The following command starts a container with the Notebook server listening for HTTP connections on port 8888 without authentication configured.

```
docker run -d -p 8888:8888 -p 4040:4040 noleto/pyspark-jupyter
```

## Using Spark Local Mode

This configuration is nice for using Spark on small, local data.

0. Run the container as shown above.
2. Open a Python 3 notebook.
3. `SparkContext` is already configured for local mode.

For example, the first few cells in a Python 3 notebook might read:

```python
# do something to prove it works
rdd = sc.parallelize(range(1000))
rdd.takeSample(False, 5)
```

## Notebook Options

See base image page [Minimal Jupyter Notebook Stack](https://github.com/jupyter/docker-stacks/tree/3.2.x/minimal-notebook) 