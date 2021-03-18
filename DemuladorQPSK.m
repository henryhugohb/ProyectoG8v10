function [demod_qpsk]=DemuladorQPSK(signalNoise1_qpsk, p)
    for m=1:length(signalNoise1_qpsk)
       if real(signalNoise1_qpsk(m))>=0 %Región de decisión para demodular
          if imag(signalNoise1_qpsk(m))>=0
            demod_qpsk(p)=0;
            demod_qpsk(p+1)=0;
          else
            demod_qpsk(p)=0;
            demod_qpsk(p+1)=1;
          end
       else
          if imag(signalNoise1_qpsk(m))>=0
            demod_qpsk(p)=1;
            demod_qpsk(p+1)=0;
          else
            demod_qpsk(p)=1;
            demod_qpsk(p+1)=1;
          end
       end
       p=p+2;
    end