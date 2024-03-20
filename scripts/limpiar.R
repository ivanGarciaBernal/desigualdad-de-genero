library(pacman)
p_load(readxl)
p_load(janitor)

icbi = read_excel("datos/ICBI.xlsx")
piza = read_excel("datos/PISA_GIZA.xlsx")
espejos = read_excel("datos/MEC_espejos.xlsx")

#funcion que limpia
limpia = function(data) {
  return(data %>% remove_empty(which = "rows", cutoff = 0.5))
}
#limpiamos cada una de las bases de sus entradas vacías
icbi = icbi %>% limpia
icbi = icbi[, -(1:4)]

piza = piza %>% limpia
piza = piza[-(nrow(piza)), -(1:3)]

espejos = espejos %>% limpia
espejos = espejos[, -(1:3)]

save.image(file = "limpios/datos.RData")
