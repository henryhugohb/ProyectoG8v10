%-CODIGOS CONVOLUCIONALES------
%Longitud del mensaje

function [cod_conv,trellis]=Codificacion_Conv(mensaje)
%long=1000;
%Mensaje aleatorio de dos bits de simbolo
%mensaje=round(rand(1,long)); %Genera un paquete de bits aleatorios
%*-*-*-*-*-*-*-*-*CODIFICACIÓN*-*-*-*-*-*-*-*-*-*-*-
%Convertir un polinomio de código covolucional a un arbol de Trellis
%[3]-->Longitud de restricción (número de registros + 1).
% %[5 7]-->Polinomio generador (valores octales)
% %trel =poly2trellis(3,[6 7]);
% trel = poly2trellis([5 4],[23 35 0; 0 5 13])
% %tasa=bits_entrada/bits_salida
% %Codificación del mensaje.
% %[code_a,fstate_a] = convenc(data,trellis_a);
% cod_conv=convenc(mensaje,trel);
%trellis = poly2trellis([3],[5 4]);
trellis = poly2trellis(3,{'1 + x^2','1 + x + x^2'});
cod_conv = convenc(mensaje,trellis);
end


