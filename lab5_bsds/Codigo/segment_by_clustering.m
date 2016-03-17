function et = segment_by_clustering( rgb_image, feature_space, clustering_method, number_of_clusters)
   
% se realiza llama una de las funciones de cluster de acuero al nombre
% ingresado por el usuario
switch clustering_method
    % Se llama la funcion de cluster kmeans
    case 'kmeans'
      [ et]=Clust_Kmeans( rgb_image, feature_space, number_of_clusters );
    % Se llama la funcion de cluster GMM
    case 'GMM'
        % Se utiliza el comando try and catchpara evitar errores por
        % inicializaciones erroneas
        try
            [ et]=Clust_GMM( rgb_image, feature_space, number_of_clusters );
        catch ME
            [a,b]=size(rgb_image);
            et=zeros(a,b);
            msg= ME.message;
        end
        % Se llama la funcion de cluster watersheds
    case 'watersheds'
      [ et]=Clust_Wts( rgb_image, number_of_clusters );
end

end

