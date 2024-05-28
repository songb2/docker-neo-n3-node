echo "Downloading neo node $1"
wget wget https://github.com/neo-project/neo/releases/download/$1/neo-cli-linux-x64.zip
unzip neo-cli-linux-x64.zip -d .
mv neo-cli-linux-x64 neo-cli


if [ -z "$2" ]; then
    echo "Downloading plugins $1"
    wget https://github.com/neo-project/neo-modules/releases/download/$1/ApplicationLogs.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$1/RpcServer.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$1/TokensTracker.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$1/StateService.zip
else
    echo "Downloading plugins $2"
    wget https://github.com/neo-project/neo-modules/releases/download/$2/ApplicationLogs.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$2/RpcServer.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$2/TokensTracker.zip
    wget https://github.com/neo-project/neo-modules/releases/download/$2/StateService.zip
fi

unzip -n ApplicationLogs.zip -d ./neo-cli/
unzip -n RpcServer.zip -d ./neo-cli/
unzip -n TokensTracker.zip -d ./neo-cli/
unzip -n StateService.zip -d ./neo-cli/

echo "Node Ready!"