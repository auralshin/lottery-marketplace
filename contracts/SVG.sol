// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./Base64Lib.sol";

contract SVG {
    using Strings for uint256;

    function generateSVG(
        address user,
        string memory lotteryId,
        string memory ticketId,
        string[6] memory numbers
    ) external pure returns (string memory svg) {
        return
            string(
                Base64.encode(
                    abi.encodePacked(
                        generateTop(),
                        generateBottom(),
                        numbers[0],
                        " ",
                        numbers[1],
                        " ",
                        numbers[2],
                        " ",
                        numbers[3],
                        " ",
                        numbers[4],
                        " ",
                        numbers[5],
                        " ",
                        '</text><text class="cls-19" transform="translate(19.8 495.68)">',
                        toAsciiString(user),
                        '</text><text class="cls-19" transform="translate(19.8 471.87)"><tspan xml:space="preserve">Ticket ID:      ',
                        ticketId,
                        '</tspan></text><text class="cls-19" transform="translate(19.8 449.1)"><tspan xml:space="preserve">Draw num:        ',
                        lotteryId,
                        "</tspan></text></g></svg>"
                    )
                )
            );
    }

    function generateTop() internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512">',
                    "<defs><style>.cls-1{fill:none;}.cls-2{fill:#2e3192;}.cls-3{fill:#ffca0d;}.cls-4{opacity:0.41;}.cls-19,.cls-5,",
                    ".cls-6{fill:#fff;}.cls-6{opacity:0.48;}.cls-7{fill:#042e71;}.cls-8{clip-path:url(#clip-path);}.cls-9{fill:#fbb03b;}",
                    ".cls-10{fill:#ed1c24;}.cls-11{fill:#009245;}.cls-12{font-size:29.79px;font-family:ArialMT, Arial;letter-spacing:",
                    "0.04em;}.cls-13{letter-spacing:0.02em;}.cls-14{letter-spacing:0.04em;}.cls-15{letter-spacing:0.02em;}.cls-16{font-",
                    "size:35.44px;fill:#002168;font-family:Arial-BoldMT, Arial;font-weight:700;letter-spacing:0.04em;}.cls-17",
                    "{letter-spacing:0.02em;}.cls-18{font-size:46.24px;}.cls-18,.cls-19{font-family:CourierNewPSMT, Courier New;}.",
                    'cls-19{font-size:19.04px;}</style><clipPath id="clip-path"><circle class="cls-1" cx="379.06" cy="216.43" r="29.1"/',
                    '></clipPath></defs><g id="nft"><rect id="BackGround" class="cls-2" width="512" height="512"/><path class="cls-3" ',
                    'd="M48,375.4H37.51c-15.45,0-27.08-9.71-26-21.69l.41-4.45c14.63,0,27.46-12,28.66-26.78S31.14,295.7,16.82,295.7l1.58-',
                    "17.14c14.21,0,26.69-12,27.87-26.78S37.19,225,23.29,225l1.58-17.15c13.78,0,25.91-12,27.11-26.78,1.18-14.62-8.54-26.",
                    "49-21.78-26.75,3.1-10.09,14.07-17.73,26.45-17.73H451.47c12.38,0,23.48,7.64,26.75,17.73-13.22.26-22.73,12.13-21.28,",
                    "26.75,1.45,14.79,13.8,26.78,27.57,26.78L486.4,225c-13.9,0-24,12-22.51,26.78s14.14,26.78,28.35,26.78l1.88,17.14c-14",
                    '.32,0-24.74,12-23.28,26.78s14.48,26.78,29.11,26.78l.5,4.45c1.3,12-10.17,21.69-25.61,21.69H460"/><g id="Light" ',
                    'class="cls-4"><path class="cls-5" d="M395.72,358.88H110.56c-16.38,0-28.41-13.27-26.89-29.65L97.33,182.77c1.53-',
                    '16.38,14.83-29.66,29.71-29.66H386.13c14.88,0,27.74,13.28,28.72,29.66l8.75,146.46A27.61,27.61,0,0,1,395.72,358.88Z"/>',
                    '<path class="cls-1" d="M395.72,358.88H110.56c-16.38,0-28.41-13.27-26.89-29.65L97.33,182.77c1.53-16.38,14.83-29.66',
                    ',29.71-29.66H386.13c14.88,0,27.74,13.28,28.72,29.66l8.75,146.46A27.61,27.61,0,0,1,395.72,358.88Z"/></g><rect id=',
                    '"Numbers_slot" data-name="Numbers slot" class="cls-6" x="99.6" y="298.24" width="312.81" height="46.39" rx="20.15"/>',
                    '<g id="Logo-2" data-name="Logo"><path class="cls-5" d="M379.06,184.58a31.85,31.85,0,1,0,31.84,31.85A31.88,31.88,0,',
                    '0,0,379.06,184.58Zm0,62.74A30.9,30.9,0,1,1,410,216.43,30.93,30.93,0,0,1,379.06,247.32Z"/><path class="cls-7" ',
                    'd="M410,216.43a30.9,30.9,0,1,1-30.9-30.9A30.93,30.93,0,0,1,410,216.43Z"/><g class="cls-8"><circle class="cls-9"'
                )
            );
    }

    function generateBottom() internal pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    ' cx="381.03" cy="203.91" r="20.47"/><path class="cls-7" d="M381,225.22a21.31,21.31,0,1,1,21.31-21.31A21.33,21.',
                    '33,0,0,1,381,225.22Zm0-40.93a19.62,19.62,0,1,0,19.62,19.62A19.64,19.64,0,0,0,381,184.29Z"/><circle class="cls-5"',
                    ' cx="375.07" cy="202.73" r="12.33"/><path class="cls-7" d="M375.07,215.27a12.55,12.55,0,1,1,12.55-12.54A12.56,12.56,',
                    '0,0,1,375.07,215.27Zm0-24.67a12.13,12.13,0,1,0,12.13,12.13A12.14,12.14,0,0,0,375.07,190.6Z"/><path class="cls-7" ',
                    'd="M380.64,199.57l-1.2,4.07a5.13,5.13,0,0,1-.77,1.61,3.48,3.48,0,0,1-1.16,1,3.72,3.72,0,0,1-1.5.42,5.41,5.41,0,0,',
                    "1-1.81-.24l-5.93-1.75.56-1.92,5.9,1.74a2.72,2.72,0,0,0,1.45.12,1.59,1.59,0,0,0,.92-.74l-4.58-1.35.54-1.82,4.68,",
                    '1.38.37-1.24-4.8-1.41a1.32,1.32,0,0,0-1.74.83l-1.89-.56q1.06-3.1,4.62-2.05Z"/><circle class="cls-10" cx="361.83" ',
                    'cy="223.28" r="21.1"/><path class="cls-7" d="M361.83,245.22a21.94,21.94,0,1,1,21.94-21.94A22,22,0,0,1,',
                    '361.83,245.22Zm0-42.19a20.25,20.25,0,1,0,20.26,20.25A20.27,20.27,0,0,0,361.83,203Z"/><circle class="cls-5" ',
                    'cx="355.69" cy="222.06" r="12.71"/><path class="cls-7" d="M355.69,235a12.92,12.92,0,1,1,12.93-12.92A12.93,12.93,0,0,1,',
                    '355.69,235Zm0-25.42a12.5,12.5,0,1,0,12.5,12.5A12.52,12.52,0,0,0,355.69,209.56Z"/><path class="cls-7" ',
                    'd="M349.25,222.13l6.74,2a1.39,1.39,0,0,0,1.07,0,1.66,1.66,0,0,0,.71-.8l-8.19-2.42.47-1.6c.69-2.34,2.31-3.14,',
                    '4.84-2.4l6.34,1.87-1.43,4.83q-1,3.52-4.84,2.4l-6.3-1.86Zm9.1-.71.38-1.28-4.86-1.43a1.37,1.37,0,0,0-1.79.86Z"/>',
                    '<circle class="cls-11" cx="396.37" cy="228.14" r="19.88"/><path class="cls-7" d="M396.37,248.85a20.71,20.71,0,0,',
                    '1-14.74-35.28h0a20.72,20.72,0,1,1,14.74,35.28Zm-13.54-34.1h0a19,19,0,1,0,26.92-.16A18.9,18.9,0,0,0,382.83,214.75Z"/>',
                    '<circle class="cls-5" cx="401.3" cy="231.38" r="11.98"/><path class="cls-7" d="M401.29,243.57a12.18,12.18,0,0,',
                    '1-8.67-20.76l.15.15-.15-.15a12.19,12.19,0,1,1,8.67,20.76Zm0-24h-.07a11.84,11.84,0,1,0,.07,0Z"/><path class="cls-7" ',
                    'd="M406.89,234l-5.38-5.52-.9.88,5.42,5.55L404.91,236c-1.65,1.61-3.34,1.52-5.09-.27l-4.12-4.22,1.4-1.36,4.41,4.52a1.38,',
                    '1.38,0,0,0,.89.47,1.53,1.53,0,0,0,1-.33L398,229.3l3.59-3.51,6.71,6.87Z"/></g></g><text id="Lottery_Name" ',
                    'data-name="Lottery Name" class="cls-12" transform="translate(106.14 207.32) scale(1.37 1)">ANYLOT<tspan class="cls-13" ',
                    'x="126.35" y="0">T</tspan><tspan x="145.2" y="0">O</tspan><tspan class="cls-14"><tspan x="12.45" y="35">LOTTE</tspan>',
                    '<tspan class="cls-15" x="114.42" y="35">RY</tspan></tspan></text><text class="cls-16" transform="translate(14.49 50.78) ',
                    'scale(1.37 1)">ANYLOT<tspan class="cls-17" x="154.18" y="0">T</tspan><tspan x="176.6" y="0">O SQUAD</tspan></text><text ',
                    'class="cls-18" transform="translate(103.39 336.2)">'
                )
            );
    }

    function toAsciiString(address x) internal pure returns (string memory) {
        bytes memory s = new bytes(40);
        for (uint256 i = 0; i < 20; i++) {
            bytes1 b = bytes1(uint8(uint256(uint160(x)) / (2**(8 * (19 - i)))));
            bytes1 hi = bytes1(uint8(b) / 16);
            bytes1 lo = bytes1(uint8(b) - 16 * uint8(hi));
            s[2 * i] = char(hi);
            s[2 * i + 1] = char(lo);
        }
        return string(s);
    }

    function char(bytes1 b) internal pure returns (bytes1 c) {
        if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
        else return bytes1(uint8(b) + 0x57);
    }
}
