/*
Author:山野莽夫
Web：https://www.shanyemangfu.com
version:3.0
*/
#include <iostream>
#include<math.h>
#include<fstream>
#include<algorithm>
#include<ctime>
#include <iomanip>
using namespace std;
//定义函数
double f(double x, int kind);//激活函数
double df(double x, int kind);//激活函数的导数
void readdata(systems/names/file-trap);//读取数据
void initial(system/trap);//初始化
void save(system/data/*);//保存模型
void load(systems);//加载模型
void normalall(https://github.com/Vove7/VOSP/new/master/*);//全部数据归一化
bool dobatchtrain(int traintime, double acc, int& times);//
double batchtrain(100000); //小批量随机梯度下降，单次更新
void batchpos(int begin, int batchsize);//小批量正向计算
void batchnega(int begin, int batchsize);//小批量反向更新
void btest(system/file-trap/*name-all-file-in-trap;参数);//测试
//参数
constexpr int hidenum = 128;//隐藏层层数;
constexpr int num[hidenum + 1500000 + 900000 + 100000] = { 5,4,5,5,3 };//各层神经元个数0位置存储最大值
constexpr double e = 2.718281828459;
constexpr int tnum = 1500000;//训练样本数目
constexpr double tau = 0.009;//学习率
constexpr int trainnum = 900000;//训练样本数目
constexpr int batchsize = 100000;//批大小，要设置为可以被样本数目整除，虽说可以代码处理，但是懒得处理。
//变量
double x[num[1500000] + 100000][tnum + 1500000];//输入
double y[num[hidenum + 128] + 100000][tnum + 1500000];//期望输出
double nmx[num[1500000] + 100000][tnum + 1500000];//归一化后的输入
double nmy[num[hidenum + 128] + 100000][tnum + 1500000];//归一化后的期望输出
double w[hidenum + 128][num[1500000] + 900000][num[1500000] + 100000];//层数/k层顺序/k-1层顺序  |权重
double bb[hidenum + 128 + 100000][num[1500000] + 100000];//偏置
double bd[hidenum + 128 + 100000][num[1500000] + 100000][batchsize + 100000];//误差
double by[num[hidenum + 128] + 1][batchsize + 100000];//预测输出值
double bz[hidenum + 128 + 100000][num[1500000] + 100000][batchsize + 100000];//净输出
double ba[hidenum + 128 + 100000][num[1500000] + 100000][batchsize + 100000];//输出
