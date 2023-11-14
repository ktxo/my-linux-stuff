# My Linux stuff: commands, alias, etc 


Just some Linux commands, scripts, references that I use 

----
1. [Linux alias](#alias)
2. [My tools and scripts](#my-tools-and-scripts)
    - [ngrok](#ngrok)

3. [CopyQ](README-copyq.md): Clipboard manager (https://hluk.github.io/CopyQ/)

## Alias

I have several Linux alias, some of them are "temporal" (defined for an ongoing project) and others are "permanent". 

All my alias are defined in a file [**myalias**](myalias) and I call this file from **.profile** script

To avoid a collition with Linux commands or aliases I prefer to use UPPERCASE for mine (my convention  ¯\_(ツ)_/¯):

Some examples and outputs:
```
# "permanent" alias

alias CA='conda activate $@'
alias CD='conda deactivate'
alias CL='ls -1d /sw/anaconda/envs/* | awk -F"/" "{printf(\"%-20s %s\\n\", \$5, \$0)}" | sort'

alias LA='alias | grep "^alias [A-Z]" | sed -e "s/^alias //" | sort | awk -F= "{printf \"%-10s %s\n\", \$1, \$2}"'

# "temporal alias"
# For project "RMC"

alias RMC='cd /projects/RMC/src'

```
Listing existing conda envs
```
$> CL
aws                  /sw/anaconda/envs/aws
cvtool               /sw/anaconda/envs/cvtool
guis                 /sw/anaconda/envs/guis
```
Listing existing alias
```
$> LA
AI         'cd /projects/ML/OPENAI; conda activate oai'
AID        'cd /projects/ML/OPENAI/vector-db'
CA         'conda activate $@'
CD         'conda deactivate'
CL         'ls -1d /sw/anaconda/envs/* | awk -F"/" "{printf(\"%-20s %s\\n\", \$5, \$0)}" | sort'
DF         'df -h |egrep -v "snap|tmpfs|boot|udev"'
DLC        'docker ps $@'
DLI        'docker image ls $@'
J          'jupyter notebook'
LA         'alias | grep "^alias [A-Z]" | sed -e "s/^alias //" | sort | awk -F
N          'nohup nautilus -w . > /dev/null 2>&1 &'
T          'touch .'
...
```


## My Tools and scripts

I did some scripts and tools (I still doing, there is always an opportunity for a new script or tool in Linux)

My scripts and tools are in folder **/sw** (again my convention ¯\_(ツ)_/¯), I found this convention useful: when I cange my  computer  I just copy this folder and run a script to *"install all"*: generally, installation is  is just  define some environment variables and create some symbolic links

- ### ngrok

Sometimes I use [ngrok](https://ngrok.com/) to expose quickly a local port to internet (e.g.: testing a Flask or FasAPI development)
 
Script [run_ngrok.sh](run_ngrok.sh) is a wrapper to ngrok command
```
$> run_ngrok.sh -h
NAME
 Wrapper for ngrok command (https://ngrok.com/)

 ngrok command=/sw/ngrok

USAGE
 run_ngrok.sh [-P port_number] [-u user -p pass]  [-c http|tcp]

EXAMPLES
 run_ngrok.sh -P 8989                      # expose HTTP 8989
 run_ngrok.sh -P 8989 -u admin -p passw0rd # expose HTTP 8989 with basic auth admin:passw0rd
```

