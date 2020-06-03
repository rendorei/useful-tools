#------------Chocolatey provision script--------------------------------------
#------------RUN POWERSHELL AS ADMINISTRATOR-----------------------------------
#------------RUN "Set-ExecutionPolicy Remotesigned" FIRST----------------------

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

####### LENOVO ONLY
# choco install lenovo-thinkvantage-system-update -fy

####### Browsers
choco install googlechrome -fy
choco install firefox -fy

####### IDEs
# choco install visualstudio2019community -fy
# choco install visualstudio2019professional -fy
# choco install sublimetext3 -fy
choco install vscode -fy
choco install notepadplusplus -fy
# choco install atom --pre  -fy
choco install jetbrainstoolbox -fy #or one of below
# choco install goland --version=2019.3.1 -fy
# choco install intellijidea-community -fy
# choco install intellijidea-ultimate -fy
# choco install pycharm -fy

####### Languages
choco install groovy -fy
# choco install python -fy
# choco install jre8 -fy
# choco install golang -fy

####### CLI Tools
choco install git -fy
choco install putty -fy
choco install wsl -fy
choco install wsl-ubuntu-1804 -fy
choco install kubernetes-cli -fy
choco install openshift-cli -fy
# choco install awscli -fy
# choco install awstools.powershell -fy
# choco install azure-cli -fy
# choco install terraform -fy
# choco install kubernetes-helm -fy

####### Other programs
choco install ccleaner -fy
choco install deluge -fy
# choco install dropbox -fy
# choco install virtualbox -fy
# choco install minikube -fy
# choco install vagrant -fy
choco install totalcommander -fy
# choco install 7zip.install -fy
# choco install postman -fy
# choco install dbeaver -fy
# choco install cpu-z -fy
# choco install geforce-experience -fy

####### Social
choco install skype -fy
choco install telegram -fy
choco install microsoft-teams -fy
# choco install viber -fy
# choco install slack -fy
# choco install zoom -fy
# choco install discord -fy
# choco install teamspeak -fy

####### Media (mgames/books/video)
choco install adobereader -fy
choco install paint.net -fy
# choco install steam -fy
# choco install origin -fy
# choco install epicgameslauncher -fy
# choco install vlc -fy
# choco install mpc-hc -fy
# choco install spotify -fy
# choco install calibre -fy
# choco install twitch -fy
# choco install battle.net -fy


