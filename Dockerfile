FROM ubuntu:18.04
RUN apt update && apt install python3 python3-pip -y
RUN pip3 install jupyter && apt install git curl -y
RUN apt install nodejs npm -y && npm install n -g && n stable && apt purge nodejs npm -y && apt autoremove -y
RUN pip3 install online-judge-tools && npm install -g atcoder-cli
RUN acc config default-test-dirname-format test && acc config default-task-choice all
ADD ./templates/ /root/.config/atcoder-cli-nodejs/
RUN acc config default-template py
CMD bash