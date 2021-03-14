#libraries
import sys
sys.path = ['', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python27.zip', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-darwin', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/plat-mac/lib-scriptpackages', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-tk', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-old', '/usr/local/Cellar/python@2/2.7.15_1/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload', '/usr/local/lib/python2.7/site-packages']

import matplotlib.pyplot as plt
import squarify # pip install squarify (algorithm for treemap)
print "This is the name of the script: ", sys.argv[0]
print "First arg: ", sys.argv[1]

labelAndSizesString = sys.argv[1].split('_')

labels = labelAndSizesString[0].split(',')
sizes = list(map(int, labelAndSizesString[1].split(',')))

print("labels", labels)
print("sizes", sizes)
# Change color
squarify.plot(sizes=sizes, label=labels, color=["red","green","blue", "grey"], alpha=.4 )
plt.axis('off')
plt.show()
