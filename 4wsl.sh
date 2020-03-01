sudo sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
sudo apt update
sudo apt install python3 python3-pip -y
pip3 install jupyter
sudo apt install git curl nano time -y
sudo apt install nodejs npm -y
sudo npm install n -g
n stable
sudo apt purge nodejs npm -y
sudo apt autoremove -y
pip3 install online-judge-tools
npm install -g atcoder-cli
acc config default-test-dirname-format test
acc config default-task-choice all
#ADD ./templates/ /root/.config/atcoder-cli-nodejs/
acc config default-template py
jupyter notebook --generate-config && echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py
mkdir -p /atcoder/cpp
mkdir -p /atcoder/py
#ADD ./workdir/ /
cat /rc_export >> ~/.bashrc && rm /rc_export
sed -i -e 's/if args.wait\|if not args.yes/if False/g' /usr/local/lib/python3.6/dist-packages/onlinejudge/_implementation/command/submit.py