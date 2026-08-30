// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AbstractCreatorWall {
    struct Post {
        address author;
        string message;
        uint256 timestamp;
        uint256 likes;
    }

    Post[] private posts;
    mapping(uint256 => mapping(address => bool)) public hasLiked;

    event PostPublished(uint256 indexed postId, address indexed author, string message);
    event PostLiked(uint256 indexed postId, address indexed liker, uint256 totalLikes);

    function publish(string calldata message) external returns (uint256 postId) {
        uint256 length = bytes(message).length;
        require(length > 0, "empty message");
        require(length <= 280, "message too long");

        postId = posts.length;
        posts.push(
            Post({
                author: msg.sender,
                message: message,
                timestamp: block.timestamp,
                likes: 0
            })
        );

        emit PostPublished(postId, msg.sender, message);
    }

    function likePost(uint256 postId) external {
        require(postId < posts.length, "post not found");
        require(!hasLiked[postId][msg.sender], "already liked");

        hasLiked[postId][msg.sender] = true;
        posts[postId].likes += 1;

        emit PostLiked(postId, msg.sender, posts[postId].likes);
    }

    function getPost(uint256 postId) external view returns (Post memory) {
        require(postId < posts.length, "post not found");
        return posts[postId];
    }

    function totalPosts() external view returns (uint256) {
        return posts.length;
    }
}
