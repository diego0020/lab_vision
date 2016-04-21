# -*- coding: utf-8 -*-
import os
import pandas as pd
import numpy as np

df=pd.read_excel("notas_bsds.xlsx")
#(Pretty name, number_loc, text_loc)
cols=[
(u"Descripción algoritmos de segmentación",3,4),
(u"Descripción protocolo de pruebas",5,6),
(u"Presentación de resultados",7,8),
(u"Discusión",9,10),
(u"Mejoras",11,12),
]

lines=[]
for i in range(0,df.shape[0]):
    l=u"\n%s\n%.2f\n==========================="%(df.iloc[i,1],df.iloc[i,13])
    lines.append(l)
    print(i)
    for n,c,t in cols:
        l=u"<h5>%s (%.2f)</h5>\n<p>%s</p>"%(n,df.iloc[i,c],df.iloc[i,t])
        lines.append(l)
    l="<h5>Comentarios</h5><p>%s</p>"%df.iloc[i,14]
    lines.append(l)

all_lines=u"\n".join(lines)

with open("bsds_notes.txt","w") as f:
    f.write(all_lines)

