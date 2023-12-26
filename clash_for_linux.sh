# author: linshukai
# date: 2023-12-26
# description: Set Clash Config For Linux

if [ "$#" -eq 0 ]; then
	echo "arg1 must <set> or <unset>"
	exist 1
fi

firstArg=$1

if [ "$firstArg" = "set" ]; then

	host_ip=$(cat /etc/resolv.conf | grep nameserver | cut -f 2 -d " ")
	export ALL_PROXY="http://$host_ip:7890"
	export https_proxy="http://$host_ip:7890"
	export http_proxy="http://$host_ip:7890"
	echo "ALL_PROXY:$ALL_PROXY,http_proxy:$http_proxy,https_proxy:$https_proxy"
	echo "set successfully."

elif [ "$firstArg" = "unset" ]; then
	unset ALL_PROXY
	unset http_proxy
	unset https_proxy
	echo "ALL_PROXY:$ALL_PROXY,http_proxy:$http_proxy,https_proxy:$https_proxy"
	echo "unset successfully"

else
	echo "Error Argument."

fi
