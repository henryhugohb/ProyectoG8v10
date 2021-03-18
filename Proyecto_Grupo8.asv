%MODULADOR 8PSK V8.10
%Fuente de audio:       1
%Filtro Acoplamiento:   1
%Codificacion fuente:   1
%Codificacion canal:    0
%Modulacion:            1
%----------------- CONFIGURACIONES INICIALES
clc; %Borra la pantalla
clear; %limpia memoria de variables
close all; %Cierra todas graficas que esten abiertas
M=8; %Numero de niveles de mi señal
k=3; %Numero de bits por simbolo k=Log2(M)
rolloff = 0.5; %Factor de decaimiento pra el filtro
sps = 10; %Muestras por simbolo a utilizar

%----------------- FUENTE DE INFORMACION
titulo = 'SCII GRUPO 8 - Transmisor 8-PSK V8.0';
disp(titulo);
SNR = input('Ingrese el valor de SNR(dB): '); %SNR valor de ruido en el canal en Decibeles
SNR2 = num2str(SNR);
audio_in = uint8( fileread("C:\Users\Marco Villegas\Desktop\Proyecto-SC2-G8V9\Proyecto-SC2-G8V9\intro2.mp3") );

%------------------ CODIFICACION DE FUENTE
%Mensaje para el usuario
sms=strcat('Comprimiendo informacion. Espere...');
clc;
disp(titulo);
disp(sms);
binario=string(dec2bin(audio_in, 8));
simbolo=string(reshape(unique(binario),1,[]));
total=numel(binario);

for i=1:numel(simbolo)
    symbols(i)=i;
    prob(i)=sum(binario == simbolo(i))/total;
   
end
[diccionario,promedio] = huffmandict(symbols,prob);
simb=[];
for i=1:numel(binario)
    for j=1:numel(simbolo)
        if binario(i)==simbolo(j)
            simb=[simb,symbols(j)];
        end
    end
end
codificacion=huffmanenco(simb,diccionario);
data_in2 = codificacion;
%-------------------- CODIFICADOR DE CANAL ------------
% G=[1 1 1; 1 0 1];
% [n,K]=size(G);
% cad_G=num2str(G);
% gen=str2num(dec2base(bin2dec(cad_G),8));
% t=poly2trellis(K,[gen(1,1) gen(2,1)]);
% cod=convenc(data_in2,t);
%nbits = length(cod);
% data_in=cod;
nbits = length(data_in2);
data_in=data_in2;
%------------------ MODULACION (MAPEO DE BITS A S�?MBOLOS)
%Completaremos la trama con ceros de ser necesario
%Pues cada simbolo M esta compuesto de k=3 bits
bittoadded = mod(nbits,3);
data = data_in;
if(bittoadded == 1)
    data(nbits+1)=0;
    data(nbits+2)=0;
end
if(bittoadded == 2)
    data(nbits+1)=0;
end
[data_8psk]=Modulador8PSK(data);

%------------------ FILTRO TRANSMISOR
filtrocosal = rcosdesign(rolloff, 1, sps,"normal");
signalTx = upfirdn(data_8psk, filtrocosal, sps);

%Mensaje para el usuario
sms=strcat('Transmitiendo '," ",num2str(nbits),' bits con SNR = ',SNR2,'dB...');
clc;
disp(titulo);
disp(sms);
%---------desbloquear para final-----------%
%Constelacion(signalTx,'-Transmisor'); %Grafica de la constelacion
%---------desbloquear para final-----------%
%eyediagram(signalTx, 2);
%------------------ CANAL AWGN

%Agrega ruido a la señal
signalRx=awgn(complex(signalTx),SNR);


%------------------ FILTRO RECEPTOR
dataNoise_8psk = upfirdn(signalRx, filtrocosal,1 ,sps);
%Corregimos el desplazamiento producido por el filtro
dataNoise_8psk(1)=[];
longsimb = length(dataNoise_8psk);
dataNoise_8psk(longsimb)=[];
%---------desbloquear para el final-----------%
%Constelacion(dataNoise_8psk,'-Receptor'); %Grafica de la constelacion
%---------desbloquear para el final-----------%
%eyediagram(dataNoise_8psk, 2);

%------------------ DEMODULACIÓN 8PSK
[data_clean] = Demodulador8PSK(signalTx); % Canal sin ruido
[data_preout] = Demodulador8PSK(dataNoise_8psk); % Canal CON ruido

%------------------ INFORMACION RECIBIDA
%Quitar ceros agregados en la modulacion

nbits2 = length(data_preout);
data_out_2 = data_preout;
if(bittoadded == 1)
    data_out_2(nbits2)=[];
    data_out_2(nbits2-1)=[];
end
if(bittoadded == 2)
    data_out_2(nbits2)=[];
end
%-------------------- DECODIFICADOR DE CANAL ------------

% decod= vitdec (data_out_2, t, 10, 'trunc' , 'hard' );
% data_out=decod;
data_out=data_out_2;
%-------------------- DECODIFICADOR DE FUENTE ------------

codificacion = data_out;
simb_recuperados = huffmandeco(codificacion,diccionario);
secuencia_final=[];
for i=1:numel(simb_recuperados)
    for j=1:numel(symbols)
        if simb_recuperados(i)==symbols(j)
            secuencia_final=[secuencia_final,simbolo(j)];
        end
    end
end
dato_recuperado=string(reshape(secuencia_final,[],1));

for i=1:numel(dato_recuperado)
    conver=dato_recuperado(i);
    audio_in_rec(i)=uint8(bin2dec(conver));

end
texto_decimal = audio_in_rec;

%Reconvertir bits a audio y guardarlo
nbits3 = length(data_out);

name_audio_out = strcat("C:\Users\Marco Villegas\Desktop\Proyecto-SC2-G8V9\Proyecto-SC2-G8V9\outro",SNR2,"dB.mp3");
fid = fopen(name_audio_out, 'w');
fwrite(fid,texto_decimal);
fclose(fid);
sms=strcat('Transaccion completa: '," ",num2str(nbits3),' bits recibidos');
disp(sms)

%------------------ GRAFICA BER vs SNR
%---------desbloquear para el final -----------%
%GraficaBER(data, data_8psk);

