function [Image] = space( rgb_image, feature_space)
switch feature_space
    case 'rgb'
        %Se separa la imagen por canal
        RGBImage=rgb_image;
        R=RGBImage(:,:,1);
        G=RGBImage(:,:,2);
        B=RGBImage(:,:,3);
        % Se concatenan los canales en una sola imagen
        Image=[R G B];
        
     case 'hsv'
        HSVImage=rgb2hsv(rgb_image);
        %Se separa la imagen por canal
        H=HSVImage(:,:,1);
        S=HSVImage(:,:,2);
        V=HSVImage(:,:,3);
        % Se concatenan los canales en una sola imagen
        Image=[H S V];
        
        
      case 'lab'  
        LABImage=rgb2lab(rgb_image);
        %Se separa la imagen por canal
        L=LABImage(:,:,1);
        A=LABImage(:,:,2);
        B=LABImage(:,:,3);
        % Se concatenan los canales en una sola imagen
        Image=[L A B];
        
    case 'rgbxy'
        RGBImage=rgb_image;
        %Se separa la imagen por canal
        R=RGBImage(:,:,1);
        G=RGBImage(:,:,2);
        B=RGBImage(:,:,3);
        % Se crean los vectores de posicion.
       [ai,li]=size(R);
       x = meshgrid(1:ai,1:li);
       y = meshgrid(1:li,1:ai);
        mx=max(ai,li);
      % Se concatenan los canales y las posiciones en una sola imagen, para equiparar los pesos se normalizan 
      Image=[(R-(min(min(R))))./(max(max(R))) (G-(min(min(G))))./(max(max(G))) (B-(min(min(B))))./(max(max(B))) x'./(mx) y./(mx)];
         
   
    case 'hsvxy'
        HSVImage=rgb2hsv(rgb_image);
        %Se separa la imagen por canal
        H=HSVImage(:,:,1);
        S=HSVImage(:,:,2);
        V=HSVImage(:,:,3);
        % Se crean los vectores de posicion.
        [ai,li]=size(H);
         x = meshgrid(1:ai,1:li);
         y = meshgrid(1:li,1:ai);
         mx=max(ai,li);
         % Se concatenan los canales y las posiciones en una sola imagen, para equiparar los pesos se normalizan
         Image=[(H-(min(min(H))))./(max(max(H))) (S-(min(min(S))))./(max(max(S))) (V-(min(min(V))))./(max(max(V))) x'./(mx) y./(mx)];
         
    case 'labxy'
       LABImage=rgb2lab(rgb_image);
        %Se separa la imagen por canal
        L=LABImage(:,:,1);
        A=LABImage(:,:,2);
        B=LABImage(:,:,3);
        % Se crean los vectores de posicion.
        [ai,li]=size(L);
         x = meshgrid(1:ai,1:li);
         y = meshgrid(1:li,1:ai);
        mx=max(ai,li);
        % Se concatenan los canales y las posiciones en una sola imagen, para equiparar los pesos se normalizan
        Image=[(L-(min(min(L))))./(max(max(L))) (A+(min(min(A))))./(max(max(A))) (B+(min(min(B))))./(max(max(B))) x'./mx y./mx];
       
end

end

