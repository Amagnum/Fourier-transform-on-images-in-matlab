
% reading the image
img = imread('pout.tif');

%Taking fast fourier transform, 2 is because we are considering 2d matrix
ft_img = fft2(img);

figure, imshow(ft_img,[]);

% Shifting the transformation to center
ft_img_shifted = fftshift(ft_img);
figure, imshow(ft_img_shifted,[]);

% To display the transformation properly, we take log()
figure, imshow(log(1+ft_img_shifted),[]);

% Taking inverse fourrie transformation
img_from_ft = ifft2(ft_img);
figure, imshow(uint8(img_from_ft));
