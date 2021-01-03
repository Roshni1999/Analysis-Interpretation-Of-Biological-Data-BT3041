%Q2 DBSCAN Algorithm
%Roshni BE17B009

%% Loading the data

load('dbscan2000.mat');
P= cell2mat(data);

figure(1)
hold on
title('Data points');
axis equal;
grid on;
plot(P(:,1),P(:,2),'o','MarkerSize',6,'MarkerFaceColor','b', 'MarkerEdgeColor','b');

%% Run DBSCAN

%Parameters- epsilon & minPoints
epsilon=0.2;
MinPoints=25;

ClusterNo=DBSCAN(P,epsilon,MinPoints);

%% Plot Results

C=max(ClusterNo);
colours=hsv(C);

figure(2)
hold on
title(['Epsilon = ', num2str(epsilon) ', MinPts = ', num2str(MinPoints)]);
axis equal;
grid on;


for i=0:C
    Ci=P(ClusterNo==i,:);
    if i~=0     
        Color = colours(i,:);  %Points in clusters
    else
        Color = [0 0 0];  %Noise points
        if ~isempty(Ci)
        end
    end
    if ~isempty(Ci)
        figure(2)
        plot(Ci(:,1),Ci(:,2),'o','MarkerSize',6,'MarkerFaceColor',Color, 'MarkerEdgeColor',Color);
        
    end
    
end
  
 
    

