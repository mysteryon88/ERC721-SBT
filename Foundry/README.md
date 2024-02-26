# Soulbound Token in Foundry

The solmate library is taken as a basis. 

Cut out all the transfer functions.

## Usage

### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Gas Snapshots

```shell
forge snapshot
```

### Anvil

```shell
anvil
```

### Deploy

```shell
forge create --rpc-url <your_rpc_url> --private-key <your_private_key> src/SBT.sol:Soulbound

# or Deploy and Verifying
ource .env
forge script script/SBT.s.sol:SoulboundScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```

### Help

```shell
forge --help
anvil --help
cast --help
```
