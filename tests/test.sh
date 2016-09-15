#!/bin/bash
export PYTHONDONTWRITEBYTECODE='1'

# make the virtualenv if it if does not already exist
if [ ! -d '.venv' ]
then
    virtualenv .venv
    . .venv/bin/activate 
    pip install -r requirements.txt
fi

# if configured,  over-write the defaut target
if [ -f 'config.sh' ]
then
    . config.sh
fi

. .venv/bin/activate
py.test $@
deactivate
