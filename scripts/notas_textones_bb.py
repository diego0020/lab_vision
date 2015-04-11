# -*- coding: utf-8 -*-
import os
import pandas as pd
import numpy as np

os.chdir(r'C:\Users\da.angulo39\Documents\lab_vision')
df=pd.read_excel("notas_textones2.xlsx")
#(Pretty name, number_loc, text_loc)
cols=[
(u"Descripción base de datos",2,1),
(u"Creación diccionario",4,3),
(u"Clasificadores",6,5),
(u"Presentación resultados",8,7),
(u"Discusión",10,9),
]

lines=[]
for i in xrange(1,df.shape[0]):
    l=u"\n%s\n%.2f\n==========================="%(df.iloc[i,0],df.iloc[i,14])
    lines.append(l)
    print i
    for n,c,t in cols:
        l=u"<h5>%s (%.2f)</h5>\n<p>%s</p>"%(n,df.iloc[i,c],df.iloc[i,t])
        lines.append(l)
    l="<h5>Comentarios</h5><p>%s</p>"%df.iloc[i,13]
    lines.append(l)
    r=df.iloc[i,12]
    if np.isnan(r):
        r=0
    else:
        r=int(r)
    l=u"<p>Fecha de entrega: %s, (%d) días tarde</p>"%(df.iloc[i,11],r)
    lines.append(l)

all_lines=u"\n".join(lines)

with open("texton_notes.txt","w") as f:
    f.write(all_lines.encode("utf8"))

