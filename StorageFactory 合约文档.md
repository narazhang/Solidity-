下面是根据 Solidity 代码生成的 Markdown 文件内容：

# StorageFactory 合约文档

## 一、合约概述

`StorageFactory` 是一个部署在以太坊区块链上的智能合约，它的主要功能是创建和管理 `SimpleStorage` 合约的实例。通过该工厂合约，用户可以便捷地部署多个 `SimpleStorage` 合约，并且能对这些实例进行引用和交互。

## 二、合约结构

此合约包含以下关键部分：

1. **版本声明**：该合约使用的 Solidity 版本为 0.8.18。
2. **导入语句**：从 `./SimpleStorage.sol` 文件中导入了 `SimpleStorage` 合约。
3. **状态变量**：合约中有一个公开的状态变量 `simpleStorage`，其类型为 `SimpleStorage`，用于保存 `SimpleStorage` 合约的实例地址。
4. **函数定义**：提供了 `createSimpleStorageContract` 函数，用于部署新的 `SimpleStorage` 合约实例。

## 三、函数说明

### createSimpleStorageContract()

- **功能**：部署一个新的 `SimpleStorage` 合约实例，并将该实例的地址存储在 `simpleStorage` 状态变量中。
- **可见性**：该函数为公开函数，外部账户和合约都可以调用。
- **参数**：此函数不接受任何参数。
- **返回值**：函数没有返回值。
- **注意事项**：每次调用该函数都会创建一个新的 `SimpleStorage` 合约实例，不过 `simpleStorage` 变量只会保存最后一次创建的实例地址。若需要跟踪所有创建的实例，需对合约进行修改，例如使用数组来存储所有实例的地址。

## 四、使用方法

1. **部署 `StorageFactory` 合约**：首先要将 `StorageFactory` 合约部署到以太坊网络。
2. **创建 `SimpleStorage` 实例**：调用 `createSimpleStorageContract` 函数，以部署新的 `SimpleStorage` 合约。
3. **访问 `SimpleStorage` 实例**：通过 `simpleStorage` 变量获取最新创建的 `SimpleStorage` 合约地址，进而与该实例进行交互。

## 五、示例代码

下面展示如何与 `StorageFactory` 合约进行交互：

```solidity
// 部署 StorageFactory 合约
StorageFactory factory = new StorageFactory();

// 创建新的 SimpleStorage 合约实例
factory.createSimpleStorageContract();

// 获取最新的 SimpleStorage 合约地址
SimpleStorage simpleStorage = factory.simpleStorage();

// 与 SimpleStorage 合约进行交互
simpleStorage.store(42); // 存储一个值
uint256 value = simpleStorage.retrieve(); // 检索存储的值
```

## 六、依赖关系

该合约依赖于 `SimpleStorage` 合约，`SimpleStorage` 合约至少应包含以下接口：

```solidity
contract SimpleStorage {
    function store(uint256 num) public;
    function retrieve() public view returns (uint256);
}
```

## 七、注意事项

1. 当前合约设计只能跟踪最后一个创建的 `SimpleStorage` 实例。若需要管理多个实例，建议添加一个数组来存储所有创建的合约地址。
2. 部署合约需要消耗以太坊网络的 Gas，因此请确保账户有足够的 ETH 来支付交易费用。
3. 该合约使用的是 Solidity 0.8.18 版本，部署时请确保开发环境与此版本兼容。
