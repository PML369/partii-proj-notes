ip:::send {
	printf("%d\n", args[2]->ip_plength);
}
ip:::receive {
	printf("%d\n", args[2]->ip_plength);
}

tcp:::send {
	printf("%d\n", args[2]->ip_plength);
}
tcp:::receive {
	printf("%d\n", args[2]->ip_plength);
}

udp:::send {
	printf("%d\n", args[2]->ip_plength);
}
udp:::receive {
	printf("%d\n", args[2]->ip_plength);
}

