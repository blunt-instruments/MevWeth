# MevWeth

- MevWeth: A Weth10 variant that allows users to create explicit MEV.
- Mevitize: A simple, inheritable contract for adding Mev to transaction using
  MevWeth

THIS IS UNAUDITED CODE. USE AT YOUR OWN RISK

## What is explicit MEV?

Explicit MEV is MEV that is produced intentionally, to achieve a specific
result. In order to simplify & standardize this process, it's useful to have a
separate accounting system. I.e. to separate funds that ought be used for
explicit MEV from funds that ought not be. This allows contracts and users to
operate normally, while delegating intentional MEV creation to another system.

In other words, a lending market could use `MevWeth` to add MEV to a Weth market, without having to worry about mixing its MevWeth with its Weth.

### Addresses

- MevWeth: `0x00000000008C43efC014746c230049e330039Cb3`

## FAQ:

### Why would someone produce explicit MEV?

Why indeed? Here are a few cases where MEV could be used to automate
transactions:

- My lending protocol needs to be poked to calculate its interest properly.
- My on-chain oracle needs to be updated every so often
- I don't want to figure out what the current priority fee is
- I have a tx that must be broadcast on a specific schedule, but I won't be
  online to do it
- I am making a big slippery AMM trade, and I want to add -25,000 gwei MEV, so
  that I get some of my slippage back

#### Is MevWeth maintained?

Not really. It's a static deployment. The code will not be updated or upgraded.
The `Mevitize` base contract is maintained, may be updated in the future.

#### Is MevWeth audited?

No, and there is no plan to audit it.

#### Are there tests for MevWeth?

No. But there probably will be soon. Next time I have some free time. Or you can
open a pull request!

#### How is MevWeth licensed?

`MevWeth` is a derivative work of `WETH10`, and is released solely under the
GPLv3 license. Derivates of `MevWeth` must be released under the same license.

`Mevitize` and the `IMevWeth` interface are licensed under the user's choice of
GPLv3, MIT, or Apache2.0. These ARE NOT derivative works of `WETH10`. If you
wish to call `MevWeth` from other contracts, but do not need its bytecode or
non-MEV interface, consider using `IMevWeth` or inheriting `Mevitize`.

#### What chains is MevWeth on?

- Ethereum mainnet

#### I want MevWeth on my chain!

`MevWeth` uses forge to deploy. It can be used on any chain where the forge
create2 deployer exists. Just run `forge script DeployMevWeth`, and add your
signer info.

If the create2factory is not deployed on your chain, here are the instructions!

1.  Fund the create2factory deployer (don't really use 0.5 ether probably)

- `$ cast send --value 0.5ether 0x3fab184622dc19b6109349b94811493bf2a45362`

2. Deploy the create2factory

- `cast publish 0xf8a58085174876e800830186a08080b853604580600e600039806000f350fe7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf31ba02222222222222222222222222222222222222222222222222222222222222222a02222222222222222222222222222222222222222222222222222222222222222`

3. Continue with your life :)
