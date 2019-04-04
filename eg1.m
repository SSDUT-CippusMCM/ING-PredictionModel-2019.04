%ԭʼ���ݵ���
syms x y;
x = 1900:10:2010;
y = [75.995	91.972	105.711	123.203	131.669	150.697	179.323	203.212	226.505	249.633	256.344	267.893];

%��ֵԤ������
x0 = 1900:2050;
y0_nearest = interp1(x,y,x0,'nearest');
y0_linear = interp1(x,y,x0,'linear');
y0_pchip = interp1(x,y,x0,'pchip');

%��ͼ
plot(x,y,'ro'); hold on;
plot(x0,y0_nearest,'b-');hold on;
plot(x0,y0_linear,'k-'); hold on;
plot(x0,y0_pchip,'y-'); hold on;
xlabel('���');
ylabel('�����');
legend('ԭʼ����','nearest��ֵ','linear��ֵ','pchip��ֵ');
grid on;

