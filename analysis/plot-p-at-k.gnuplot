reset
set terminal pdfcairo size 4.0in, 3.00in
set termoption dash
set output "CIFAR10_P@K.pdf"
set style data lines
set key rm 
#set key rm box 0
#set size square
set xrange [100:1000]
set xtics 200
set yrange [0.1:1.0]
#set style line 1 lt 2 lc rgb "red" lw 3
set rmargin 17.5
#set lmargin 5

###### Fields in the data file your_log_name.log.train are
###### Iters Seconds TrainingLoss LearningRate

# Test accuracy vs. training iterations
set title "Image Retrieval Precision of CIFAR-10"
set xlabel "# of Top Images Retrieved "
set ylabel "Precision"
plot 'precision-at-k.txt' using 1:2 title "Ours" lt 1 lc 1 lw 4 ,\
"CNNH+-p-at-k.txt" using 1:2 title "CNNH+" lt 1 lc 2  lw 4 ,\
"CNNH-p-at-k.txt" using 1:2 title "CNNH" lt 1 lc 3  lw 4 ,\
"KSH-p-at-k.txt" using 1:2 title "KSH" lt 1 lc 4  lw 4 ,\
"ITQ-CCA-p-at-k.txt" using 1:2 title "ITQ-CCA" lt 2 lc 5  lw 4 ,\
"MLH-p-at-k.txt" using 1:2 title "MLH" lt 1 lc 6  lw 4 ,\
"BRE-p-at-k.txt" using 1:2 title "BRE" lt 1 lc 7  lw 4 ,\
"ITQ-p-at-k.txt" using 1:2 title "ITQ" lt 3 lc 8  lw 4 ,\
"SH-p-at-k.txt" using 1:2 title "SH" lt 1 lc 9  lw 4 ,\
"LSH-p-at-k.txt" using 1:2 title "LSH" lt 2 lc 1  lw 4 

