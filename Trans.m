function trans = Trans(a)
a = [a;1];
trans = [1 0 0;0 1 0;0 0 1;0 0 0];
trans = [trans a];