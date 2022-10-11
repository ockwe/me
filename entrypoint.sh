#!/bin/sh

# config xray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "port": $PORT,
      "protocol": "vmess",
      "settings": {
        "decryption": "none",
        "clients": [
          {
            "id": "273413b1-5890-43f9-bc41-57fde504555c"
          }
        ]
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}	
EOF

# run xray
/usr/bin/xray run -config /etc/config.json
