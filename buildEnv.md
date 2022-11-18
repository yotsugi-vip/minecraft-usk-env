## Please Install this package
 * git
 * unzip
 * curl

## move service file and script
``` shell
cp ./scripts/minecraft-usk-startup.sh /usr/local/bin/
cp ./scripts/minecraft-usk-server.service /usr/lib/systemd/system
```  

## download server program and unzip, move
```shell
curl -L -O https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.41.01.zip
unzip bedrock-server-1.19.41.01.zip
mv bedrock-server-1.19.41.01 /opt
```