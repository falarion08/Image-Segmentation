img = imread('leafSmall.bmp');
I = rgb2gray(img);

% imshow(I,'InitialMagnification', 800);
% imhist(img); 
h= histogram(I); 

hold on
plot(h.BinEdges(1:length(h.BinEdges)-1),h.Values); 
h;
hold off


