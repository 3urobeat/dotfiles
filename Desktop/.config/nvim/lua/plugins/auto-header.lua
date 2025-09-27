return {
    "VincentBerthier/auto-header.nvim",
    config = function()
        require("auto-header").setup {
            -- if true, a header will automatically be added when a file is first saved
            create = true,
            -- if true, some fields of the existing header will be updated
            update = true,
            -- languages for which the plugin is enabled. To enable it to all files, add "*"
            languages = { "js" },
            -- The keybinding to use (in normal mode only) that will add or refresh the header
            -- Note that it will ignore the create / update parameters specified above, but
            -- will still require a valid template and project information.
            key = nil,
            -- The templates to use to create the headers, one by language ("*" will be used if no specific one was found)
            -- The language is determined by neovim’s buffer filetype.
            templates = {
                {
                    -- The language for which this template applies
                    language = "*",
                    -- The prefix of each line of the header ("auto" is allowed, the buffer’s commentstring will then be used)
                    prefix = "auto",
                    -- If block and block_length are both set, the header will take the form of a block
                    block = "-",
                    block_length = 0,
                    -- Lines to add before the header
                    before = {},
                    -- Lines to add after the header
                    after = { "" },
                    -- The comment lines of the buffer
                    -- Some fields preceded by # will be set if known or given
                    template = {
                        "File: #file_name",
                        "Project: #project_name",
                        "Created Date: #date_now",
                        "Author: 3urobeat",
                        "",
                        "Last Modified: #date_now",
                        "Modified By: 3urobeat",
                        "",
                        "Copyright (c) #year 3urobeat <https://github.com/3urobeat>",
                        "",
                        "This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.",
                        "This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.",
                        "You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.",
                    },
                    -- All the lines beginning with these patterns will be updated
                    track_change = {
                        "File: ",
                        "Last Modified: ",
                        "Modified By: ",
                        "Copyright ",
                    },
                },
            },
        }
    end,
}
