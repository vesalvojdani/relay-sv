# RELAY SV-COMP

![Build workflow](https://github.com/vesalvojdani/relay-sv/actions/workflows/build.yml/badge.svg)

This "simply" automates the building and running of RELAY on a single program. For more information, see the original readme: [README.orig](README.orig) or the paper on RELAY: 

> Jan Wen Voung, Ranjit Jhala, and Sorin Lerner. [RELAY: static race detection on millions of lines of code](https://dl.acm.org/doi/10.1145/1287624.1287654). In ESEC-FSE 2007. ACM, 205–214. 

The RELAY analyzer implements summary-based analysis using multiple workers communicating with a server.
It is more suited for analysis of larger programs than small intricate examples. 

* This is based on: https://cseweb.ucsd.edu/~jvoung/code/relay-radar.0.10.03.tar.gz
* Changes for RELAY-SV: https://github.com/vesalvojdani/relay-sv/commits/main

## Bulding

The following works on the CI (Ubuntu 22.04):

```bash
sudo apt install -y opam gcc autoconf automake make gperf python3 indent flex libfl-dev bison
opam switch create . 3.11.2
./scripts/build.sh
```

## Running

Then run it with `./run_relay.sh tests/01-simple_rc.c`
