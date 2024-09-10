function mowers_up {
    gping -i tun0 $(seq -f "GZDEV%g.greenzievpn" 1 38)
}
