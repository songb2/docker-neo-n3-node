FROM ubuntu:22.04 as Build
RUN apt-get update
RUN apt-get -y install net-tools telnet bash-completion wget  lrzsz zip
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb && apt-get install -y apt-transport-https && apt-get update && apt update && apt install build-essential unzip -y
RUN apt-get install -y dotnet-sdk-8.0 sqlite3 libsqlite3-dev libunwind8-dev
RUN apt-get install -y screen

WORKDIR /neo
COPY prepare-node.sh .
RUN chmod +x prepare-node.sh
RUN ./prepare-node.sh v3.7.4

# WORKDIR /neo-cli
COPY start.sh .
RUN chmod +x start.sh
# RUN ls -a
# RUN pwd
RUN apt-get update && apt-get install -y vim
RUN sed -i 's/"BindAddress":[^,]*/"BindAddress": "0.0.0.0"/' neo-cli/Plugins/RpcServer/config.json
# CMD ["sh","start.sh"]
ENTRYPOINT ["screen","-DmS","3.7.4","dotnet","neo-cli/neo-cli.dll"]