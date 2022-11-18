#必要パッケージ確認

# git
dpkg -s git &>/dev/null
if [ $? -eq 0 ]; then
    echo "git exist"
else
    echo "git is not exist, please install git"
    return
fi

dpkg -s unzip &>/dev/null
if [ $? -eq 0 ]; then
    echo "unzip exist"
else
    echo "unzip is not exist, please install unzip"
    return
fi

dpkg -s curl &>/dev/null
if [ $? -eq 0 ]; then
    echo "curl exist"
else
    echo "curl is not exist, please install curl"
    return
fi

#必要ファイルを移動
echo "move service file"
mv /script/minecraft-usk-startup.sh /usr/local/bin/
mv /script/minecraft-usk-server.service /usr/lib/systemd/system

#サーバープログラムをダウンロード
echo "need server program install?"
PS3=">>"
select ans in 'now install' 'not install'; 
do
    if [ "$ans" == "now install" ]; then
        #サーバープログラムを取得
        echo "download bedrock server"
        curl -L -O https://minecraft.azureedge.net/bin-linux/bedrock-server-1.19.41.01.zip

        #サーバープログラムを解凍
        echo "server program unzip"
        unzip bedrock-server-1.19.41.01.zip

        #サーバープログラムを移動
        echo "move program to /opt"
        mv bedrock-server-1.19.41.01 /opt

        #zipファイル削除
        echo "remove zip file"
        rm bedrock-server-1.19.41.01.zip

        break
    elif [ "$ans" == "not install" ]; then
        echo "server setting finish"
        break
    fi
done
