// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PhraseToHex {
    function convert(string memory input) public pure returns (bytes memory output) {
        bytes memory inputBytes = bytes(input);
        output = new bytes(2 + (inputBytes.length * 2));
        output[0] = 0x78; // 0x78 = x
        output[1] = 0x30; // 0x30 = 0
        for (uint i = 0; i < inputBytes.length; i++) {
            uint8 b = uint8(inputBytes[i]);
            output[(i * 2) + 2] = hexDigit(b / 16);
            output[(i * 2) + 3] = hexDigit(b % 16);
        }
    }

    function hexDigit(uint8 input) private pure returns (bytes1) {
        if (input < 10) {
            return bytes1(input + 48);
        } else {
            return bytes1(input + 87);
        }
    }
}
