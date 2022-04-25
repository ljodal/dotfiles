#!/bin/sh

# 1) Preparing the directory which we'll persist the pf token
#    generated by (2) in. That token can then be used by our
#    postdown.sh script to remove the routing rule in the
#    event Wireguard is shut down on the server.
mkdir -p /usr/local/var/run/wireguard
chmod 700 /usr/local/var/run/wireguard

# 2) Dynamically add the NAT rule, enable the firewall, increase
#    its reference count (-E) and persist the reference token
#    generated by the command into pf_wireguard_token.txt,
#    which postdown.sh will reference when Wireguard is shut
#    down.
echo 'nat on en0 from 10.0.10.0/24 to any -> (en0)' | \
    pfctl -a com.apple/wireguard -Ef - 2>&1 | \
    grep 'Token' | \
    sed 's%Token : \(.*\)%\1%' > /usr/local/var/run/wireguard/pf_wireguard_token.txt   
