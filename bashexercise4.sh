#!/bin/bash
mysql --local-infile --user=root --password=?@~JDCNVOe7T%i9VzRHU  <<STOP
drop database if exists testphp;
create database if not exists testphp;
use testphp;
CREATE TABLE NOAA (
        ICAO VARCHAR(4) NOT NULL PRIMARY KEY,
        time VARCHAR(50) NULL DEFAULT '',
        report VARCHAR(50) NULL DEFAULT ''
    );

GRANT SELECT ON NOAADB.* TO 'all'@'localhost' IDENTIFIED BY 'allpass';
GRANT ALL ON NOAADB.* TO 'select'@'localhost' IDENTIFIED BY 'selectpass';
GRANT SELECT ON *.* TO 'select'@'%' IDENTIFIED BY 'selectpass';
STOP
