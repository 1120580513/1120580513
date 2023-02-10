# 算法

### 堆排序

## 查找

### 二分查找

```csharp
var n = arr.Length;
var lo = 0;
var hi = n - 1;
while (lo <= hi)
{
    var mid = lo + (hi - lo) / 2;
    if (nbr > arr[mid]) lo = mid + 1;
    else if (nbr < arr[mid]) hi = mid - 1;
    else return mid;
}
return -1;
```

> 一般情况下二分查找比顺序查找要快的多

### 符号表

### 平衡查找树

### 散列表

## 图

### 无向图

### 有向图

### 最小生成树

### 最短路径

## 字符串

### 字符串排序

### 单词查找树

### 子字符串查找

### 正则表达式

### 数据压缩

## 动态规划
