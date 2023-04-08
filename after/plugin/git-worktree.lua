require("telescope").load_extension("git_worktree")

local Worktree = require("git-worktree")
local Job = require("plenary.job")

Worktree.on_tree_change(function(op, metadata)
    if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    end
end)
