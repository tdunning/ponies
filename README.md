ponies
======

Sample recommender flow for search as recommendation


Download data files

    for i in 0 1 2 3 4 5 6 7 8 9
    do
        wget --no-check-certificate https://s3-us-west-1.amazonaws.com/mlt-lab-data-master/data/log-1M/log-000$i
    done

Download music info files

    wget --no-check-certificate https://s3-us-west-1.amazonaws.com/mlt-lab-data-master/data/music/albums/albums.tsv
    wget --no-check-certificate https://s3-us-west-1.amazonaws.com/mlt-lab-data-master/data/music/artists/artists.tsv
    wget --no-check-certificate https://s3-us-west-1.amazonaws.com/mlt-lab-data-master/data/music/tracks/tracks-2.tsv
    
Preprocess data using Pig

    pig -p MUSIC_HOME=/mapr/my.cluster.com/user/mapr/data/ -f preprocess.pig

Run item similarity from Mahout

    /opt/mapr/mahout/mahout-0.8/bin/mahout itemsimilarity -s SIMILARITY_LOGLIKELIHOOD -b -i /mapr/my.cluster.com/user/mapr/data/output/finish/ -o /mapr/my.cluster.com/user/mapr/data/similarities

