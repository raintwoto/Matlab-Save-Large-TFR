# Matlab Save Large TFR

In Fieldtrip, if you do a time-frequency transformation, you will get a very large complex number for futher analysis (maybe >10Gb). Since Matlab have a very bad system for dealing  with large file. It is hard to save them.

Here is a solution based on the H5 system
