function [demod_8psk]=Demodulador8PSK(signalNoise1_8psk)
    p=1;
    for m=1:length(signalNoise1_8psk)
        if angle(signalNoise1_8psk(m))>=0 
            %Primer Cuadrante
            if angle (signalNoise1_8psk(m))<=pi/8
                demod_8psk(p)=0; 
                demod_8psk(p+1)=0;
                demod_8psk(p+2)=0;
                
            %Primer Cuadrante   
            elseif angle (signalNoise1_8psk(m))>pi/8 && angle (signalNoise1_8psk(m))<=(3*pi)/8
                demod_8psk(p)=0; 
                demod_8psk(p+1)=0;
                demod_8psk(p+2)=1;
                
            %Primer y Segundo cuadrante
            elseif angle (signalNoise1_8psk(m))>(3*pi)/8 && angle (signalNoise1_8psk(m))<=(5*pi)/8
                demod_8psk(p)=0; 
                demod_8psk(p+1)=1;
                demod_8psk(p+2)=1;  
            %Segundo cuadrante    
            elseif angle (signalNoise1_8psk(m))>(5*pi)/8 && angle (signalNoise1_8psk(m))<=(7*pi)/8
                demod_8psk(p)=0; 
                demod_8psk(p+1)=1;
                demod_8psk(p+2)=0;        
            %Segundo Cuadrante
            else
                demod_8psk(p)=1; 
                demod_8psk(p+1)=1;
                demod_8psk(p+2)=0;  
            end
        else
            if angle (signalNoise1_8psk(m))>=(-pi)/8
                demod_8psk(p)=0;
                demod_8psk(p+1)=0;
                demod_8psk(p+2)=0;
            
            elseif angle (signalNoise1_8psk(m))>=(-3*pi/8) && angle (signalNoise1_8psk(m))<(-pi)/8
                demod_8psk(p)=1; 
                demod_8psk(p+1)=0;
                demod_8psk(p+2)=0;
                
            elseif angle (signalNoise1_8psk(m))>=(-5*pi)/8 && angle (signalNoise1_8psk(m))<(-3*pi)/8
                demod_8psk(p)=1; 
                demod_8psk(p+1)=0;
                demod_8psk(p+2)=1;  
            
            elseif angle (signalNoise1_8psk(m))>=(-7*pi)/8 && angle (signalNoise1_8psk(m))<(-5*pi)/8
                demod_8psk(p)=1; 
                demod_8psk(p+1)=1;
                demod_8psk(p+2)=1;
                
            else
                demod_8psk(p)=1; 
                demod_8psk(p+1)=1;
                demod_8psk(p+2)=0;  
            end
        end
        p=p+3;
    end
end