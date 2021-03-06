mkfifo /tmp/in1a /tmp/out1a
mkfifo /tmp/in1b /tmp/out1b
mkfifo /tmp/in2a /tmp/out2a
mkfifo /tmp/in2b /tmp/out2b
mkfifo /tmp/in3a /tmp/out3a
mkfifo /tmp/in3b /tmp/out3b

./bas.tk --auto --ident=node1 --whatwho --begin=HLG --dest=HLG < /tmp/in1a > /tmp/out1a &
./hlg.tk --auto --ident=node1 --whatwho --begin=BAS < /tmp/in1b > /tmp/out1b &

./bas.tk --auto --ident=node2 --whatwho --begin=HLG --dest=HLG < /tmp/in2a > /tmp/out2a &
./hlg.tk --auto --ident=node2 --whatwho --begin=BAS < /tmp/in2b > /tmp/out2b &

./bas.tk --auto --ident=node3 --whatwho --begin=HLG --dest=HLG < /tmp/in3a > /tmp/out3a &
./hlg.tk --auto --ident=node3 --whatwho --begin=BAS < /tmp/in3b > /tmp/out3b &

cat /tmp/out1a > /tmp/in1b &
cat /tmp/out1b | tee /tmp/in1a > /tmp/in2b &
cat /tmp/out2a > /tmp/in2b &
cat /tmp/out2b | tee /tmp/in2a > /tmp/in3b &
cat /tmp/out3a > /tmp/in3b &
cat /tmp/out3b | tee /tmp/in3a > /tmp/in1b &
