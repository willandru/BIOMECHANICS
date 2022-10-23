# -*- coding: utf-8 -*-
"""
Created on Mon Oct 17 15:17:20 2022

@author: CLAUDIO SALVADOR
"""

import numpy as np
import pandas as pd
from numpy.random import rand
import matplotlib.pyplot as plt
# matplotlib.use('gtkagg')
import math as m

def rcadotp(x):
    return 80*x/123 + 70
    
def lcadotp(x):
    return 245*x/246 + 20

def rcadn(x):
    return 125*x/123 + 60
    
def lcadn(x):
    return 110*x/123 + 20

# datos control (marcha normal)
df=pd.read_csv("control.csv", sep=',',header=0)
tam=len(df.lkneex.values)
# datos=df.values
lhip=[m.atan2(df.hip1y.values[i]-df.lkneey.values[i],df.hip1z.values[i]-df.lkneez.values[i])*180/m.pi for i in range(tam)] # funciona 
laux=[m.atan2(df.lkneey.values[i]-df.lanky.values[i],df.lkneez.values[i]-df.lankz.values[i])*180/m.pi for i in range(tam)] # funciona 
lknee=[lhip[i]-laux[i] for i in range(tam)] # funciona
rhip=[m.atan2(df.hip2y.values[i]-df.rkneey.values[i],df.hip2z.values[i]-df.rkneez.values[i])*180/m.pi for i in range(tam)] # funciona 
raux=[m.atan2(df.rkneey.values[i]-df.ranky.values[i],df.rkneez.values[i]-df.rankz.values[i])*180/m.pi for i in range(tam)] # funciona 
rknee=[rhip[i]-raux[i] for i in range(tam)] #funciona

# marcha con otp
df1=pd.read_csv("otp.csv", sep=',',header=0)
# tam1=len(df1.lkneex.values)
# desfase en cadera y rodilla izquierda alineando mínimos
dlh=42
lhipotp=[m.atan2(df1.hip1y.values[i]-df1.lkneey.values[i],df1.hip1z.values[i]-df1.lkneez.values[i])*180/m.pi for i in range(dlh,dlh+tam,1)] # funciona 
lauxotp=[m.atan2(df1.lkneey.values[i]-df1.lanky.values[i],df1.lkneez.values[i]-df1.lankz.values[i])*180/m.pi for i in range(dlh,dlh+tam,1)] # funciona 
lkneeotp=[lhipotp[i]-lauxotp[i] for i in range(tam)] # funciona
# desfases en derecho alineando mínimos
drh=50
rhipotp=[m.atan2(df1.hip2y.values[i]-df1.rkneey.values[i],df1.hip2z.values[i]-df1.rkneez.values[i])*180/m.pi for i in range(drh,drh+tam,1)] # funciona 
rauxotp=[m.atan2(df1.rkneey.values[i]-df1.ranky.values[i],df1.rkneez.values[i]-df1.rankz.values[i])*180/m.pi for i in range(drh,drh+tam,1)] # funciona 
rkneeotp=[rhipotp[i]-rauxotp[i] for i in range(tam)] #funciona

# # plots
# figure, ax = plt.subplots(2, 2)
# ax1=plt.subplots();
# # cadera izquierda
# ax1=ax[0,0].twiny()
# ax[0,0].plot(x,lhip,label='Normal')
# ax[0,0].plot(x,lhipotp,label='Con OTP')
# ax[0,0].set_title('Cadera izquierda')
# ax[0,0].legend()
# # cadera derecha
# ax[0,1].plot(x,rhip,label='Normal')
# ax[0,1].plot(x,rhipotp,label='Con OTP')
# ax[0,1].set_title('Cadera derecha')
# ax[0,1].legend()
# # rodilla izquierda
# ax[1,0].plot(x,lknee,label='Normal')
# ax[1,0].plot(x,lkneeotp,label='Con OTP')
# ax[1,0].set_title('Rodilla izquierda')
# ax[1,0].legend()
# # rodilla derecha
# ax[1,1].plot(x,rknee,label='Normal')
# ax[1,1].plot(x,rkneeotp,label='Con OTP')
# ax[1,1].set_title('Rodilla derecha')
# ax[1,1].legend()

xrcadotp = [rcadotp(i) for i in range(len(rhip))]
xlcadotp = [lcadotp(i) for i in range(len(lhip))]
xrcadn = [rcadn(i) for i in range(len(rhip))]
xlcadn = [lcadn(i) for i in range(len(lhip))]


ax0 = plt.subplot(221)
ax00 = ax0.twiny()
ax1 = plt.subplot(222)
ax11 = ax1.twiny()
ax2 = plt.subplot(223)
ax22 = ax2.twiny()
ax3 = plt.subplot(224)
ax33 = ax3.twiny()

# share the secondary axes
ax00.get_shared_y_axes().join(ax00, ax11, ax22, ax33)

ax0.plot(xlcadn,lhip,'g',label='Normal')
ax00.plot(xlcadotp,lhipotp,'b',label='Con OTP')
ax0.set_xlabel('Porcentaje de ciclo de marcha (%)',color='g')
ax00.set_xlabel('Porcentaje de ciclo de marcha (%)',color='b')
ax0.set_ylabel('Ángulo de giro (grados)')
ax0.legend(loc='upper right')
ax00.legend(loc='upper left')
ax0.set_title('Cinemática de cadera izquierda')

ax1.plot(xrcadn,rhip,'g',label='Normal')
ax11.plot(xrcadotp,rhipotp,'b',label='Con OTP')
ax1.set_xlabel('Porcentaje de ciclo de marcha (%)',color='g')
ax11.set_xlabel('Porcentaje de ciclo de marcha (%)',color='b')
ax1.set_ylabel('Ángulo de giro (grados)')
ax1.legend(loc='upper right')
ax11.legend(loc='upper left')
ax1.set_title('Cinemática de cadera derecha')

ax2.plot(xlcadn,lknee,'g',label='Normal')
ax22.plot(xlcadotp,lkneeotp,'b',label='Con OTP')
ax2.set_xlabel('Porcentaje de ciclo de marcha (%)',color='g')
ax22.set_xlabel('Porcentaje de ciclo de marcha (%)',color='b')
ax2.set_ylabel('Ángulo de giro (grados)')
ax2.legend(loc='upper right')
ax22.legend(loc='upper left')
ax2.set_title('Cinemática de rodilla izquierda')

ax3.plot(xrcadn,rknee,'g',label='Normal')
ax33.plot(xrcadotp,rkneeotp,'b',label='Con OTP')
ax3.set_xlabel('Porcentaje de ciclo de marcha (%)',color='g')
ax33.set_xlabel('Porcentaje de ciclo de marcha (%)',color='b')
ax3.set_ylabel('Ángulo de giro (grados)')
ax3.legend(loc='upper right')
ax33.legend(loc='upper left')
ax3.set_title('Cinemática de rodilla derecha')

plt.tight_layout()
plt.show()