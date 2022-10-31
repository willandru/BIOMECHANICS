

#REGRESION PUNTOS OBTENIDOS EN LA PRACTICA DE BIOMECANICA: ESFUERZO VS DEFORMACION
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#CARGAMOS LS DATOS '.csv'
Specimen1 = read.csv('s1.csv')
Specimen2 <- read.csv('s2.csv')
Specimen3 <- read.csv('s3.csv')
Specimen4 = read.csv('s4.csv')
Specimen5 = read.csv('s5.csv')

# REMOVEMOS LOS DATOS ATÍPICOS: GRAFICA 1
#debido a que R es diferente de excel, lo más facil y además en este caso no se afecta la grŕafica 
#al eliminar estos vaores que en el momento d emedición perdieron su '.' decimal.
#LOS DATOS DEBEN TENER PUNTOS'.' no comas ',', ya que el archivo CSV utiliza ',' para separar
#cada campo del dataframe.

Specimen1=Specimen1[Specimen1$carga<10000,]
Specimen1=Specimen1[Specimen1$extension_de_traccion<20,]

Specimen2=Specimen2[Specimen2$carga<10000,]
Specimen2=Specimen2[Specimen2$extension_de_traccion<20,]

Specimen3=Specimen3[Specimen3$carga<10000,]
Specimen3=Specimen3[Specimen3$extension_de_traccion<20,]

Specimen4=Specimen4[Specimen4$carga<10000,]
Specimen4=Specimen4[Specimen4$extension_de_traccion<20,]
Specimen4=tail(Specimen4, -2)

Specimen5=Specimen5[Specimen5$carga<10000,]
Specimen5=Specimen5[Specimen5$extension_de_traccion<20,]


##GRAFICA 1

## GRAFICAMOS: CARGA vs EXTENSION_DE_TRACCIO

#AGREGAMOS LA GRÁFICA O 'FIGURA' PRINCIPAL
plot(Specimen1$extension_de_traccion, Specimen1$carga,  main="Carga vs Extensión de tracción", xlab= "Extensión de Tracción [mm]", ylab= "Carga [N]", type="l", xlim=c(0,20), ylim=c(0,1000))

#AGREGAMOS SUBLINEAS A LA 'FIGURA'
lines(Specimen2$extension_de_traccion, Specimen2$carga, lty="dashed")
lines(Specimen3$extension_de_traccion, Specimen3$carga, lty="dotted") # lty=line type
lines(Specimen4$extension_de_traccion, Specimen4$carga, lty="dotdash")
lines(Specimen5$extension_de_traccion, Specimen5$carga, lty="twodash")

#AGREGAMOS TEXTO ALEATORIO SOBRE UNAS COORDENADAS X,Y
text(x=12, y=400,label="s2")
text(x=13.3, y=410,label="s3")
text(x=19.1, y=400,label="s5")
text(x=14.5, y=400,label="s4")
text(x=15.8, y=600,label="s1")




# GRAFICA 2

#LIMPIAR DATOS ATIPICOS
#debido a que R es diferente de excel, lo más facil y además en este caso no se afecta 
#la grŕafica al eliminar estos vaores que en el momento d emedición perdieron su '.' decimal. 
#LOS DATOS DEBEN TENER PUNTOS'.' no comas ',', ya que el archivo CSV utiliza ',' para separar cada
#campo del dataframe.
Specimen1=Specimen1[Specimen1$esfuerzo_de_traccion<1000,]
Specimen1=Specimen1[Specimen1$desplazamiento_deformacion_uno<5,]

Specimen2=Specimen2[Specimen2$esfuerzo_de_traccion<1000,]
Specimen2=Specimen2[Specimen2$desplazamiento_deformacion_uno<5,]

Specimen3=Specimen3[Specimen3$esfuerzo_de_traccion<1000,]
Specimen3=Specimen3[Specimen3$desplazamiento_deformacion_uno<5,]

Specimen4=Specimen4[Specimen4$esfuerzo_de_traccion<1000,]
Specimen4=Specimen4[Specimen4$desplazamiento_deformacion_uno<5,]

Specimen5=Specimen5[Specimen5$esfuerzo_de_traccion<800,]
Specimen5=Specimen5[Specimen5$desplazamiento_deformacion_uno<5,]


## GRAFICAMOS: Esfuerzo traccion vs Desplazamiento deformacion
#AGREGAMOS LA GRÁFICA O 'FIGURA' PRINCIPAL
plot(Specimen1$desplazamiento_deformacion_uno, Specimen1$esfuerzo_de_traccion,  main="Esfuerzo traccion vs Desplazamiento deformacion", xlab= " Desplazamiento Deformación 1 [mm]", ylab= "Esfuerzo de tracción [MPa]", type="l", ylim=c(0,25))

#AGREGAMOS SUBLINEAS A LA 'FIGURA'
lines(Specimen2$desplazamiento_deformacion_uno, Specimen2$esfuerzo_de_traccion, lty="dashed")
lines(Specimen3$desplazamiento_deformacion_uno, Specimen3$esfuerzo_de_traccion, lty="dotted") # lty=line type
lines(Specimen4$desplazamiento_deformacion_uno, Specimen4$esfuerzo_de_traccion, lty="dotdash")
lines(Specimen5$desplazamiento_deformacion_uno, Specimen5$esfuerzo_de_traccion, lty="twodash")

#AGREGAMOS TEXTO ALEATORIO SOBRE UNAS COORDENADAS X,Y
text(x=2, y=15,label="s2")
text(x=3.24, y=12,label="s3")
text(x=3.85, y=13,label="s4")
text(x=4.9, y=20.1,label="s5")
text(x=4.7, y=14,label="s1")

#AGREGAMOS LINEAS VERTICALES PARA SEÑALAR LA REGION ELASTICA
n1=length(Specimen1$desplazamiento_deformacion_uno)
low_band=n1*0.05
high_band=n1*0.25

abline(v=Specimen1$desplazamiento_deformacion_uno[low_band], col="blue")
abline(v=Specimen1$desplazamiento_deformacion_uno[high_band], col="blue")
abline(v=Specimen2$desplazamiento_deformacion_uno[low_band], col="red")
abline(v=Specimen2$desplazamiento_deformacion_uno[high_band], col="red")
abline(v=Specimen2$desplazamiento_deformacion_uno[low_band], col="red")
abline(v=Specimen2$desplazamiento_deformacion_uno[high_band], col="red")
abline(v=Specimen2$desplazamiento_deformacion_uno[low_band], col="yellow")
abline(v=Specimen2$desplazamiento_deformacion_uno[high_band], col="yellow")
abline(v=Specimen2$desplazamiento_deformacion_uno[low_band], col="green")
abline(v=Specimen2$desplazamiento_deformacion_uno[high_band], col="green")



# REGRESION LINEAL: DETERMINAR EL MODULO DE YOUN DE LA ZONA ELASTICA

#El modulo de Young se extrae de la gráfica de Esfuerzo vs Deformación


#EXTRAEMOS LAS COLUMNAS Y FILAS QUE UTILIZAREMOS PARA HACER LA REGRESIÓN: Recortamos filas porque solo queremos la region elastica, recortamos columnas porque queremos ajustar la recta con un porcentaje especifico de los Datos según la norma ISO 527

deformacion_specimen1=Specimen1$desplazamiento_deformacion_uno
n1=length(Specimen1$desplazamiento_deformacion_uno)
low_band=n1*0.05
high_band=n1*0.25
deformacion_specimen1=deformacion_specimen1[low_band:high_band]

esfuerzo_specimen1=Specimen1$esfuerzo_de_traccion
esfuerzo_specimen1=esfuerzo_specimen1[low_band:high_band]

deformacion_specimen2=Specimen2$desplazamiento_deformacion_uno
deformacion_specimen2=deformacion_specimen2[low_band:high_band]
esfuerzo_specimen2=Specimen2$esfuerzo_de_traccion
esfuerzo_specimen2=esfuerzo_specimen2[low_band:high_band]

deformacion_specimen3=Specimen3$desplazamiento_deformacion_uno
deformacion_specimen3=deformacion_specimen3[low_band:high_band]
esfuerzo_specimen3=Specimen3$esfuerzo_de_traccion
esfuerzo_specimen3=esfuerzo_specimen3[low_band:high_band]

deformacion_specimen4=Specimen4$desplazamiento_deformacion_uno
deformacion_specimen4=deformacion_specimen4[low_band:high_band]
esfuerzo_specimen4=Specimen4$esfuerzo_de_traccion
esfuerzo_specimen4=esfuerzo_specimen4[low_band:high_band]

deformacion_specimen5=Specimen5$desplazamiento_deformacion_uno
deformacion_specimen5=deformacion_specimen5[low_band:high_band]
esfuerzo_specimen5=Specimen5$esfuerzo_de_traccion
esfuerzo_specimen5=esfuerzo_specimen5[low_band:high_band]

par(mfrow = c(2,3))
plot( deformacion_specimen1,  esfuerzo_specimen1)
plot( deformacion_specimen2,  esfuerzo_specimen2)
plot( deformacion_specimen3,  esfuerzo_specimen3)
plot( deformacion_specimen4,  esfuerzo_specimen4)
plot( deformacion_specimen5,  esfuerzo_specimen5)

#REGERSIÓN LINEAL

regresion1= lm(esfuerzo_specimen1 ~ deformacion_specimen1)
regresion2= lm(esfuerzo_specimen2 ~ deformacion_specimen2)
regresion3= lm(esfuerzo_specimen3 ~ deformacion_specimen3)
regresion4= lm(esfuerzo_specimen4 ~ deformacion_specimen4)
regresion5= lm(esfuerzo_specimen5 ~ deformacion_specimen5)


### RESULTADOS

young1=regresion1$coefficients[2]
young2=regresion2$coefficients[2]
young3=regresion3$coefficients[2]
young4=regresion4$coefficients[2]
young5=regresion5$coefficients[2]

intervalo1=paste('[',as.character(as.numeric(format(confint(regresion1)[2,][1], nsmall=4))),' , ', as.character(as.numeric(format(confint(regresion1)[2,][2],nsmall=4))), ']', sep="")
intervalo2=paste('[',as.character(as.numeric(format(confint(regresion2)[2,][1], nsmall=4))),' , ', as.character(as.numeric(format(confint(regresion2)[2,][2],nsmall=4))), ']', sep="")
intervalo3=paste('[',as.character(as.numeric(format(confint(regresion3)[2,][1], nsmall=4))),' , ', as.character(as.numeric(format(confint(regresion3)[2,][2],nsmall=4))), ']', sep="")
intervalo4=paste('[',as.character(as.numeric(format(confint(regresion4)[2,][1], nsmall=4))),' , ', as.character(as.numeric(format(confint(regresion4)[2,][2],nsmall=4))), ']', sep="")
intervalo5=paste('[',as.character(as.numeric(format(confint(regresion5)[2,][1], nsmall=4))),' , ', as.character(as.numeric(format(confint(regresion5)[2,][2],nsmall=4))), ']', sep="")


beginning_mods_results = data.frame(
  "Modulo_de_Young_[MPa.mm]" =
    c("Specimen1" = young1,
      "Specimen2" = young2,
      "Specimen3" = young3,
      "Specimen4" = young4,
      "Specimen5" = young5
      
    ),
  
  "Intervalo_95_confinza" =
    c("Specimen1" = intervalo1,
      "Specimen2" = intervalo2,
      "Specimen3" = intervalo3,
      "Specimen4" = intervalo4,
      "Specimen5" = intervalo5
    )
)

t(beginning_mods_results)

#Para utilizar kable
library(knitr)
kable(beginning_mods_results, align = c("c", "r"))




