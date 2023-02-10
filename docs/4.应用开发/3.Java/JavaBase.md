# Java 基础

## 基础

- final 构建对象时必须初始化
- java 中没有引用传递
- instanceof 是否是某个类的实例
- Object.equals()
  - 自反性 x.equals(x) -> true，当 x != null
  - 对称性 x.equals(y) == y.equals(x)
    - 一般使用 getClass()
    - 如果使用 instanceof，则应将类标记为 final
  - 传递性 x.equals(y) == y.equals(z) == z.equals(x)
  - 一致性 多次 x.equals(y) 结果一样
  - x.equals(null) -> false，当 x != null
- 重载 equals() 时也要重载 hashCode()，此时可以用于散列表
  - 使用 Objects.has(...) 获取多个字段的散列码