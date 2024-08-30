#!/bash/sh
##################
# NRK 8/8/2024   #
##################

for file in $(ls -ltr *.csv | awk '{print $9}')
#for file in $(ls -ltr test01.csv | awk '{print $9}')
do
echo " $file  ################## " 


for trial in 1 2 3 4 5
do 

#echo $trial 
	# SEPERATING TO TRIALS
cat $file | awk -v var=$trail '{split($1,a,","); if(a[1]=="1"){print $0 } }' > $file\_trial_1.dat
cat $file | awk -v var=$trail '{split($1,a,","); if(a[1]=="2"){print $0 } }' > $file\_trial_2.dat
cat $file | awk -v var=$trail '{split($1,a,","); if(a[1]=="3"){print $0 } }' > $file\_trial_3.dat
cat $file | awk -v var=$trail '{split($1,a,","); if(a[1]=="4"){print $0 } }' > $file\_trial_4.dat
cat $file | awk -v var=$trail '{split($1,a,","); if(a[1]=="5"){print $0 } }' > $file\_trial_5.dat

	# GET AVERAGE OF INTENSITY COLUM 202 TO 402 ##
cat $file\_trial_1.dat | awk -F, '{OFS=" "; $1=$1; print}' | awk '{ sum=0; count=0; for(i=202; i<=402; i++) {sum += $i; count++} if(count>0) {print sum/count}}' > $file\_int_Avg_1.dat 
cat $file\_trial_2.dat | awk -F, '{OFS=" "; $1=$1; print}' | awk '{ sum=0; count=0; for(i=202; i<=402; i++) {sum += $i; count++} if(count>0) {print sum/count}}' > $file\_int_Avg_2.dat 
cat $file\_trial_3.dat | awk -F, '{OFS=" "; $1=$1; print}' | awk '{ sum=0; count=0; for(i=202; i<=402; i++) {sum += $i; count++} if(count>0) {print sum/count}}' > $file\_int_Avg_3.dat 
cat $file\_trial_4.dat | awk -F, '{OFS=" "; $1=$1; print}' | awk '{ sum=0; count=0; for(i=202; i<=402; i++) {sum += $i; count++} if(count>0) {print sum/count}}' > $file\_int_Avg_4.dat 
cat $file\_trial_5.dat | awk -F, '{OFS=" "; $1=$1; print}' | awk '{ sum=0; count=0; for(i=202; i<=402; i++) {sum += $i; count++} if(count>0) {print sum/count}}' > $file\_int_Avg_5.dat 
	
	# PASTING FRQ VS 202-402 INTENSITYU AVERAGES
paste $file\_int_Avg_1.dat $file\_int_Avg_2.dat $file\_int_Avg_3.dat $file\_int_Avg_4.dat $file\_int_Avg_5.dat > $file\_paste_int_Avg_1-5.dat

	# GRAND AVARAGE OF T1 T2 T3 T4 T5 INTENSITY ####
cat $file\_paste_int_Avg_1-5.dat | awk '{sum=0; count=0; for(i=1; i<=5; i++) {sum += $i; count++} if(count>0) {print sum/count}}' >  $file\_final_FQ_vs_T1-T5_avg_intensity.dat 


done 

done 

cat test01.csv | awk -v var=$trail '{split($1,a,","); if(a[1]=="1"){print a[2] } }' > frequencies.dat

paste frequencies.dat test0.csv_final_FQ_vs_T1-T5_avg_intensity.dat  test01.csv_final_FQ_vs_T1-T5_avg_intensity.dat test02.csv_final_FQ_vs_T1-T5_avg_intensity.dat test03.csv_final_FQ_vs_T1-T5_avg_intensity.dat test04.csv_final_FQ_vs_T1-T5_avg_intensity.dat test05.csv_final_FQ_vs_T1-T5_avg_intensity.dat test06.csv_final_FQ_vs_T1-T5_avg_intensity.dat test07.csv_final_FQ_vs_T1-T5_avg_intensity.dat > ALL_FILES.dat

head ALL_FILES.dat


echo "DONE ########## "







