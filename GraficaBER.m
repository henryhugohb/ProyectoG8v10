function []=GraficaBER(data, data_8psk)
    %%%Calculo de BER vs SNR de 0dB a 30dB
    numberiteration=10;
    ber_sim_8psk=[];
    ber_prom_8psk=[];
    for snr2=0:1:30 %variar el SNR del canal para obtener BERvsSNR
        ber_8psk1=[];
        for l=1:numberiteration %Para cada valor de SNR realiza 30 cÃ¡lculos BER
            signalNoise1_8psk=awgn(complex(data_8psk),snr2);
            [demod_8psk]=Demodulador8PSK(signalNoise1_8psk);
            [noe1 ber_8psk]=biterr(data,demod_8psk); %calculo del BER 8PSK
            ber_8psk1=[ber_8psk1 ber_8psk];        
        end
        ber_prom_8psk=sum(ber_8psk1)/numberiteration;
        ber_sim_8psk=[ber_sim_8psk ber_prom_8psk]; %acumula todos los valores del BER para cada valor de snr2 8PSK   
    end

    %GRÃ?FICA DE BER VS. SNR
    snr3=0:1:30;
    figure (5)
    semilogy(snr3,ber_sim_8psk,'r*-','linewidth',2);
    grid on;
    legend('8PSK')
    xlabel('SNR(dB)-->');
    ylabel('BER-->')
end