#! /usr/bin/awk -f
{   
    match($0,"\"ct\":[0-9]+,");

    if(RSTART>0){
        current =  substr($0,RSTART+5,RLENGTH-6) + 0;
    }

    tmplen = length(array);
    needSort = 0;

    if(tmplen<bench){
        array[tmplen] = current;
        needSort = 1;
    }else{
        if(array[tmplen-1]<current){
            tmp = array[tmplen-1];
            array[tmplen-1] = current;
            needSort = 1;
        }
    }

    if(needSort==1){
        flen = length(array);
        flindex = flen -1;

        for(m=flindex;m>=0;m--){
            for(n=m;n>0;n--){
                if(array[n-1]<array[n]){
                    tmp = array[n-1];
                    array[n-1] = array[n];
                    array[n] = tmp;
                }else{
                    break;
                }
            }
        }    
    }
}

BEGIN{
    print "begin:topN:"topN;
    system("date");
    bench = topN;
    tmp = -1;
    array[0] = -1;
    current = 0;
}

END{
    print "end:"FILENAME;
    system("date");
    len = length(array);

    split(FILENAME,fparray,"/");
    length(fparray);
    filename = fparray[length(fparray)];

    mkdir -p outputFolder
    print "output folder of result:"outputFolder

    outputfile = outputFolder"stat.lantency-top"topN"."filename;
    print array[0] > outputfile;
    for(i=1;i<len;i++){
        #if(array[i]>0){
            print array[i]>>outputfile;
        #}
    }
}


