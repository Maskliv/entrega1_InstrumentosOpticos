function [salidaPura, imagenObservacion] = montajeOptico(imagenEntrada,filtroEnPlanoFourier)
% Esta función representa la imagen de salida de un montaje optico compuesto
% de dos lentes delgadas identicas, separadas por dos veces su distancia
% focal, los planos de entrada y salida ubicados a una distancia focal de
% la primera y segunda lente respectivamente, el punto medio entre ambas
% lentes se conocerá como plano de fourier

% Nota 1: la imagenEntrada y el filtroPlanoFourier deben tener el mismo
% tamaño y un solo canal en primera instancia


% Procedimiento

% 1. Se simula el paso a través de la primera lente, si se asume lambda = 1
% y foco = 1 de acuerdo a lo visto en clase tenemos que al pasar por la
% lente la imagen de entrada quedaria trnasformada en el plano de fourier 
% así:

planoFourier = -1i* fftshift(fft2(imagenEntrada));

% 2. Si allí en el plano de fourier se coloca un filtro de cualquier
% morfología o incluso de fase este afectará a la onda en el plano de
% fourier como una función de trnasmitancia

planoFourierFiltrado = planoFourier .* filtroEnPlanoFourier;

% 3. La imagen de salida será de nuevo aplicar la transformada de fourier
% de lo que sea que haya ocurrido en el plano de fourier ya que está
% distribución de intensidad y fase pasan de nuevo por la lente

salidaPura = -1i * (fft2(planoFourierFiltrado));

% 4. El ojo humano observaria 


imagenObservacion = (abs(salidaPura).^2);

end