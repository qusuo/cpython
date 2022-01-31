# This file must be used with "%run bin/activate.py" from a notebook in Carnets
# you cannot run it directly

import os

homePath = os.environ['HOME']
libraryPath = os.path.join(homePath, "Library")

# deactivate:
if (os.environ.get('_OLD_VIRTUAL_PATH') is not None):
    os.environ['PYTHONPYCACHEPREFIX'] = os.path.join(libraryPath, "__pycache__")
    os.environ['PYTHONUSERBASE'] = libraryPath
    os.environ['PATH'] = os.environ['_OLD_VIRTUAL_PATH']
    del os.environ['_OLD_VIRTUAL_PATH']
    del os.environ['VIRTUAL_ENV']

path = os.environ['PATH']

virtualEnvDir = "__VENV_DIR__"
virtualEnvDir.replace('$HOME', homePath)
os.environ['_OLD_VIRTUAL_PATH'] = path
os.environ['PYTHONPYCACHEPREFIX'] = os.path.join(virtualEnvDir, "__pycache__")
os.environ['PYTHONUSERBASE'] = virtualEnvDir
os.environ['VIRTUAL_ENV'] = virtualEnvDir
os.environ['PATH'] = virtualEnvDir + '/bin:' + path

