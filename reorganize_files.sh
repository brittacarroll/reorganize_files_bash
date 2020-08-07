current_dir=$(PWD)
sub_dirs=$(find . -type d -name "*RADIEMS*")

i=0
until [ $i -gt 34 ]
do
    echo i: $i
    ((i=i+1))
    if [i -lt "10"]
    then
        $(mkdir -p "000${i}/S0002")
    else
        $(mkdir -p "00${i}/S0002")
    fi
done


for dir in $sub_dirs
do
    ms_dirs=$(find $dir/* -type d -name '*MS*')
    for f in $ms_dirs
    do
        basename=${f##*_}
        matching_dirs=$(find $current_dir -name $basename)
        $(cp $f/* $matching_dirs/S0002)
    done
done

dirs=$(find . -d -name "S0002")
for folder in $dirs
do
    $(mkdir "$folder/DTI")
    $(mkdir "$folder/DTI_LR")
    $(mkdir "$folder/DTI_RL")
    $(mkdir "$folder/Map_BO")
    $(mkdir "$folder/Resting_BOLD")
    $(mkdir "$folder/T1")
    $(mkdir "$folder/T2")
    $(mkdir "$folder/T2_FLAIR")
    DTI_LR_files=$(find $folder -type f -name "*DTI_LR*")
    echo $DTI_LR_files | xargs mv -t "$folder/DTI_LR"

    for file in $DTI_LR_files
    do
        $(mv $file $folder/DTI_LR)
    done


    DTI_RL=$(find $folder -type f -name "*DTI_RL*")
    for file in $DTI_RL
    do
        $(mv $file $folder/DTI_RL)
    done

    T1_file=$(find $folder -type f -name "*T1*")
    T2_file=$(find $folder -type f -name "*T2*")
    T2_FLAIR_file=$(find $folder -type f -name "*FLAIR*")
    BOLD_file=$(find $folder -type f -name "*BOLD*")

    while IFS= read -r -d '' file; do
      echo $T2_FLAIR_file
      $(mv "$T2_FLAIR_file" $folder/T2_FLAIR)    
      done


    for file in $T1_file
    do
        $(mv $file $folder/T1)
    done

    for file in $T2_file
    do
        $(mv $file $folder/T2)
    done

    for file in "$T2_FLAIR_file"
    do
        $(mv "$file" $folder/T2_FLAIR)
    done

    for file in "$BOLD_file"
    do
        $(mv "$file" $folder/Resting_BOLD)
    done

    for file in $Resting_BOLD
    do
        $(mv $file $folder/Resting_BOLD)
    done
done






