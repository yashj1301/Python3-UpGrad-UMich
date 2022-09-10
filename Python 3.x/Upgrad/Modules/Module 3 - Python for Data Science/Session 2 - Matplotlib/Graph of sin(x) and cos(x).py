import numpy as np
import matplotlib.pyplot as plot


x=np.arange(0,2*np.pi+0.01,np.pi/6)
x_label=np.array(['0','30','60','90','120','150','180','210','240',
                  '270','300','330','360'])

plot.plot(x_label,np.sin(x),np.cos(x),marker='.',lw=1.3)
plot.title('\nGraph of sin(x) and cos(x) from 0 to 2\u03C0\n(Intervals of \u03C0/6)\n')
plot.xlabel('x in degrees')
plot.ylabel('sin(x) and cos(x) value')
plot.grid(axis='y')
plot.legend(['sin(x)','cos(x)'],loc=[0.07,0.1])
plot.show()
