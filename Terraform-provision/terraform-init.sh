#!/bin/bash

url=$(curl https://www.terraform.io/downloads.html 2>&1 | grep -o -E 'href="([^"#]+)"' | cut -d'"' -f2 | grep '.*linux.*amd64.*')
filename=$(echo ${url##*/})
tf_folder='/vagrant/terraform'
proj_folder='/vagrant/tfprojects'
usr_folder='/home/vagrant'

apt install unzip -y
wget $url
unzip $filename

mkdir $tf_folder $proj_folder
mv terraform $tf_folder

# exporting Terraform PATH
cat << EOF >> $usr_folder/.profile
export PATH="$PATH:$tf_folder"
EOF
source $usr_folder/.profile

# exporting Terraform Alias
cat << EOF >> $usr_folder/.bashrc
alias tf='terraform'
EOF
source $usr_folder/.bashrc

# exporting AWS credentials ----> DELETE BEFORE SENDING OR DELETE CODE ASWELL<----
cat << EOF >> $usr_folder/.profile
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
EOF
source $usr_folder/.profile