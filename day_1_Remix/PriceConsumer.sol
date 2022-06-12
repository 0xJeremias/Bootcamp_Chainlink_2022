// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
     * Network: Rinkeby
     * Aggregator: LINK/USD
     * Address: 0xd8bD0a1cB028a31AA859A21A3758685a95dE4623
     * Network: Rinkeby
     * Aggregator: TRX/USD
     * Address: 00xb29f616a0d54FF292e997922fFf46012a63E2FAe
     */
    constructor() public {
        priceFeed = AggregatorV3Interface(
            0xb29f616a0d54FF292e997922fFf46012a63E2FAe
        );
    }

    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int256) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }

    function getTimestamp() public view returns (uint256) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return timeStamp;
    }
}
