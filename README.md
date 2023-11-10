# My Linux stuff: commands, alias, etc 


Just some Linux commands, scripts, references that I use 

----
1. [Linux alias](#alias)


### Alias

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


