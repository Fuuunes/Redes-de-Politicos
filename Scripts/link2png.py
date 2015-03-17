# -*- coding: utf-8 -*-
import unicodecsv as csv
import dryscrape
import re

with open('lista-de-links.csv','rb') as tsvin:
    tsvin = csv.reader(tsvin, delimiter='\t')
    for row in tsvin:
        name = row[0].strip()
        print name
        sess = dryscrape.Session(base_url = name)
        sess.visit('')
        
        m = name.split("/")
        namesplit = m[-1]
        namesplit = namesplit.replace(".","")
        
        filename = "ss/" + namesplit + ".png"
        
        sess.render(filename)
        sess.reset()