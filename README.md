# Technical test kpi intelligence database

## Description

Paris Region wants to have a web application to track the investments it makes for its high schools buildings.
This repo contains Dockerfiles that implements a postgres:11 server, creates the table investment and imports the investment in this table

## Requirement

* Docker : you can acces the installation documentation [here](https://docs.docker.com/install/)

## Launch the databse

* Build the docker image `docker build --rm . -t hbaltz/technical-test-kpi-intelligence-db:TAG`
* Delete old container `docker rm db`
* Launch the image `docker run -v postgres-data:/var/lib/postgresql/data -d -p 5432:5432 --name=db hbaltz/technical-test-kpi-intelligence-db:TAG`