function rot = CrotC(rotatedirection,cita)
        a = rotatedirection(1);
        b = rotatedirection(2);
        c = rotatedirection(3);
        temp1 = sqrt(a^2+b^2+c^2);
        a = a/temp1;
        b = b/temp1;
        c = c/temp1;
        cita = cita*pi/180;
        vers = 1-cos(cita);
        cf = cos(cita);
        sf = sin(cita);
        rot = [a*a*vers+cf,b*a*vers-c*sf,c*a*vers+c*sf,0;
               a*b*vers+c*sf,b*b*vers+cf,c*b*vers-a*sf,0;
               a*c*vers-b*sf,b*c*vers+a*sf,c*c*vers+cf,0;
               0,0,0,1];