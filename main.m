% Read image file
rgbImage = imread('leafSmall.bmp');

% Get green component of the RGB image
gComponent = rgbImage(:,:,2);

%Convert RGB image to grayscale image
gray_img = im2gray(rgbImage);

% Normalize image
normalizedImg = abs(gComponent- gray_img) ; 

% Get binary image
binaryImage = im2Binary(normalizedImg,6.5,25);

% Show histogram of the normalized image
subplot(1,3,1)
histogram(normalizedImg,256); 
xlabel('Intensity');
ylabel('Frequency');
title('Normalized Histogram');

% Show normalized image
subplot(1,3,2)
imshow(normalizedImg,'InitialMagnification', 800);
title('Normalized Image');

% Show binary image
subplot(1,3,3)
imshow(binaryImage,'InitialMagnification', 800);
title('Binary Image');


% Global Thresholding of grayscale image
function binarizedImage = im2Binary(img, T_lower, T_upper)
    binarizedImage = img; 
    imgShape = size(img); 
    rows = imgShape(1);
    cols = imgShape(2); 

    for i = 1: rows
        for j = 1 : cols
            if ((binarizedImage(i,j) <= T_upper && binarizedImage(i,j) >= T_lower))
                binarizedImage(i,j) = 255;
            else
                binarizedImage(i,j)= 0;
            end
        end
    end
end