function W = WalshTransform(I)
siz = size(I);
siz = siz(2);
q = log2(siz);
if  sum(ismember(char(cellstr(num2str(q))),'.'))~=0
    disp('           Warning!...               ');
    disp('The size of Vector  must be in the shape of 2^N ..');
	%矢量的大小必须是2^N的形状
    return
else
    W = zeros(1,siz);
    for u = 1:siz
        binu = dec2bin(u-1,q);
        binsize = size(binu);
        binsize = binsize(2);
        Wtemp = 0;
        %内部循环
        for m = 1:siz
            binm = dec2bin(m-1,q);
            binsize = size(binm);
            binsize = binsize(2);

            temp = 1;
            for i = 1:q
                temp = temp * (-1)^(binm(q+1-i)*binu(i));
            end
            Wtemp = I(m)*temp + Wtemp;
        end
        W(u) = inv(siz)*Wtemp;
    end
    %循环结束
end
