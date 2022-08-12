# CSharp

## 常用写法

```csharp
//预处理器指令
#define TEST
#region 折叠代码
#endregion
//判断 TEST 是否存在
#if TEST
#warning"遇到此指令会在警告窗口显示";
#endif

//using 导入命令空间
using System;
//using 起别名
using _system = System;
//using static 导入静态类，导入后该类的静态属性方法前面不需要再加类名
using static System.Console;
using System.Collections;
using System.Threading.Tasks;
using System.Diagnostics;
using System.IO;

//namespace 声明命名空间
namespace ConsoleApp1
{
    //enum 枚举
    [Flags]//特性
    enum Enum1
    {
        a = 0x00000001,
        b = 0x00000010
    }
    //struct 结构体：值类型
    struct Struct1
    {
    }
    //class 类：引用类型，类名可以不和文件名相同
    class Class1
    {
        //与类同名的且无返回值的方法为构造函数
        public Class1() : this("调用有参数的构造函数") { }
        public Class1(string s) { }
        //static 静态方法
        static int Main(string[] args)
        {
            goto abc;//goto 跳转 switch 实际上就是 goto 语句
            return 0;
        abc:
            return -1;
        }
        //void 表示返回void，可理解为无返回值
        void Keyword(params string[] strs)
        {
            //dynamic 动态类型，通常与动态语言交互时才会用
            dynamic abc = null;
            abc.x = 1;
            object o = null;//null 空指针
            Type t = typeof(string);//得到 Type
            var nbr = default(int);//默认值
            var name = nameof(nbr);//得到变量名 C# 6.0
            checked { }//检查算术溢出
            unchecked { }//不检查算术溢出
            //unsafe { }//不安全代码，可使用指针(需要:项目->属性->生成>允许不安全代码)
        }
        [Conditional("DEBUG")]//当没有 DEBUG 编译符时，编译器会忽略所有该方法的引用
        void 技巧()
        {
            //var，编译器会自动加上类型
            var mopera = 3 > 4 ? 0 : 1;//三元运算符
            var nullgrammer = null ?? string.Empty;//空运算符
            var nullx = nullgrammer?.ToString();//Null 传播器 C# 6.0
            var format = $"ac{nullgrammer}";//拼接
            var aa = @"//可换行
asdfsdf ""//转义："" => 引号
";
            global::System.Int32 nbr = 3;//global::从全局开始查找
        }
        //public 表示公有的
        public void OutParam(out int a, ref int b)
        {
            a = 3;//out 在外部未初始化，必须要初始化才能使用
            b = 2;//ref 引用传递
        }
        protected void A() { }//受保护的
        internal void B() { }//仅当前程序集可见
        extern void C();//外部方法，通常是其他语言提供的库

        private readonly string _readonly_field = "abc";//只读
        private string _field;//私有问题，常以 _ 开头
        private int? _nullable;//可空类型写法1
        private Nullable<int> _nullable2;//可空类型写法2
        private const double PAI = 3.1415826;//const 常量

        //summary 方法注释
        /// <summary>
        /// 手动实现的属性
        /// </summary>
        public string Property
        {
            private get { return _field; }
            set { _field = value; }
        }
        public string AutoImplProperty { get; set; }//自动实现的属性
        public string InitProperty { get; set; } = "";//属性初始值

        public delegate void DelegateHandler(string a);
        void _handler(string x) { }
        public event DelegateHandler Events;
        void InvokeEvent()
        {
            Events += _handler;
            Events -= _handler;
            Events += s => { };//lambda
            Events += delegate (string a) { };//匿名方法 C# 2.o
            Events.Invoke(string.Empty);//执行事件
        }

        public static explicit operator string(Class1 x)//显示类型转换
        {
            return x.ToString();
        }
        public static implicit operator int(Class1 x)//隐式类型转换
        {
            return int.Parse(x.ToString());
        }
        public static Class1 operator +(Class1 c)//运算答重载
        {
            return c;
        }
        public int this[int i]//索引器
        {
            get { return 0; }
            set { var nbr = value; }
        }
        public IEnumerator GetEnumerator()//迭代器
        {
            for (int i = 0; i < 10; i++)
            {
                yield return i;
            }
        }

        //async & await C# 5.0
        async void TestAsync(
            //调用方信息 C# 5.0
            [System.Runtime.CompilerServices.CallerMemberName]string memberName = "调用方的方法或属性名称",
            //源文件中调用方法的行号
            [System.Runtime.CompilerServices.CallerLineNumber]int lineNumber = 0,
            [System.Runtime.CompilerServices.CallerFilePath]string filePath = "调用方的源文件的路径")
        {
            try//尝试捕获异常
            {
                await Task.FromResult(0);
            }
            catch (Exception ex) when (DateTime.Now == DateTime.Now)//捕获 Exception 类型的异常 when 为条件
            {
                throw;//抛出异常
            }
            finally
            {
                //一定会执行，通常在这里释放非托管资源
            }
            //using 语句 === try finally
            using (var x = new StreamReader(""))
            {

            }
        }
        /// <summary>
        /// 析构函数
        /// </summary>
        ~Class1() { }
    }
    //partial 分部类，可分散在多个文件中
    partial class ClassA { }
    partial class ClassA { }

    /// <summary>
    /// 扩展方法必须在静态类中
    /// </summary>
    public static class ExtendFunction
    {
        /// <summary>
        /// 静态构造函数，只初始化一次
        /// </summary>
        static ExtendFunction()
        {
            //扩展方法只是语法糖，编译时会变成 Class.Method(param) 的形式
            global::System.Int32 nbr = "3".MyToInt();//global::从全局开始查找
        }
        //扩展方法（只能在静态类中）
        public static int MyToInt(this string str)
        {
            return int.Parse(str);
        }
    }
}

```

## 链接

- [C#历史](https://docs.microsoft.com/zh-cn/dotnet/csharp/whats-new/csharp-version-history)