#!/usr/bin/python
# coding: UTF-8
import csv   #csvモジュールをインポートする

f = open('setting_africa.txtXDQGQGFSGE2015-06-08-21.txt', 'rb')

dataReader = csv.reader(f)

totalIllNumber = 0

for row in dataReader:
    totalIllNumber = int(row[0]) + 1

print "total number is:" + char(totalIllNumber)


