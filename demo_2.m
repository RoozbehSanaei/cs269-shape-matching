
load parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Load image from the Dataset
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[train_data label_data] = loadDataset('./Dataset/train-images-idx3-ubyte','./Dataset/train-labels-idx1-ubyte',100,0);

% Choose label of the shape to compare:
digit_label_to_match  = 7;

digit_label_mask = label_data == digit_label_to_match;
index_of_label_to_match = find(digit_label_mask);

shape_1 = index_of_label_to_match(randi([1, length(index_of_label_to_match)]));

%Fix to not pick the same shape twice.
digit_label_mask(shape_1) = 0;
index_of_label_to_match = find(digit_label_mask);

shape_2 = index_of_label_to_match(randi([1, length(index_of_label_to_match)]));

color_map=flipud(gray);

[shape_1_matrix,shape_2_matrix,shape_dim_1,shape_dim_2] = loadShapes(train_data(:,:,shape_1),train_data(:,:,shape_2),sf);

%Display first image on a 2x2 grid, at position 1
figure(1)
subplot(2,2,1)
imagesc(shape_1_matrix);
axis('image')
title(strcat(int2str(digit_label_to_match),'@',int2str(shape_1)))

%Display second image on a 2x2 grid, at position 2
subplot(2,2,3)
imagesc(shape_2_matrix);
axis('image')
title(strcat(int2str(digit_label_to_match),'@',int2str(shape_2)))

%Show image in grayscale
colormap(color_map)
drawnow

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Edge Detection
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

edgeDetection

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Compute correspondences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

computeShapeContextTPS

