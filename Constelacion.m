%Graficador de constelaciones 8PSK
function []=Constelacion(data_8psk, label)
    newtitle = strcat('Constelación Modulación 8PSK ',label);
    scatterplot(data_8psk) %Grafíca la constelación
    title(newtitle);
end