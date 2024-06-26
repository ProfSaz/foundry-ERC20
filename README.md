# Foundry ERC20 Contract

This is a simple ERC20 token smart contract developed using Foundry. This contract allows anyone to deploy a basic ERC20 token with a specified total supply.

## Table of Contents

1. [Installation](#installation)
2. [Usage](#usage)
    - [Deploy](#deploy)
    - [Test](#test)
    - [Test Coverage](#test-coverage)
3. [Environment Variables](#environment-variables)
4. [Features](#features)
5. [Deploying to a testnet or mainnet](#deploying-to-a-testnet-or-mainnet)
6. [Interactions](#interactions)
7. [Estimate Gas](#estimate-gas)
8. [Formatting](#formatting)
9. [Contact](#contact)

## Installation

To get started, clone the repository and install the dependencies.

```bash
# Clone the repository
git clone https://github.com/ProfSaz/foundryERC20.git

# Navigate to the project directory
cd foundryERC20

# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install dependencies using foundry
forge install
```

## Usage

### Deploy 

```bash

forge script script/DeployOurToken.s.sol

```

### Test

To run a general test for this project use the following command 

```bash 

forge test

```

To run very specific test, use the matching test command with the name of the function you want to test

```bash 

forge test --mt testFunctionName

```
### Test Coverage

To check how much test coverage you have in the project 

```bash 

forge coverage

```

## Environment Variables 

This project uses environment variables to manage sensitive information. Create a `.env` file in the root directory of your project based on the provided `.env.example` file.

```bash 

PRIVATE_KEY=XXXXXXXXX
RPC_URL=http://0.0.0.0:8545
ETHERSCAN_API_KEY=XXXX

```

## Features

- ERC20 compliant token with symbol `OT` and name `OurToken`
- Initial supply of tokens minted to the deployer's address
- Built using OpenZeppelin's well audited contracts 

## Deploying to a Testnet or Mainnet 

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

2. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

3. Deploy

```bash 
forge script script/DeployOurToken.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY

```

## Interactions

After deploying to a testnet or local net, you can interact with the contract either by using `cast` or by using the the scripts 

Using cast deployed locally example 

```bash 

cast send <ERC20_CONTRACT_ADDRESS> "transfer()" --value 0.01ether --private-key <PRIVATE_KEY> --rpc-url $SEPOLIA_RPC_URL

```

## Estimate gas

You can estimate how much gas things cost by running:

```bash
forge snapshot
```

And you'll see an output file called `.gas-snapshot`


## Formatting


To run code formatting:
```bash
forge fmt
```

## Contact

If you appreciated this, feel free to follow me 

[![ProfSaz Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/Prof_Saz)
[![ProfSaz Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joshua-Osemwegie-2a9080191)





