
awk -F , '{ if ( $2=="ESS") print $1}' customers.csv > esscust.txt         
awk -F , '{ if ( $2=="SVX") print $1}' customers.csv > svxcust.txt
awk -F , '{ if ( $2=="XSE") print $1}' customers.csv > xsecust.txt
 #to sort the data from csv file and get into new txt files


sed 's/Daily Status Report//g' svxcust.txt > removeddailyfinalsvx.txt
sed 's/Daily Status Report//g' xsecust.txt > removeddailyfinalxse.txt
sed 's/Daily Status Report//g' esscust.txt > removeddailyfinaless.txt
#removed the daily ststus report from all the names of coustomers


sed 's/ //g' removeddailyfinalsvx.txt > finalsvx.txt
sed 's/ //g' removeddailyfinalxse.txt > finalxse.txt
sed 's/ //g' removeddailyfinaless.txt > finaless.txt


while ifs= read -r linec
do 
  echo $(mkdir -p ESS/$linec/{Old,New})
  echo $(touch ESS/$linec/README.md)
done <finaless.txt

while ifs= read -r linec
do 
  echo $(mkdir -p SVX/$linec/{Old,New})
  echo $(touch SVX/$linec/README.md)
done <finalsvx.txt

while ifs= read -r linec
do 
  echo $(mkdir -p XSE/$linec/{Old,New})
  echo $(touch XSE/$linec/README.md)
done <finalxse.txt


