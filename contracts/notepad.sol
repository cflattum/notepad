//chris flattum May 6th, 2022 
// ________/\\\\\__/\\\\\\_________________________________________________________________________________        
//  ______/\\\///__\////\\\_________________________________________________________________________________       
//   _____/\\\_________\/\\\_______________________/\\\__________/\\\________________________________________      
//    __/\\\\\\\\\______\/\\\_____/\\\\\\\\\_____/\\\\\\\\\\\__/\\\\\\\\\\\__/\\\____/\\\____/\\\\\__/\\\\\___     
//     _\////\\\//_______\/\\\____\////////\\\___\////\\\////__\////\\\////__\/\\\___\/\\\__/\\\///\\\\\///\\\_    
//      ____\/\\\_________\/\\\______/\\\\\\\\\\_____\/\\\_________\/\\\______\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_   
//       ____\/\\\_________\/\\\_____/\\\/////\\\_____\/\\\_/\\_____\/\\\_/\\__\/\\\___\/\\\_\/\\\__\/\\\__\/\\\_  
//        ____\/\\\_______/\\\\\\\\\_\//\\\\\\\\/\\____\//\\\\\______\//\\\\\___\//\\\\\\\\\__\/\\\__\/\\\__\/\\\_ 
//         ____\///_______\/////////___\////////\//______\/////________\/////_____\/////////___\///___\///___\///__


//import 
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol"

pragma solidity ^0.8.0;


//so
//structure is IPFS link to metadata files for NFT's, with IFPS link to display image inside that metadata.
//could either:  1. replace metadata file every time someone changes the photo. Not impossible. 
//would be best that they have to sign some sort of transaction.. good to make people pay gas to change for sexurity

//think will need to change JSON file every time the image is change
//need to generate new JSON with new image file in it every time after i upload to IPFS... then need to
//change the URI for the token in the contract 



contract notepad is ERC721, Ownable {
    using SafeMath for uint;

    uint256 public _maxSupply = 1000;
    uint256 public _maxMintAmount = 5;
    uint256 public _cost = 0.001; //test cost

    address private localBaseURI;

    mapping(address => bool) whitelist;
    mapping(uint => bytes32) uriMap;

    constructor() ERC721("notepad","PAD"){
        
    }

    function mintPad(address _to, uint _count, uint maxSupply, uint maxMintAmount) external payable {
        require(totalSupply() + _count <= _maxSupply, "max supply reached");
        require(_count < _maxMintAmount, "minting too many");
        require(_count > 0,"");
        //require()

        

    }

    function changeMetadata(bytes32 ipfsHash, uint token_id) onlyTokenOwner {

    }

    function changeTokenURI(bytes32 ipfsHash, uint token_id) onlyTokenOwner {
        require(balanceOf(msg.sender) >= 1); //require that has a token
        require(_exists(token_id));
        //changes the URI of the token to the new ipfs hash we passed in.
        uriMap[token_id] = ipfsHash;
    }

    function setURIMap(){}

    function setBaseURI(string memory baseURI_) external onlyOwner() {
        localBaseURI = baseURI_;
    }

    function _baseURI() internal view returns (string memory){
        return localBaseURI;
    }

    function finishDrawing() {

    }

    modifier onlyTokenOwner(uint token_id) {
        require(msg.sender.ownerOf(token_id));
        _;
    }
    
}