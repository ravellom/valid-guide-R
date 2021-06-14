### Capítulo 2. CONFIABILIDAD
### Raidell Avello - Última actualización 14.06.2021
### Colaboradores
#### - Juan Pérez Gómez, Institución, Ciudad, País (Script R, Apartado 2.2)

# Datos de ejemplo http://openpsychometrics.org/_rawdata/IQ1.zip 

iq1 <- read.csv("C:/Users/Admin/Documents/GitHub/valid-guide-R/Ch01/data.csv")

######## 2.1.	CONFIABILIDAD. Equivalencia: Inter-Rater

rater1 = c(1,2,3,4,5,6,7,8,9) # Evaluador 1
rater2 = c(1,3,1,6,1,5,5,6,7) # Evaluador 1
psych::cohen.kappa(x=cbind(rater1,rater2))


psych::alpha(iq1)

######## 2.2.	CONFIABILIDAD. Consistencia Interna





######## 2.3. CONFIABILIDAD. Estabilidad: Test-Retest





