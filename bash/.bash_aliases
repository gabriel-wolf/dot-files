# .bash_aliases for Ubuntu on Windows Subsystem For Linux 2
# ====================================================================
# - https://github.com/gabriel-wolf/dot-files/
# - gabeericwolf@gmail.com


# Git
# --------------------------------------------------------------------

# commit all and push current directory
git-all () { 
    git commit -a -m updates; git push ;
}


# Bash
# --------------------------------------------------------------------

# apply bashrc changes to current bash session
sourcerc () { 
    source ~/config/bash/.bashrc ;
}


# Fix
# --------------------------------------------------------------------

# fix aws time skewed error
time-fix () { 
    sudo service ntp restart ;
}


# File Viewing
# --------------------------------------------------------------------

# open a text output of a .bin file in less
lessbin () { 
    xxd "$1" | less ;
}


# Navigation
# --------------------------------------------------------------------



# S3 Bucket
# --------------------------------------------------------------------

# view the base of the gpr bucket
vgpr () { 
    aws s3 ls s3://issacs-gpr-dev/ ;
} 
# view the base of the lambda bucket
vlam () { 
    aws s3 ls s3://issacs-lambda-dev/ ;
}

# copy something to somewhere recursive
gup-r () { 
    aws s3 cp "$1" "$2" --recursive ;
}
# copy something to somewhere 
gup () { 
    aws s3 cp "$1" "$2" ;
}
# upload something to somewhere on the ammobox lambda dev bucket recursively
urec () { 
    aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/"$2"/ --recursive ;
} 
# upload something to somewhere on the ammobox lambda dev bucket
ufile () { 
    aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/"$2"/ ;
}

# view the contents of a date for the gpr bucket ammobox
vdate () { 
    aws s3 ls s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ ;
}
# view the contents of a date for the gpr bucket smallbox
vsdate () { 
    aws s3 ls s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-"$1"/ ;
}
# upload something to some date in the lambda bucket recursively
urdate () { 
    aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-"$2"/ --recursive ;
}
# upload something to some date in the lambda bucket
udate () { 
    aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-"$2"/ ;
} 

# download all the files of some date to somewhere recursively
ddate () { 
    aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ "$2" --recursive ;
}
# download the files from some date ammobox gpr bucket to the visualization folder for that same date on the host machine recursively
dwdate () { 
    aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/"$1"/  --recursive ;
}
# download the files from some date smallbox gpr bucket to the visualization folder for that same date on the host machine recursively
dswdate () { 
    aws s3 cp s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-"$1"/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/"$1"/  --recursive ;
}
# download something to somewhere
dfile () { 
    aws s3 cp "$1" "$2" ;
}
# download something to somewhere recursively
drec () { 
    aws s3 cp "$1" "$2" --recursive ;
}


# Testing
# --------------------------------------------------------------------

### upload the data from July 16th 2019 back to the lambda bucket so that it is processed again
test16 () { 
    aws s3 cp s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ --recursive ;
}











