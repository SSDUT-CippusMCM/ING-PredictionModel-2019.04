%建立符号变量a(发展系数)和b(灰作用量)
syms a b;
c = [a b]';

%原始数列 A
A = [174, 179, 183, 189, 207, 234, 220.5, 256, 270, 285];
n = length(A);

%对原始数列 A 做累加得到数列 B
B = cumsum(A);

%对数列 B 做紧邻均值生成
for i = 2:n
    C(i) = (B(i) + B(i - 1))/2; 
end
C(1) = [];

%构造数据矩阵 
B = [-C;ones(1,n-1)];
Y = A; Y(1) = []; Y = Y';

%使用最小二乘法计算参数 a(发展系数)和b(灰作用量)
c = inv(B*B')*B*Y;
c = c';
a = c(1); b = c(2);

%预测后续数据
F = []; F(1) = A(1);
for i = 2:(n+10)
    F(i) = (A(1)-b/a)/exp(a*(i-1))+ b/a;
end

%对数列 F 累减还原,得到预测出的数据
G = []; G(1) = A(1);
for i = 2:(n+10)
    G(i) = F(i) - F(i-1); %得到预测出来的数据
end

%获取多项式曲线参数
xt1 = 1:10;
p1 = polyfit(xt1,A,1);
p2 = polyfit(xt1,A,2);
p3 = polyfit(xt1,A,3);

%获取多项式曲线
xt2 = 1:20;
y1 = polyval(p1,xt2);
y2 = polyval(p2,xt2);
y3 = polyval(p3,xt2);

%绘制曲线图
t1 = 1995:2004;
t2 = 1995:2014;

plot(t1, A,'ro'); hold on;
plot(t2, G, 'g-'); hold on;
plot(t2, y1,'b-'); hold on;
plot(t2, y2,'y-'); hold on;
plot(t2, y3,'k-'); hold on;
xlabel('年份'); ylabel('污水量/亿吨');
legend('实际污水排放量','灰色预测污水排放量','一次曲线预测污水排放量','二次曲线预测污水排放量','三次曲线预测污水排放量');
title('长江污水排放量增长曲线');
grid on;