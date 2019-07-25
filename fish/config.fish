# Fish shell

egrep "^export " ~/.profile | while read e
	set var (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\1/")
	set value (echo $e | sed -E "s/^export ([A-Z_]+)=(.*)\$/\2/")
	
	# remove surrounding quotes if existing
	set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

	if test $var = "PATH"
		# replace ":" by spaces. this is how PATH looks for Fish
		set value (echo $value | sed -E "s/:/ /g")
	
		# use eval because we need to expand the value
		eval set -xg $var $value

		continue
	end

	# evaluate variables. we can use eval because we most likely just used "$var"
	set value (eval echo $value)

	#echo "set -xg '$var' '$value' (via '$e')"
	set -xg $var $value
end




# Fish
# --------------------------------------------------------------------

function tfunc -d "test fish function"
    pwd
    echo "hello world"
    echo $argv[1]
    echo $argv[2]
end

function updatefish -d "update fish functions"
    . ~/.config/fish/config.fish
end


# Git
# --------------------------------------------------------------------

function git-all -d "commit all and push current directory"
    git commit -a -m updates
    git push
end


# Bash
# --------------------------------------------------------------------

function sourcerc -d "apply bashrc changes to current bash session"
    source ~/config/bash/.bashrc
end


# Fix
# --------------------------------------------------------------------

function time-fix -d "fix aws time skewed error" 
    sudo service ntp restart 
end


# File Viewing
# --------------------------------------------------------------------

function lessbin -d "open a text output of a .bin file in less" 
    xxd $argv[1] | less 
end


# Navigation
# --------------------------------------------------------------------



# S3 Bucket
# --------------------------------------------------------------------

function vgpr -d "view the base of the gpr bucket"
    aws s3 ls s3://issacs-gpr-dev/
end

function vlam -d "view the base of the lambda bucket"
    aws s3 ls s3://issacs-lambda-dev/
end


function gup-r -d "copy something to somewhere recursive"
    aws s3 cp $argv[1] $argv[2] --recursive 
end

function gup -d "copy something to somewhere "
    aws s3 cp $argv[1] $argv[2] 
end

function urec -d "upload something to somewhere on the ammobox lambda dev bucket recursively"
    aws s3 cp $argv[1] s3://issacs-lambda-dev/Ammobox/IMU_Data/$argv[2]/ --recursive 
end 

function ufile -d "upload something to somewhere on the ammobox lambda dev bucket"
    aws s3 cp $argv[1] s3://issacs-lambda-dev/Ammobox/IMU_Data/$argv[2]/ 
end


function vdate -d "view the contents of a date for the gpr bucket ammobox"
    aws s3 ls s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-$argv[1]/ 
end

function vsdate -d "view the contents of a date for the gpr bucket smallbox"
    aws s3 ls s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-$argv[1]/ 
end

function urdate -d "upload something to some date in the lambda bucket recursively"
    aws s3 cp $argv[1] s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-$argv[2]/ --recursive 
end

function udate -d "upload something to some date in the lambda bucket"
    aws s3 cp $argv[1] s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-$argv[2]/ 
end 


function ddate -d "download all the files of some date to somewhere recursively"
    aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-$argv[1]/ $argv[2] --recursive 
end

function dwdate -d "download the files from some date ammobox gpr bucket to the visualization folder for that same date on the host machine recursively"
    aws s3 cp s3://issacs-gpr-dev/Ammobox/IMU_Data/DataLogs-$argv[1]/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/$argv[1]/  --recursive 
end

function dswdate -d "download the files from some date smallbox gpr bucket to the visualization folder for that same date on the host machine recursively"
    aws s3 cp s3://issacs-gpr-dev/Smallbox/IMU_Data/DataLogs-$argv[1]/ /mnt/c/Users/gabee/Visualization/IMU\ Bin\ Files/$argv[1]/  --recursive 
end
 
function dfile -d "download something to somewhere"
    aws s3 cp $argv[1] $argv[2] 
end

function drec -d "download something to somewhere recursively"
    aws s3 cp $argv[1] $argv[2] --recursive 
end


# Testing
# --------------------------------------------------------------------

# upload the data from July 16th 2019 back to the lambda bucket so that it is processed again
function test16 -d ""
    aws s3 cp s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ s3://issacs-lambda-dev/Ammobox/IMU_Data/DataLogs-20190716/ --recursive 
end




########### FISH ##############

set -g theme_show_exit_status yes
set -g theme_display_date 
set -g theme_display_cmd_duration no
set -g theme_title_use_abbreviated_path yes

set -g theme_color_scheme dark



