# Data Analytics - Project 1 [Update Me!]

This GitHub repo is a complete end-to-end data analytics project with the following components:

1. `SQL/` contains SQL scripts used to analyse project client data from `DVD Rentals R Us` and `HR Analytica` within a `Postgres` instance

2. `R/` contains an `RMarkdown Notebook` for data analysis using `Tidyverse` and also generates a simple HTML `Flexdashboard` with high level business reporting metrics

3. `Python/` contains a basic `iPython Notebook` where we reproduce the R analysis and charts using `seaborn`, `matplotlib`, `pandas` and `plotly` to generate interactive data visualizations

4. GitHub Pages Setup
    * `docs/` is used as the source for our GitHub Pages website used to showcase this project

5. Docker Infrastructure Setup
    * `docker-compose-sql.yml` spins up a `postgresql` and `SQLPad` containers
    * `docker-compose-rstudio.yml` spins up an R Studio Verse container
    * `docker-compose-jupyter.yml` spins up a Jupyter SciPy Notebook container

6. `Makefile` commands to automate repetitive `docker-compose` commands

# Guidelines [Delete Me!]

## Pre-Flight Checks

1. Make sure the following are installed:
    * Git
    * Docker & Docker-Compose
    * Jekyll

You can choose to use your favourite IDE/text editor for this project, here are a few suggestions:
* VS Code
* PyCharm CE
* Atom
* Sublime Text

## Setup

1. Fork this repo to your Github profile
2. Enable the GitHub Pages
3. Clone the repo to your local machine

Optional Steps:
* Create a new branch called `feature/setup`
* Update the README.md and remove 
6. [Optional] Update the template GitHub Pages `doc/` folder

## SQL

1. [Optional] Create a new branch called `feature/sql` and start working on the SQL questions
2. Save data visualizations you create as you go inside the relevant folders in `SQL/`
3. Add code changes and new `.png` files to Git as you work via commits
4. Make commits when necessary and push them to your remote frequently
5. [Optional] Merge `feature/sql` with the `master` branch via a pull request once it is complete

## R Studio

[WIP]

## Jupyter Notebooks

[WIP]

## GitHub Pages

Using GNU Make you can run the following to preview the GitHub Pages Website locally on (port 4000)[http://localhost:4000]

```Bash
make serve
```

OR

```Bash
docker run -it --rm -v "$(PWD)/docs":/usr/src/app -p 4000:4000 -it starefossen/github-pages
```


# Quick Start Guide [Delete me!]

For convenience if you have GNU Make installed on your machine - you can run the following commands in the terminal for the following routines:

**Note: be sure to stop each container when you are done otherwise the resources will continue to be consumed on your machine!**

## Start Postgres and SQLPad Containers

```Bash
make start-sql
```

No GNU Make? Don't worry - just make sure you've installed Docker and Docker-Compose and you should be fine to run the following from the repo root:

```Bash
docker-compose -f docker-compose-sql.yml --force-recreate -d
```

If that STILL doesn't work - you can try playing around with this in the `Docker Playground` using the button below:  
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/datawithdanny/data-analytics-project-1/master/docker-compose-sql.yml)

## Stop Postgres and SQLPad Containers

* SQLPad at [port 3000](http://localhost:3000)

```Bash
make stop-sql
```

OR

```Bash
docker-compose -f docker-compose-sql.yml down -v --remove-orphans
```

OR if you're on `Docker Playground` be sure to copy all of your work to your local folders as these are not persistent, you can simply just exit and it'll be good!


## Start R Studio, Postgres and SQLPad Containers

* SQLPad at [port 3000](http://localhost:3000)
* R Studio at [Port 8787](http://localhost:8787)
    + Default username `rstudio` and password `DataWithDanny`

```Bash
make start-rstudio
```

OR

```Bash
docker-compose -f docker-compose-sql.yml --force-recreate -d
```

OR using `Docker Playground` - just be wary because the images will consume quite a lot of memory...
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/datawithdanny/data-analytics-project-1/master/docker-compose-rstudio.yml)

OR [placeholder for public cloud edition!]

## Stop R Studio, Postgres and SQLPad Containers

```Bash
make stop-rstudio
```

OR

```Bash
docker-compose -f docker-compose-rstudio.yml down -v --remove-orphans
```

## Start Jupyter SciPy Notebook, Postgres and SQLPad Containers

* SQLPad at [port 3000](http://localhost:3000)
* Jupyter Notebook Server at [Port 8888](http://localhost:8888)
    + default password/token `DataWithDanny`

```Bash
make start-jupyter
```

OR

```Bash
docker-compose -f docker-compose-jupyter.yml --force-recreate -d
```

OR using `Docker Playground` - just be wary because the images will consume quite a lot of memory...
[![Try in PWD](https://raw.githubusercontent.com/play-with-docker/stacks/master/assets/images/button.png)](https://labs.play-with-docker.com/?stack=https://raw.githubusercontent.com/datawithdanny/data-analytics-project-1/master/docker-compose-rstudio.yml)

## Stop Jupyter SciPy Notebook, Postgres and SQLPad Containers

```Bash
make stop-jupyter
```

OR

```Bash
docker-compose -f docker-compose-rstudio.yml down -v --remove-orphans
```