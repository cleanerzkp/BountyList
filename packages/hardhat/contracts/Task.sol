// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaskContract {
    struct Task {
        string name;
        string description;
        uint reward;
        bool isCompleted;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount;

    event TaskCompleted(uint indexed taskId);

    function createTask(string memory _name, string memory _description, uint _reward) public {
        tasks[taskCount] = Task(_name, _description, _reward, false);
        taskCount++;
    }

    function markTaskCompleted(uint _taskId) public {
        tasks[_taskId].isCompleted = true;
        emit TaskCompleted(_taskId);
    }
}