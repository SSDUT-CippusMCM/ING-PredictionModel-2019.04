%原始数据导入
syms x y;
x = [1995	1996	1997	1998	1999	2000	2001	2002	2003	2004];
y = [174	179	183	189	207	234	220.5	256	270	285];
x0 = 1995:2020;

%多项式拟合系数
p1 = polyfit(x,y,1);
p2 = polyfit(x,y,2);
p3 = polyfit(x,y,3);

%预测值
y1 = polyval(p1,x0);
y2 = polyval(p2,x0);
y3 = polyval(p3,x0);

%作图
plot(x,y,'r*'); hold on;
plot(x0,y1,'b-'); hold on;
plot(x0,y2,'g-'); hold on;
plot(x0,y3,'k-'); hold on;
xlabel('年份'); ylabel('污水量/亿吨');
legend('实际污水排放量','一次曲线预测污水排放量','二次曲线预测污水排放量','三次曲线预测污水排放量');
title('长江污水排放量增长曲线');
grid on;