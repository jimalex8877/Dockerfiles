#!/usr/bin/env bash
docker exec -it mongodb-27017 mongo --port 27017
#rs.initiate({_id:"changming", members:[{_id:0,host:"10.2.236.234:27017"},{_id:1,host:"10.2.236.234:27018"},{_id:2,host:"10.2.236.234:27019",arbiterOnly:true}]})
#rs.reconfig({_id:"changming", members:[{_id:0,host:"10.2.236.234:27017"},{_id:1,host:"10.2.236.234:27018"},{_id:2,host:"10.2.236.234:27019",arbiterOnly:true}]},{force:true})

#rs.initiate({_id:"changming", members:[{_id:0,host:"192.168.1.103:27017"},{_id:1,host:"192.168.1.103:27018"},{_id:2,host:"192.168.1.103:27019",arbiterOnly:true}]})
#rs.reconfig({_id:"changming", members:[{_id:0,host:"192.168.1.103:27017"},{_id:1,host:"192.168.1.103:27018"},{_id:2,host:"192.168.1.103:27019",arbiterOnly:true}]},{force:true})
