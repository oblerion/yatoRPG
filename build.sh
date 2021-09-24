
#! /bin/bash
# importe lua font image file 
if [ -f *.love ];then rm *.love ;fi
cd src
for v in * ; do
	if [ -f $v ] ; then 
		zip -o ../game.zip $v
	fi
	if [ -d $v ] ; then
		echo v dir: $v
		for n in $v/* ; do
			zip -o ../game.zip $n
			if [ -d $n ] ; then
				for j in $n/* ; do
					zip -o ../game.zip $j
				done
			fi
		done
	fi
done
cd ..
mv game.zip game.love
#love ../game.love
