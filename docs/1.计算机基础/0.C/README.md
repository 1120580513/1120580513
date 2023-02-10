# C

## 运行 pun.c
1. `预处理`：_执行以 # 开头的命令_
2. `编译`：_将程序翻译成机器指令_
3. `链接`：_将由编译器产生的目标代码和所需的其他附加代码整合在一起，附加代码包括程序中用到的库函数_

## 基本类型
| 类型          | 字节数  | 精度     |
| :------------ | :------ | :------- |
| char          | 2       |
| short int     | 2       |
| int           | 4       |
| long int      | 8       |
| long long int | >=8     |
| float         | 4       | 6个数字  |
| double        | 8       | 15个数字 |
| long double   | >=79bit |

### 整数常量

- `十进制`：_[1-9][0-9]*_
- `八进制`：_0[0-7]*_
- `十六进制`：_0x[0-9a-f]+_

## 构建程序的顺序（供参考）

1. #include
2. #define
3. typedef
4. 外部变量
5. 除 main 函数外的函数原型
6. main 函数
7. 其他函数定义

## 预处理器指令

- `#include`：_导入文件_
- `#define`：_定义宏_
- `#undef`：_删除宏，如果不存在则无任何作用_
- `#if、#ifdef、#ifndef、#elif、#else`：_条件编译_
- `#error`：_编译器错误_
- `#line`：_改变行编号方式_
- `#pragma`：_可让编译器执行某些特殊操作_

### 宏

```c
#define N 100 //简单的宏，编译时会将所有 N 替换为 100
#define MAX(x, y) ((x)>(y)?(x):(y)) //函数式宏，看似很多的括号是为了避免一些少数情况下的错误
#define PRINT_INT(n) printf(#n " = %d\n", n)// #n 表示字符串化
#define MK_ID(n) i##n // ##n 记号粘合
#define TEST(condition, ...) ((condition)?\
  printf("Passed test:%s\n", #condition):\
  printf(__VA_ARGS__))
```
#### 预定义宏

- `__LINE__`：_被编译的文件中的行号_
- `__FILE__`：_被编译的文件名_
- `__DATE__`：_编译的日期(Mmm dd yyyy)_
- `__TIME__`：_编译的时间(hh:mm:ss)_
- `__STDC__`：_如果符合C89或C99则为1_
- `__func__`：_当前函数的函数名_

## 指针
> 变量名前加 *，即为指针

> &运算符将得到变量在内存中的地址

> 指针变量前加 *，即为间接寻址，将得到指针指向的内存的值

```c
int i, arr[], *p;// 声明变量和指针
i = 2;// 初始化变量
arr = {1, 2, 3};
p = &i;// 初始化指针
*p;// 得到指针指向的值，即 2
p = arr;// 数组名也是一个指针，直接赋值给 p
arr[i] = 3;// arr[i] 相当于 *(arr + i) 所以也可以写成 i[arr]
```

## 字符串

> 只要是以空字符结尾的，任何一维的字符数组都可以用来存储字符串

> 假如要存储 10 个字符，那么声明的字符数组的长度至少要等于 11

## 函数

### 标准 main 函数

```c
// argc 参数个数，argv 所有参数
int main(int argc, char *argv[])
{
  return 0;
}
```

## 结构、联合和枚举

> 一些计算机要求特定数据项的地址是某个字节数的位数，因此用 sizeof 得到的字节数可能会大于和成员字节数的合

### 结构
```c
struct part{
  int number;
  unsigned int day: 5;// 位域为 5
} part1 = { 123 };
```

### 联合
```c
union  {
  int i;
  double d;
} u = {0};
```

> 编译器只为联合中最大的成员分配足够的内存空间

### 枚举
```c
enum suit{ CLUBS, DIAMONDS };
```

## 声明

### 存储类型

- `auto`：_只对属于块的变量有效_
- `static`：_在块外时，static 的变量仅在文件内可见。在块内时，static 的变量仅会初始化一次_
- `extern`：_编译器不会给 extern 的变量分配内存，因为该变量在其他文件中已被初始化_
- `register`：_请求编译器将变量存储在寄存器中_

### 类型限定符

- `const`：_表示该变量不可更改_
```c
//第一个 const 表示数据的每个员工不能被修改
//第二个 const 表示 arr 指针不可被修改
void each_print(int n, const int * const arr);
```
- `volatile`：_易变的，不要对它优化，每次都到变量的地址中去读取变量的数据_
- `restrict`：_表明指针是访问一个数据对象的唯一且初始的方式，能帮助编译器进行更好的优化_

### 函数说明符

- `inline`：_内联函数，函数的每一次调用都用函数的机器指令来代替_

## 函数
```c
int sum_array(int n,int a[*]);// 使用 * 提供了一个线索——数据的长度是由第一个参数提供的
int sum_array(int a[static 3],int n);// [static 3] —— 保证数组的长度至少是 3，编译器可以据此生成更快的指令

```

## 标准库

| 库名     | 用途                                                              |
| :------- | :---------------------------------------------------------------- |
| C89      | C89                                                               |
| assert   | 仅包含 assert 宏，允许在程序中插入自我检查，一旦检查 ，程序将终止 |
| signal   | 提供处理异常的函数                                                |
| stdlib   | 包含大量无法划归其他头的函数                                      |
| stdarg   | 提供用于编写可变参数的函数                                        |
| string   | 字符串处理                                                        |
| ctype    | 提供用于字符分类及大小写转换的函数                                |
| limits   | 提供用于描述整数类型特性的宏                                      |
| errno    | 提供错误码                                                        |
| locale   | 提供一些函数帮助程序适应针对某个国家或地区的特定行为              |
| stddef   | 提供常用的类和宏的定义                                            |
| time     | 日期和时间                                                        |
| math     | 提供常见的数学函数                                                |
| float    | 提供用于描述浮点类型特性的宏                                      |
| setjmp   | 提供 setjmp 和 longjmp，可从一个函数跳转到另一个函数              |
| stdio    | 提供输入/输出函数                                                 |
| C99      | C99                                                               |
| fenv     | 提供对浮点状态标志和控制模式的访问                                |
| stdint   | 整数类型                                                          |
| inttypes | 整数类型格式转换                                                  |
| wchar    | 扩展的多字节和宽字符实用工具                                      |
| complex  | 复数算数                                                          |
| iso646   | 拼写转换                                                          |
| stdbool  | 布尔类型和值                                                      |
| tgmath   | 泛型数学                                                          |
| wctype   | 宽字符分类和映射实用工具                                          |

### stddef

- `ptrdiff_t`：_指针相减的结果类型_
- `size_t`：_sizeof 运算符返回的类型_
- `wchar_t`：_一种足够大的、可以用于表示所有支持的地区的所有字符的类型_
- `NULL`：_空指针_
- `offsetof`：_计算结构起点到指定成员间的字节数_

### stdbool

- `bool`：_定义为_Bool_
- `true`：_1_
- `false`：_0_
- `__bool_true_false_are_defined`：_1_

### stdio

#### 标准流

- `stdin`：_标准输入，默认输入：键盘_
- `stdout`：_标准输出，默认输出：屏幕_
- `stderr`：_标准错误，默认输出：屏幕_

> printf、scanf、putchar、getchar、puts、gets 都是基于 stdin 和 stdout 的

#### 文件操作

| 模式字符串 | 含义                                   |
| :--------- | :------------------------------------- |
| r          | 打开文件用于读                         |
| w          | 打开文件用于写(文件不需要存在)         |
| a          | 打开文件用于追加(文件不需要存在)       |
| b          | 打开二进制文件                         |
| r+         | 打开文件用于读和写，从文件头开始       |
| w+         | 打开文件用于读和写(如果文件存在就截去) |
| a+         | 打开文件用于读和写(如果文件存在就追加) |

- `FILE *fopen(const char * restrict filename, const char * restrict mode)`：_打开文件_
- `int fclose(FILE *stream)`：_关闭文件_
- `FILE *freopen(const char * restrict filename, const char * restrict mode, FILE * restrict stream)`：_为打开的流附加文件_
- `FILE *tmpfile(void)`：_创建临时文件_
- `char *tmpnam(char *s)`：_为临时文件产生名字_
- `int fflush(FILE *stream)`：_清洗缓冲区_
- `void setbuf(FILE * restrict stream, char * restrict buf)`：_改变缓冲流_
- `int setvbuf(FILE * restrict stream, char * restrict buf, int mode, size_t size)`：_设定缓冲模式和缓冲区大小的默认值_
- `int remove(const char *filename)`：_删除文件_
- `int remove(const char *old, const char *new)`：_重命名_

#### 格式化输入/输出

- `int fprintf(FILE * restrict stream, const char * restrict format, ...)`：_向流中写入输出_
- `int printf(const char * restrict format, ...)`：_向标准输出写入_
- `int fscanf(FILE * restrict stream, const char * restrict format, ...)`：_从文件流读入数据_
- `int fscanf(const char * restrict format, ...)`：_从标准输入流读入_
- `void clearerr(FILE *stream)`：_清除错误_
- `int feof(FILE *stream)`：_检测在流上失败的原因：是否到达末尾_
- `int ferror(FILE *stream)`：_检测在流上失败的原因：读错误_
- `int fputc(int c, FILE *stream)`：_向流中输出_
- `int putc(int c,FILE *stream)`：_fputc 的宏版本_
- `int putchar(int c)`：_向标准输出流写入一个字符_
- `int fgetc(FILE *stream)`：_从流中读入一个字符_
- `int getc(FILE *stream)`：_fgetc 的宏版本_
- `int getchar(void)`：_从标准输入流读入一个字符_
- `int ungetc(int c, FILE *stream)`：_回放字符_
- `int fputs(const char * restrict s, FILE * restrict stream)`：_将字符写入流(不会加换行符，除非文件中有换行符)_
- `int puts(const char *s)`：_写入字符并添加换行符_
- `char *fgets(char * restrict s, int n, FILE * restrict stream)`：_从标准输入流中读取一行_
- `char *gets(char *s)`：_逐个读取字符直到遇到换行符_
- `size_t fred(void * restrict ptr, size_t size, size_t nmemb, FILE * restrict stream)`：_读数据块_
- `size_t fwirte(const void * restrict ptr, size_t size, size_t nmemb, FILE * restrict stream)`：_写入数据块_
- `int fgetpos(FILE * restrict stream, fpos_t * restrict pos)`：_处理大文件：得到位置_
- `int fseek(FILE *stream, long int offset, int whence)`：_改变文件指针位置_
- `int fsetpos(FILE *stream, const fpos_t *pos)`：_处理大文件：改变位置_
- `long int ftell(FILE *stream)`：_返回当前文件位置_
- `void rewind(FILE *stream)`：_将文件位置设置在起始处_
- `int sprintf(char * restrict s, const char * restrict format,...)`：_将输出定入字符数组_
- `int snprintf(char * restrict s, size_t n, ... const char * restrict format, ...)`：_写入最大 n - 1 个字符_
- `int sscanf(const char * restrict s, const char * restrict format, ...)`：_从字符串中读取数据_

- ``：__
> 如果对流的操作出现错误，使用 feof 和 ferror 来判断错误的原因，如果都不是，那一定是由于匹配错误而失败

##### 转换说明
| 示例      | 标志 | 最小字段宽度 | 精度 | 长度修饰符 | 转换说明符 |
| :-------- | :--- | :----------- | :--- | :--------- | :--------- |
| %#012.5Lg | #0   | 12           | .5   | L          | g          |

###### 标志
- `-`：_在字段内左对齐(默认右对齐)_
- `+`：_数字以+或-开头_
- `空格`：_在非负数前加空格_
- `#`：_配合八进制、十六进制输出_
- `0`：_用0填充_
