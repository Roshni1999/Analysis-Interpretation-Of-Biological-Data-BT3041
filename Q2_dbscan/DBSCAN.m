function [ClusterNo]=DBSCAN(P, epsilon, MinPoints)

    C=0;
    points = size(P,1);
    ClusterNo = zeros(points,1);
    D = pdist2(P,P);
    
    visited=false(points,1);
    noise_point=false(points,1);
    
    for i=1:points
        if ~visited(i)
            visited(i)=true;
            
            reachable=find(D(i,:)<=epsilon);
            
            if length(reachable)<MinPoints
                noise_point(i)=true;
            else
                C=C+1;
                cluster_expand(i,reachable,C);
            end
            
        end
    
    end
    
    function cluster_expand(i,reachable,C)
        ClusterNo(i)=C;
        k = 1;
        while true
            j = reachable(k);
            
            if ~visited(j)
                visited(j)=true;
                reach_next= find(D(j,:)<=epsilon);
                if length(reach_next)>=MinPoints
                    reachable =[reachable reach_next];  
                end
            end
            if ClusterNo(j)==0
                ClusterNo(j)=C;
            end
            
            k = k + 1;
            if k > length(reachable)
                break;
            end
        end
    end
       

end



