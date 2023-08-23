#! /bin/sh

# jupyter-something adds pandas-2.0.0 and pyzmq-25.0b1, which breaks things down 
# So far, the "fix" is to manually remove them. Add this to the script?
# Don't forget to edit easy-install.pth too!

# We need maturin installed, but inside your own Python build:
# pip install maturin

# 1) compile for OSX (required)
sh ./buildForOSX.sh

# 2) compile for iOS:
sh ./buildForiOS.sh

# 3) compile for Simulator:
# We don't compile for the simulator anymore (for the time being, at least) (August 21, 2023)
# When we reactivate this, it will have to be updated from buildForiOS.sh
# sh $PREFIX/buildForSimulator.sh


# Python build finished successfully!
# The necessary bits to build these optional modules were not found:
# _bz2                  _curses               _curses_panel      
# _gdbm                 _lzma                 _tkinter           
# _uuid                 nis                   ossaudiodev        
# readline              spwd                                     
# To find the necessary bits, look in setup.py in detect_modules() for the module's name.
# 
# 
# The following modules found by detect_modules() in setup.py, have been
# built by the Makefile instead, as configured by the Setup files:
# _abc                  atexit                pwd                
# time                                                           


