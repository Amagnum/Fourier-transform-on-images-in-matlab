
% reading the image
B = imread('pout.tif');

figure, imshow(B);

%Taking fast fourier transform, 2 is because we are considering 2d matrix
ft_B = fft2(B);

% To display the transformation properly, we take log()
figure, imshow(log(1+fftshift(ft_B)),[]);


% Create filter
filter = ones(size(B));
rc = 146;
cc = 120;

for i = 1:291
    for j = 1:240
        dist = sqrt((rc-i)^2+(cc-j)^2);
        if dist < 19
            filter(i,j) = 0;
        end
    end
end

figure, imshow(filter);
figure, imshow(~filter);

% apply filters
res1 = filter.*fftshift(ft_B);
res2 = ~filter.*fftshift(ft_B);

figure, imshow(log(1+res1),[]);
figure, imshow(log(1+res2),[]);

% Taking inverse fourrie transformation
figure, imshow(uint8(ifft2(ifftshift(res1))));
figure, imshow(uint8(ifft2(ifftshift(res2))));
