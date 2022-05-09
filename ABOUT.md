# stackmate 

stackmate is a bitcoin descriptor wallet made by bitcoiners for everyone.

within open source wallet software research & development, stackmate finds its place through a primary focus on simplicity.. 

simplicity here is for:

- users: through friendly application interface design; users have an intuitive experience with money.
- developers: through use of simple, tried and tested coding patterns and practices; devs find it easy to understand and 
contribute to the project.

# features

## Single Signature Wallets

The entry point into bitcoin is the single signature wallet. 

stackmate provides the classic interface that we all know and love.

stackmate provides a helpful recovery tool that supports recovery from:

- descriptors
- extended keys
- mnemonics

stackmate supports other handy features such as rbf and batch send.

stackmate also supports watch-only wallets (cold card pair).

## Broadcaster

stackmate supports broadcasting psbt's as a standalone tool (cold card pair). 

## Electrum Backend

stackmate requires an electrum backend to interact with the bitcoin network.

stackmate allows users to use their own node or defaults to blockstream.

## Tor

stackmate comes bundled with tor for network level privacy.

This is especially important if you are not using your own node..

## Script Signature Wallets

stackmate supports the creation and complete management of 3 types of bitcoin scripts:

1. Inheritance: 1/2 w/timelocked
2. Escrow: 2/3 multisig
3. Team: n/7 multisig

### Script Recovery 

It is also possible to recover arbitraty scripts, as long as they are in the descriptor format. Additionally, to move funds
out of such a wallet all the minimum private keys will need to be present - either within the descriptor or imported in
addition to the descriptor.

## E2EE Comms

script wallets that involve more than one party have always faced a problem with synchronization.

Synchronization is primarily required for two operational processes:

1. Wallet Creation:

All parties must submit their portion of the script, usually their public keys, and agree on the final definition of the 
script.

2. Transaction: 

To make a transaction, all the required members must present their portion of the script satisfied, usually done by 
passing a psbt for successive signatures until it is finalized; after which it can be broadcasted.

stackmate facilitates sync for the above two process by providing an e2ee message posting service (cypherpost) which will 
allow parties in a script to easily share wallet data and stay in sync with each other.

For natively created scripts, all script wallets have their own respective cypherpost group chat.



