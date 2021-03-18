%Modulador de un paquete de bits a simbolos 8PSK
function [data_8psk]=Modulador8PSK(data)
    j=1;
    for i=1:3:length(data);
        if data(i)==0
            if data(i+1)==0
                if data(i+2)==0
                    data_8psk(j)=complex(1,0); %000
                else
                    data_8psk(j)=complex(1/sqrt(2),1/sqrt(2)); %001
                end
            else
                if data(i+2)==0
                    data_8psk(j)=complex(-1/sqrt(2),1/sqrt(2));%010
                else
                    data_8psk(j)=complex(0,1); %011
                end
            end
        else
            if data(i+1)==0
                if data(i+2)==0
                    data_8psk(j)=complex(1/sqrt(2),-1/sqrt(2)); %100
                else
                    data_8psk(j)=complex(0,-1);%101
                end
            else
                if data(i+2)==0
                    data_8psk(j)=complex(-1,0); %110
                else
                    data_8psk(j)=complex(-1/sqrt(2),-1/sqrt(2)); %111
                end
            end
        end
        j=j+1;
    end
end