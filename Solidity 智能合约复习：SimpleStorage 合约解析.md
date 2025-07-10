# SimpleStorage 合约学习笔记

## 合约概述

- **用途**：基础数据存储与检索
- **版本**：Solidity ^0.8.17
- **功能**：
  - 存储/读取单个数字
  - 管理人员信息（数字 + 名称）
  - 名称与数字映射查询

## 完整合约代码

```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract SimpleStorage{

    uint256 public favoriteNumber;

    struct Person{
        uint256 myFavoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    // 根据对应的键值对 string 找到uint256 zl => 23
    mapping (string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        favoriteNumber = favoriteNumber + 1;
    }

    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
```

## 数据结构详解

### 1. 状态变量

```solidity
uint256 public favoriteNumber;
Person[] public listOfPeople;
mapping(string => uint256) public nameToFavoriteNumber;
```

- **favoriteNumber**：存储单个数值
- **listOfPeople**：动态数组，存储 Person 结构体
- **nameToFavoriteNumber**：字符串到数字的映射

### 2. 结构体

```solidity
struct Person {
    uint256 myFavoriteNumber;
    string name;
}
```

- 封装人员信息：数字 + 名称

## 核心函数

### 1. 存储数字

```solidity
function store(uint256 _favoriteNumber) public {
    favoriteNumber = _favoriteNumber;
    favoriteNumber = favoriteNumber + 1;
}
```

**操作**：

- 存储输入数字
- 将存储值加 1
- **示例**：`store(23)` → 实际存储 24

### 2. 检索数字

```solidity
function retrieve() public view returns (uint256) {
    return favoriteNumber;
}
```

**特性**：

- `view`修饰符：只读操作，不消耗 gas
- 返回当前存储的数字

### 3. 添加人员

```solidity
function addPerson(string memory _name, uint256 _favoriteNumber) public {
    listOfPeople.push(Person(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber;
}
```

**操作**：

- 添加人员到数组
- 建立名称到数字的映射
- **示例**：`addPerson("Alice", 42)`
  - `listOfPeople[0]` → Alice, 42
  - `nameToFavoriteNumber["Alice"]` → 42

## 关键语法

### 1. 动态数组操作

```solidity
listOfPeople.push(Person(_favoriteNumber, _name));
```

- 使用`push()`方法添加元素
- 数组长度自动增长

### 2. 映射赋值

```solidity
nameToFavoriteNumber[_name] = _favoriteNumber;
```

- 类似字典操作，通过键存储值

### 3. 函数修饰符

- `public`：公开可访问
- `view`：只读不写
- `memory`：临时存储字符串参数

## 交互示例

### 存储数字：

```
store(100)
retrieve() → 101
```

### 添加人员：

```
addPerson("Bob", 7)
listOfPeople(0) → (7, "Bob")
nameToFavoriteNumber("Bob") → 7
```

### 组合操作：

```
store(5)
addPerson("Charlie", retrieve())
nameToFavoriteNumber("Charlie") → 6
```

## 注意事项

- **数值自动加 1**：`store`函数会修改输入值
- **映射唯一性**：同名添加会覆盖旧值
- **存储成本**：添加人员会增加合约存储开销
- **数组索引**：从 0 开始，动态增长

## 常见问题

**Q**：如何查询特定人员？  
**A**：使用映射：`nameToFavoriteNumber["Name"]`

**Q**：能否修改已添加人员？  
**A**：需添加额外函数实现，当前合约不支持

**Q**：映射和数组的区别？  
**A**：

- 映射：键值对，快速查询
- 数组：有序集合，支持遍历
