#!/bin/bash

#containers names
c_names=( toulouse rio sydney dublin paris tunis london winnipeg cairo)
#Jupyter server port
base_web_port=8000

#Spark debug UI port
base_spark_ui_port=4000

for i in "${!c_names[@]}"
do
	city_name="${c_names[$i]}"
	web_port=$((base_web_port + $i))
	spark_ui_port=$((base_spark_ui_port + $i))
	docker run -d -p $web_port:8888 -p $spark_ui_port:4040 --name $city_name noleto/pyspark-jupyter
done