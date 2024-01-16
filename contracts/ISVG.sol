// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISVG {
    function generateSVG(
        address user,
        string memory lotteryId,
        string memory ticketId,
        string[6] memory numbers
    ) external pure returns (string memory svg);
}
