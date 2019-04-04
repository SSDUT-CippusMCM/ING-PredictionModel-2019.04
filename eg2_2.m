%ԭʼ���ݵ���
syms x y;
x = [1995	1996	1997	1998	1999	2000	2001	2002	2003	2004];
y = [174	179	183	189	207	234	220.5	256	270	285];
x0 = 1995:2020;

%����ʽ���ϵ��
p1 = polyfit(x,y,1);
p2 = polyfit(x,y,2);
p3 = polyfit(x,y,3);

%Ԥ��ֵ
y1 = polyval(p1,x0);
y2 = polyval(p2,x0);
y3 = polyval(p3,x0);

%��ͼ
plot(x,y,'r*'); hold on;
plot(x0,y1,'b-'); hold on;
plot(x0,y2,'g-'); hold on;
plot(x0,y3,'k-'); hold on;
xlabel('���'); ylabel('��ˮ��/�ڶ�');
legend('ʵ����ˮ�ŷ���','һ������Ԥ����ˮ�ŷ���','��������Ԥ����ˮ�ŷ���','��������Ԥ����ˮ�ŷ���');
title('������ˮ�ŷ�����������');
grid on;