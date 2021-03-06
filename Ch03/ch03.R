### Cap�tulo 3. VALIDEZ
### Raidell Avello - �ltima actualizaci�n 14.06.2021
### Colaboradores
#### - Juan P�rez G�mez, Instituci�n, Ciudad, Pa�s (Script R, Apartado 3.2)


############ 3.1. VALIDEZ DE CONTENIDO



############ 3.2. VALIDEZ DE CONSTRUCTO

library(semTools)
reliability(modelo)

ave_cr_reliab_table <- function(model_fit){ 
  relia <- as.data.frame(reliability(model_fit)) 
  cov_lv <- as.data.frame(lavInspect(model_fit,"cor.lv"))   
  diag(cov_lv) <- sqrt(relia[5,])
  cov_lv[upper.tri(cov_lv)] <- "" 
  relia_t <- t(relia) 
  ALPHA <- relia_t[,1]
  CR <- relia_t[,2]
  AVE <- relia_t[,5]
  fulltable <- cbind(ALPHA, CR, AVE, cov_lv)   
  fulltable
}

ave_cr_reliab_table(model.EST)


#Para comparar si fueran solo dos tests:

apa::cor_apa(cor.test(iq1$Q12, iq1$Q13))

#Para construir una tabla con m�ltiples correlaciones:


Hmisc::rcorr(as.matrix(iq1[,10:14]))
correlation_matrix(iq1[,10:14], digits = 3, 
                   use = "upper", replace_diagonal = TRUE)
save_correlation_matrix(df = iq1[,10:14], filename = "test.csv", 
                        digits = 3, use = "upper")



############ 3.3. VALIDEZ DE CRITERIO


  