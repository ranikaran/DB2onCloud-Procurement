# Code Source
https://github.com/ranikaran/DB2onCloud-Procurement

#DB2onCloud-Procurement
Server testing to run pre-bootstrapping

##Summary
This repo contains bash scripts to test that a server meets minimum requirements for the DB2onCloud service to be installed. This is intended to be used by DB2onCloud dev ops team  internally .

##Usage

To test a node, execute the appropriate script by following the below steps:
- Download the entire script folder as zip and execute it locally
- ssh to the procured server
- cd /tmp
- wget https://github.com/ranikaran/DB2onCloud-Procurement/archive/master.zip
- unzip master.zip
- cd DB2onCloud-Procurement-master
- To execute the scripts for baremetal machine , cd DB2onCloudBM
  To execute the scripts for CCI, cd DB2onCloudCCI
- Then run the scripts with appropriate plan name 
    bash DB2onCloud_XL.bash  

##Writing Tests

    All tests should be written in bash and put in the tests directory.
    Try not to make assumptions about the system the test will be run on and be flexible in its writing.
    Create a function called preflight_test which will be called to run your test_

###Example
```shell
preflight_test () {
    # write test code here
}
```
