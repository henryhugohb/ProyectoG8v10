function dec_conv=Decodificacion_conv(coded,trellis)
%Decodificaci�n con hard decision debido a que la
% %entrada al decodificador es binaria (1 � 0).
% %decodedData = vitdec(codedData,trellis,tbdepth,'trunc','hard');
% dec_conv=vitdec(coded,trel,3,'trunc','hard');
tbdepth = 34;
dec_conv = vitdec(coded,trellis,tbdepth,'trunc','hard');

end