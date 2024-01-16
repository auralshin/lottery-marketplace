// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Base64Lib.sol";
import "./ISVG.sol";

contract LotteryNFT is ERC721, Ownable {
    using Strings for uint256;

    struct Position {
        uint256 _lotteryId;
        uint256 _ticketId;
        uint32 _thisTicketNumber;
        address _user;
    }

    mapping(uint256 => Position) private _tokenURIs;

    ISVG SVG;

    constructor(address _SVGLibrary) ERC721("", "") {
        SVG = ISVG(_SVGLibrary);
    }

    function updateSVGContract(address _contract) external onlyOwner {
        require(_contract != address(0), "Contract address cannot be zero");
        SVG = ISVG(_contract);
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory uri) {
        require(_exists(tokenId), "URI query for nonexistent token");
        Position memory position = _tokenURIs[tokenId];
        string memory lotteryId = position._lotteryId.toString();
        string memory ticketId = position._ticketId.toString();
        string[6] memory numbers;
        numbers[0] = uint256((position._thisTicketNumber / 100000) % 10).toString();
        numbers[1] = uint256((position._thisTicketNumber / 10000) % 10).toString();
        numbers[2] = uint256((position._thisTicketNumber / 1000) % 10).toString();
        numbers[3] = uint256((position._thisTicketNumber / 100) % 10).toString();
        numbers[4] = uint256((position._thisTicketNumber / 10) % 10).toString();
        numbers[5] = uint256(position._thisTicketNumber % 10).toString();
        string memory image = SVG.generateSVG(position._user, lotteryId, ticketId, numbers);
        uri = string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"Project Lottery #',
                            lotteryId,
                            '","description":"Ticket #',
                            ticketId,
                            '","image":"data:image/svg+xml;base64,',
                            image,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function _setPosition(uint256 tokenId, Position memory position) internal virtual {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = position;
    }

    function mint(
        uint256 _lotteryId,
        uint256 _ticketId,
        uint32 thisTicketNumber,
        address user
    ) internal {
        _mint(user, _ticketId);
        _setPosition(_ticketId, Position(_lotteryId, _ticketId, thisTicketNumber, user));
    }

    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);
    }
}
