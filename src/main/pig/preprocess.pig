logs = load '$MUSIC_HOME/logs' using PigStorage('\t') as
    (timestamp: int, action: chararray, userid: int,
     artistid: int, trackid: int);


action_logs = filter logs by action == 'FINISH';
action_logs = foreach action_logs generate userid, artistid;
finish = foreach action_logs generate $0..;

store finish into '$MUSIC_HOME/output/finish' using PigStorage('\t');

