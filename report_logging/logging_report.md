# REPORT "LOGGING WITH FLUEND"

To implement log collection for further storage and analysis. It is necessary to have a log collection system, with stdout of a specific pod, 
a place where those logs will be stored, as well as a utility for analysis. For these purposes, the following software will be used.

- **fluentd** - log collection
- **elasticsearch** - log storage
- **grafana** - visualization and analysis (although this is not the best choice for working with elasticsearch)

## Elasticsearch

To deploy Elasticsearch, I used the following YML configuration - `/fluentd/elasticsearch.yml`.  
This will create the necessary resources for Elasticsearch to work. Namely, the pod in which it will run and the endpoint for working with it via service.

![image 1](./photo/getservices.png)