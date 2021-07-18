clc; clear all; close all;
% Task 1
Tumor=imread('Tumor.png');
[r,c,l]=size(Tumor);
a=r*c;
figure()
image(Tumor);

MRI_scan=imread('MRI_scan.png');
[rr,cc,ll]=size(MRI_scan);
b=rr*cc;
figure();
image(MRI_scan);

n=0;

if b<a
    error('MRI Scan image is smaller than the image of Tumor.')
end

if l~=3|| ll~=3
    error('At least one of the image is non three dimensional.Program Terminated')
end


% Task 2
for i=1:r-rr
    forj=c-cc;
    if Tumor(1,1,1)==MRI_scan(i,j,1)  && Tumor(1,1,3)==MRI_scan(i,j,3) && Tumor(1,1,2)==MRI_scan(i,j,2)
        z=0;
        for R=1:rr
            for C=1:cc
                if Tumor(R,C,1)==MRI_scan(i+R-1,1i+C-1,1)  && Tumor(R,C,2)==MRI_scan(i+R-1,j+C-1,2) && Tumor(R,C,3)==MRI_scan(i+R-1,j+C-1,3)
                    z=z+1;
                end
                if z==a
                    Corner_2=[i+R-1,j+C-1];
                    Corner_1=[i,j];
                    n=1;
                end
            end
        end
        
    end
end

if n==1
    fprintf('The tumor is found between the coordinates [0.0f,%0.0f] and [%0.0f,%0.0f] starting from top left corner of mRI scan.',Corner_1, Corner_2)
else
    fprintf('The tumor was not found');
end

