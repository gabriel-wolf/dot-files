
### Git
git-all () { git commit -a -m updates; git push ;}


### S3 
# View
vgpr () { aws s3 ls s3://issacs-gpr-dev/ ;} 
vlam () { aws s3 ls s3://issacs-lambda-dev/ ;}

# Upload
gup-r () { aws s3 cp "$1" "$2" --recursive ;}
gup () { aws s3 cp "$1" "$2" ;}
urec () { aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/"$2"/ --recursive ;} 
ufile () { aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/"$2"/ ;}

# Date
vdate () { aws s3 ls s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ ;}
vsdate () { aws s3 ls s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-"$1"/ ;}
urdate () { aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-"$2"/ --recursive ;}
udate () { aws s3 cp "$1" s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-"$2"/ ;} 

# Download
ddate () { aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ "$2" --recursive ;}
dwdate () { aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-"$1"/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/"$1"/  --recursive ;}
dswdate () { aws s3 cp s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-"$1"/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/"$1"/  --recursive ;}
dfile () { aws s3 cp "$1" "$2" ;}
drec () { aws s3 cp "$1" "$2" --recursive ;}


### Testing
test16 () { aws s3 cp s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ --recursive ;}


### Fixes
time-fix () { sudo service ntp restart ;}


### File Viewing
lessbin () { xxd "$1" | less ;}


### Navigation










