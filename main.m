% Read image file

rgbImage = imread('leafSmall.bmp');
% Convert image to gray scale

gComponent = rgbImage;
gComponent(:,:,1) = 0;
gComponent(:,:,3) = 0; 



binaryImage = gray2Binary(gComponent(:,:,2),120,190);

subplot(1,2,1)
% Get histogram of the grayscale image
histogram(gComponent); 

subplot(1,2,2)
imshow(gComponent,'InitialMagnification', 800);



% Global Thresholding of grayscale image
function binarizedImage = gray2Binary(img, T_lower, T_upper)
    binarizedImage = img; 
    imgShape = size(img); 
    rows = imgShape(1);
    cols = imgShape(2); 

    for i = 1: rows
        for j = 1 : cols
            if (binarizedImage(i,j) <= T_upper && binarizedImage(i,j) >= T_lower)
                binarizedImage(i,j) = 255;
            else
                binarizedImage(i,j)= 0;
            end
        end
    end
end