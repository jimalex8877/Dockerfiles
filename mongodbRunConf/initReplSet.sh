#!/usr/bin/env bash
docker exec -it mongodb-27017 mongo --port 27017
#rs.initiate({_id:"changming", members:[{_id:0,host:"10.2.236.140:27017"},{_id:1,host:"10.2.236.140:37017"},{_id:2,host:"10.2.236.140:47017",arbiterOnly:true}]})
#rs.reconfig({_id:"changming", members:[{_id:0,host:"10.2.236.140:27017"},{_id:1,host:"10.2.236.140:37017"},{_id:2,host:"10.2.236.140:47017",arbiterOnly:true}]},{force:true})

#rs.initiate({_id:"changming", members:[{_id:0,host:"192.168.1.103:27017"},{_id:1,host:"192.168.1.103:37017"},{_id:2,host:"192.168.1.103:47017",arbiterOnly:true}]})
#rs.reconfig({_id:"changming", members:[{_id:0,host:"192.168.1.103:27017"},{_id:1,host:"192.168.1.103:37017"},{_id:2,host:"192.168.1.103:47017",arbiterOnly:true}]},{force:true})
