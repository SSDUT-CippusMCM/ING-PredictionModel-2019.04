%原始数据导入
syms x y;
x = 1900:10:2010;
y = [75.995	91.972	105.711	123.203	131.669	150.697	179.323	203.212	226.505	249.633	256.344	267.893];

%插值预测数据
x0 = 1900:2050;
y0_nearest = interp1(x,y,x0,'nearest');
y0_linear = interp1(x,y,x0,'linear');
y0_pchip = interp1(x,y,x0,'pchip');

%作图
plot(x,y,'ro'); hold on;
plot(x0,y0_nearest,'b-');hold on;
plot(x0,y0_linear,'k-'); hold on;
plot(x0,y0_pchip,'y-'); hold on;
xlabel('年份');
ylabel('年产量');
legend('原始数据','nearest插值','linear插值','pchip插值');
grid on;

