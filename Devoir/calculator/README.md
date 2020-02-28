# Calculator

To check you homework, clone this repository and eneter this folder.

    sudo npm install -g jshint
    git clone https://github.com/UPB-FILS/alf.git
    cd alf/Devoir/calculator
    cp -R <folder to your homework>/* .
    cd verify
    ./run_all.sh ..

    If the sqrt check fails with a decimal point it is because of the NodeJS version of Linux.
    
    For the last version of NodeJS:
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
    sudo n latest
    
    FIX PATH:
    sudo apt-get install --reinstall nodejs-legacy
    
    To undo: 
    sudo n rm 6.0.0     # replace number with version of Node that was installed
    sudo npm uninstall -g n
