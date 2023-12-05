% Read image file
rgbImage = imread('leafSmall.bmp');

% Get green component of the RGB image
gComponent = rgbImage(:,:,2);

%Convert RGB image to grayscale image
gray_img = im2gray(rgbImage);

% % Normalize image
% normalizedImg = abs(gComponent- gray_img) ; 
% 
% % Get binary image
% binaryImage = im2Binary(normalizedImg,6.5,25);
% 
% % Show histogram of the normalized image
% subplot(1,3,1)
% histogram(normalizedImg,256); 
% xlabel('Intensity');
% ylabel('Frequency');
% title('Normalized Histogram');
% 
% % Show normalized image
% subplot(1,3,2)
% imshow(normalizedImg,'InitialMagnification', 800);
% title('Normalized Image');

% Show binary image
subplot(1,3,3)
imshow(binaryImage,'InitialMagnification', 800);
title('Binary Image');

% Convert rgb image to hsv image
hsvImage = rgb2hsv(rgbImage);


%Show histograms for HSV
% subplot(1,3,1)
% histogram(hsvImage(:,:,1),50)
% title('Hue Histogram');
% xlabel('Hue');
% ylabel('Frequency');
% 
% subplot(1,3,2)
% histogram(hsvImage(:,:,2),100)
% title('Saturation Histogram')
% xlabel('Hue');
% ylabel('Frequency');
% 
% subplot(1,3,3)
% histogram(hsvImage(:,:,3),100)
% title('Value Histogram')
% xlabel('Value');
% ylabel('Frequency');


% % Show input image
% subplot(1,3,1)
% imshow(rgbImage);
% title('input image')
% 
% % Show HSV image
% subplot(1,3,2)
% imshow(hsvImage);
% title('HSV Image')
% 
% % SHow binarized image
% subplot(1,3,3)
% newImage = hsvGreen(hsvImage); 
% imshow(newImage);
% title('Binarized HSV Image');




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

function img = hsvGreen(hsvImage)
    % Create a black image
    img = zeros(size(hsvImage));
    imgShape = size(img);

    rows = imgShape(1);
    cols = imgShape(2);

    % Declare thresholds 
    saturationT = 0.15; 
    valueT = 0.30;
    GreenHueLower= 62 / 360;
    GreenHueUpper = 135 / 360;

    for(i=1:rows)
        for(j=1:cols)
            % Store hsv value of a pixel
            hue = hsvImage(i,j,1);
            sat = hsvImage(i,j,2);
            val = hsvImage(i,j,3);

            % Set image to white if it's within the threshold values
            if(hue >= GreenHueLower && hue <= GreenHueUpper && hsvImage(i,j,2) >= saturationT && sat >= 0.16 && val >= valueT)
                img(i,j,:) = 255;
            end
        end
    end
end