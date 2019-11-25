clear;clc;
filename = '20s_5degree_VIMM.txt';%文件名需要自己加
copyfile( filename, 'comma2point.txt' )
comma2point_overwrite( 'comma2point.txt' )
fileID = fopen('comma2point.txt');
A = textscan(fileID, '%s');  % it's better to use statement:textscan(fileID, '%s %s %s %s')
fclose(fileID);
B = A{1,1}(13:end);
len = length(B);
time = zeros(len/4,1);
actuator1 = zeros(len/4,1);
actuator2 = zeros(len/4,1);
actuator3 = zeros(len/4,1);
k = 1;
l = 1;
m = 1;
n = 1;
for i = 1:len
    remainder = mod(i,4);
    switch remainder
        case 1
            time(k) = str2double(B{i});
            k = k+1;
        case 2
            actuator1(l) = str2double(B{i});
            l = l+1;
        case 3
            actuator2(m) = str2double(B{i});
            m = m+1;
        case 0
            actuator3(n) = str2double(B{i});
            n = n+1;
    end
end
 fid = fopen('myTextFile1.txt','w');
 myData = [time, actuator1]; %需要自己改
 if fid > 0
     fprintf(fid,'%f %f\n',myData');
     fclose(fid);
 end