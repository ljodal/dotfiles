#!/bin/sh

# 1) Fetch the pf reference token that was generated on
#    Wireguard startup with postup.sh
TOKEN=`cat /usr/local/var/run/wireguard/pf_wireguard_token.txt`

# 2) Remove the reference (and by extension, the pf rule that
#    generated it). Adding and removing rules by references
#    like this will automatically disable the packet filter
#    firewall if there are no other references left, but will
#    leave it up and intact if there are.
pfctl -X ${TOKEN} || exit 1
rm -f /usr/local/var/run/wireguard/pf_wireguard_token.txt
