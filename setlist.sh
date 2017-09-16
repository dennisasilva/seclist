#!/bin/sh

# Author: Dennis Silva
# Email: dennisasilva@gmail.com
# Date: 2017-09-15
# Description: You can use this shellscript to download the all content into full-disclosure list on seclist.org

#Variables to store the years and the months
# year = 2015, 2016, 2017 and so on

#message
echo "\nScript para fazer o download das informações da lista full-disclosure no seclist.ogr"

#message year
echo "\n\nPor favor insira o ano [YYYY]:"
echo "[2003] - [2004] - [2005] - [2006] - [2007] - [2008] - [2009] -[2010] - [2011] - [2012] - [2013] - [2014] - [2015] - [2016] - [2017]"

#variable year
read year

#message and month
echo "\nPor favor insira o mês [MM]:"
echo "[01 - JAN] - "
echo "[02 - FEV]"
echo "[03 - MAR]"
echo "[04 - ABR]"
echo "[05 - MAI]"
echo "[06 - JUN"
echo "[07 - JUL]"
echo "[08 - AGO]"
echo "[09 - SET]"
echo "[10 - OUT]"
echo "[11 - NOV]"
echo "[12 - DEZ]"

#variable month
read month

echo "Agora iremos coletar as informações solicitadas referente ao ano $year e mês $month..."

#case to select the month
case $month in

01) month="Jan";;
02) month="Fev";;
03) month="Mar";;
04) month="Apr";;
05) month="May";;
06) month="Jun";;
07) month="Jul";;
08) month="Aug";;
09) month="Sep";;
10) month="Oct";;
11) month="Nov";;
12) month="Dec";;

esac

#download wegpage
wget seclist.org/fulldisclosure/$year/$month/index.html --output-document=/tmp/seclist-$month-$year-draft.txt

#OkDok
cat /tmp/seclist-$month-$year-draft.txt | egrep '<a name=' | awk -F ">" '{print $3}' | awk -F "<" '{print $1}' > /tmp/seclist-$month-$year.txt
