// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RiseOrderIntent {
    struct Intent {
        string market;
        bool buy;
        uint256 price;
        uint256 size;
        address trader;
        uint256 blockNumber;
    }

    Intent public latestIntent;
    uint256 public totalIntents;

    event IntentSubmitted(
        address indexed trader,
        string market,
        bool buy,
        uint256 price,
        uint256 size,
        uint256 totalIntents
    );

    function submitIntent(
        string calldata market,
        bool buy,
        uint256 price,
        uint256 size
    ) external {
        require(bytes(market).length > 0, "market required");
        require(price > 0, "price = 0");
        require(size > 0, "size = 0");

        latestIntent = Intent({
            market: market,
            buy: buy,
            price: price,
            size: size,
            trader: msg.sender,
            blockNumber: block.number
        });

        totalIntents += 1;
        emit IntentSubmitted(msg.sender, market, buy, price, size, totalIntents);
    }
}
