// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ErrorHandling {
    address public owner;
    uint[] public assets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function acquireAsset(uint _assetId) public onlyOwner {
        // Using require to check number of assests
        require(assets.length <= 5, "Max. no. of assets owned");

        // Using assert to check valid value
        assert(_assetId > 0);

        for (uint i = 0; i < assets.length; i++) {
            if (assets[i] == _assetId) {
                // Value is present in the array
                revert("Cannot acquire, asset already owned");
            }
        }
        // Updating the value if all checks pass
        assets.push(_assetId);
    }
}
