FROM ubuntu:18.04
RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt update && apt install python3 python3-pip -y
RUN pip3 install jupyter && apt install git curl nano time -y
RUN apt install nodejs npm -y && npm install n -g && n stable && apt purge nodejs npm -y && apt autoremove -y
RUN pip3 install online-judge-tools && npm install -g atcoder-cli
RUN acc config default-test-dirname-format test && acc config default-task-choice all
ADD ./templates/ /root/.config/atcoder-cli-nodejs/
RUN acc config default-template py
RUN jupyter notebook --generate-config && echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && echo "c.NotebookApp.password = ''" >> /root/.jupyter/jupyter_notebook_config.py
RUN mkdir -p /atcoder/cpp && mkdir -p /atcoder/py
ADD ./workdir/ /
RUN cat /rc_export >> ~/.bashrc && rm /rc_export
RUN sed -i -e 's/if args.wait\|if not args.yes/if False/g' /usr/local/lib/python3.6/dist-packages/onlinejudge/_implementation/command/submit.py
CMD bash