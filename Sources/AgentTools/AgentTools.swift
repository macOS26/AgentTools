import Foundation

/// Shared system prompt and tool definitions for all LLM providers.
/// ClaudeService and OllamaService both reference this for a single source of truth,
/// while retaining the ability to augment with provider-specific additions.
public enum AgentTools {

    // MARK: - Tool Name Constants (single source of truth)
    public enum Name {
        // File Manager (consolidated CRUDL)
        public static let fileManager = "file_tool"
        // Git (consolidated CRUDL)
        public static let git = "git_tool"
        // Legacy git names (handlers still work)
        public static let gitStatus = "git_status"
        public static let gitDiff = "git_diff"
        public static let gitLog = "git_log"
        public static let gitCommit = "git_commit"
        public static let gitDiffPatch = "git_diff_patch"
        public static let gitBranch = "git_branch"
        // Core Scripting
        public static let runApplescript = "run_applescript"
        public static let runOsascript = "run_osascript"
        public static let executeJavascript = "execute_javascript"
        // Shell Execution
        public static let executeAgentCommand = "user_shell_tool"
        public static let executeDaemonCommand = "root_shell_tool"
        public static let batchCommands = "batch_shell_tool"
        public static let batchTools = "multi_tool"
        public static let runShellScript = "shell_tool"
        // Task
        public static let taskComplete = "done_tool"
        // Accessibility (consolidated)
        public static let accessibility = "accessibility_tool"
        // Legacy ax names (handlers still work)
        public static let axListWindows = "ax_list_windows"
        public static let axInspectElement = "ax_inspect_element"
        public static let axGetProperties = "ax_get_properties"
        public static let axPerformAction = "ax_perform_action"
        public static let axCheckPermission = "ax_check_permission"
        public static let axRequestPermission = "ax_request_permission"
        public static let axTypeText = "ax_type_text"
        public static let axClick = "ax_click"
        public static let axScroll = "ax_scroll"
        public static let axPressKey = "ax_press_key"
        public static let axScreenshot = "ax_screenshot"
        public static let axGetAuditLog = "ax_get_audit_log"
        public static let axSetProperties = "ax_set_properties"
        public static let axFindElement = "ax_find_element"
        public static let axGetFocusedElement = "ax_get_focused_element"
        public static let axGetChildren = "ax_get_children"
        public static let axDrag = "ax_drag"
        public static let axWaitForElement = "ax_wait_for_element"
        public static let axShowMenu = "ax_show_menu"
        public static let axClickElement = "ax_click_element"
        public static let axWaitAdaptive = "ax_wait_adaptive"
        public static let axTypeIntoElement = "ax_type_into_element"
        public static let axHighlightElement = "ax_highlight_element"
        public static let axGetWindowFrame = "ax_get_window_frame"
        public static let axClickMenuItem = "ax_click_menu_item"
        public static let axSetWindowFrame = "ax_set_window_frame"
        public static let axManageApp = "ax_manage_app"
        public static let axScrollToElement = "ax_scroll_to_element"
        public static let axReadFocused = "ax_read_focused"
        // Agent Script (consolidated CRUDL)
        public static let agentScript = "agent_script_tool"
        // Agent action names (expanded from consolidated "agent" tool)
        public static let listAgentScripts = "list_agents"
        public static let readAgentScript = "read_agent"
        public static let createAgentScript = "create_agent"
        public static let updateAgentScript = "update_agent"
        public static let runAgentScript = "run_agent"
        public static let deleteAgentScript = "delete_agent"
        public static let combineAgentScripts = "combine_agents"
        // SDEF
        public static let lookupSdef = "sdef_tool"
        // Xcode (consolidated CRUDL)
        public static let xcode = "xcode_tool"
        // Legacy xcode names (handlers still work)
        public static let xcodeBuild = "xcode_build"
        public static let xcodeRun = "xcode_run"
        public static let xcodeListProjects = "xcode_list_projects"
        public static let xcodeSelectProject = "xcode_select_project"
        public static let xcodeGrantPermission = "xcode_grant_permission"
        // AppleScript (consolidated CRUDL)
        public static let appleScriptTool = "applescript_tool"
        // Legacy AppleScript names (handlers still work)
        public static let listAppleScripts = "list_apple_scripts"
        public static let runAppleScript = "run_apple_script"
        public static let saveAppleScript = "save_apple_script"
        public static let deleteAppleScript = "delete_apple_script"
        // JavaScript (consolidated CRUDL)
        public static let javascriptTool = "javascript_tool"
        // Legacy JavaScript names (handlers still work)
        public static let listJavascript = "list_javascript"
        public static let runJavascript = "run_javascript"
        public static let saveJavascript = "save_javascript"
        public static let deleteJavascript = "delete_javascript"
        // Tool Discovery
        public static let listNativeTools = "list_tools_tool"
// Safari (consolidated web automation)
        public static let safari = "safari_tool"
        // Legacy web_ names (handlers still work)
        public static let safariOpen = "web_open"
        public static let safariFind = "web_find"
        public static let safariClick = "web_click"
        public static let safariType = "web_type"
        public static let safariExecuteJs = "web_execute_js"
        public static let safariGetUrl = "web_get_url"
        public static let safariGetTitle = "web_get_title"
        public static let safariGoogleSearch = "web_google_search"
        public static let safariReadContent = "web_read_content"
        public static let safariScrollTo = "web_scroll_to"
        public static let safariSelect = "web_select"
        public static let safariSubmit = "web_submit"
        public static let safariNavigate = "web_navigate"
        public static let safariListTabs = "web_list_tabs"
        public static let safariSwitchTab = "web_switch_tab"
        public static let safariListWindows = "web_list_windows"
        public static let webSwitchWindow = "web_switch_window"
        public static let webNewWindow = "web_new_window"
        public static let webCloseWindow = "web_close_window"
        public static let webWaitForElement = "web_wait_for_element"
        // Selenium (consolidated CRUDL)
        public static let seleniumTool = "selenium_tool"
        // Legacy selenium names (handlers still work)
        public static let seleniumStart = "selenium_start"
        public static let seleniumStop = "selenium_stop"
        public static let seleniumNavigate = "selenium_navigate"
        public static let seleniumFind = "selenium_find"
        public static let seleniumClick = "selenium_click"
        public static let seleniumType = "selenium_type"
        public static let seleniumExecute = "selenium_execute"
        public static let seleniumScreenshot = "selenium_screenshot"
        public static let seleniumWait = "selenium_wait"
        // Ollama-only
        public static let webSearch = "search_tool"
        // Conversation (consolidated CRUDL)
        public static let conversation = "chat_tool"
        public static let sendMessage = "msg"
        public static let planMode = "plan_tool"
        public static let projectFolderTool = "directory_tool"
        public static let codingMode = "mode_tool"
    }

    // MARK: - Full LLM System Prompt (Desktop: Claude, Ollama, OpenAI, etc.)
    public static func systemPrompt(userName: String, userHome: String, projectFolder: String = "") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        let shell = ProcessInfo.processInfo.environment["SHELL"]?.components(separatedBy: "/").last ?? "zsh"
        return """
        You are Agent! — an autonomous macOS agent. Your name is "Agent!" (always with exclamation mark). You are NOT powered by any specific AI — you ARE Agent!, a standalone macOS agent. NEVER say "powered by Claude" or "powered by" any AI model. User: "\(userName)", home: "\(userHome)". Project: \(folder). Shell: \(shell).
        CRITICAL: You MUST call done(summary:"...") as a TOOL CALL when finished. ONLY do what the user asked — nothing more. If the task is complete, call done immediately. Do NOT continue with unrelated actions. Do NOT use previous conversation history to invent new work. If unsure what to do next, call done and ask the user in the summary.
        BROKEN RECORD RULE: NEVER repeat the same tool call you already performed. Each step MUST make forward progress.
        Anti-patterns — if you catch yourself doing any of these, STOP immediately:
        - Reading the same file 2+ times without editing it → edit or move on.
        - Running the same build after identical code → the result won't change.
        - Searching for the same pattern repeatedly → use what you found.
        - Making the same edit that was just rejected/failed → try a different approach.
        If stuck or unsure, call done and explain — do not loop.
        Put questions in the summary. Don't ask — act.
        Show full output when listing. Never output code as text — use file or agent tools.

        TOOLS: file_tool (read/write/edit/list/search/diff_apply/undo/mkdir/cd) | git_tool (status/diff/log/commit/branch/worktree) | xcode_tool (build/run/analyze/snippet/add_file/remove_file/get_version/bump_version/bump_build) | agent_script_tool (list/read/create/update/run/delete/combine) | plan_tool (create/update/read/list/delete) | directory_tool (get/set/home/documents/library/none) | mode_tool (coding_mode/workflow_mode/standard_mode)
        applescript_tool (execute/sdef/list/run/save/delete) | javascript_tool (execute/list/run/save/delete) | accessibility_tool (open_app/find_element/click_element/click/type_text/list_windows/get_properties + more) | safari_tool (open/click/type/read_content/execute_js/google_search + more)
        user_shell_tool (shell via Launch Agent) | root_shell_tool (shell via Launch Daemon) | shell_tool (shell fallback) | batch_shell_tool (multi-shell) | multi_tool (multi-tool)
        spawn_agent (parallel sub-agent) | send_message_to_agent (direct sub-agent) | ask_user_question (mid-task dialog) | web_fetch (read URL) | invoke_skill (prompt templates) | memory (read/write/append/clear/list/save/load/delete)
        MCP: Agent! has full MCP (Model Context Protocol) support via AgentMCP. MCP servers extend Agent!'s capabilities with additional tools. MCP tools are prefixed with mcp_.

        RULES:
        - Prefer built-in tools over MCP (mcp_*). Use file_tool for files, git_tool for VCS, xcode_tool for builds.
        - PREFER accessibility_tool over screenshots for reading UI. accessibility_tool(action:"find_element") reads text, roles, values instantly. Only use screenshots when visual layout matters.
        - ALWAYS use element-based clicks (accessibility_tool action:"click_element" with role/title/appBundleId) — NEVER use coordinate clicks.
        - After clicking UI buttons that trigger animations/countdowns (like Photo Booth), use wait(seconds: 5) before checking results.
        - For browser web content: accessibility_tool(action:"find_element") with AXWebArea, AXLink, AXButton, AXTextField, AXImage, AXHeading roles.
        - NEVER guess file paths. ALWAYS call file_tool(action:"list") BEFORE reading files to verify they exist.
        - NEVER re-read the same file more than once in a row. Use the content you have.
        - ALWAYS use file_tool(action:"list") and file_tool(action:"search") instead of shell find/grep commands.
        - xcode_tool(action:"build") for Xcode projects, never xcodebuild shell.
        - xcode_tool(action:"analyze"/"snippet") for Swift code review.
        - xcode_tool(action:"bump_version") to bump version numbers. NEVER use grep/sed on pbxproj.
        - Safari JS via AppleScript preferred for web: `tell application "Safari" to do JavaScript "..." in document 1`.
        - SPLITTING FILES: read → write new → xcode_tool add_file → edit original → xcode_tool build. One file at a time.
        - "run AgentName" or "run the agent X" → IMMEDIATELY call agent_script_tool(action:"run", name:"X"). Do NOT list first. After running, report the result and call done_tool.

        ACCESSIBILITY (accessibility_tool) — BE DIRECT:
        - accessibility_tool(action:"open_app", appBundleId) opens/activates app AND returns its elements. Use this FIRST if app might not be running.
        - accessibility_tool(action:"click_element", role, title, appBundleId) finds AND clicks in ONE call. PREFERRED for clicking.
        - accessibility_tool(action:"find_element", role, title, appBundleId) finds without clicking. Use only when you need to read element properties.
        - NEVER use perform_action with AXPress — use click_element instead, it handles all click fallbacks automatically.
        - NEVER list_windows or screenshot first. Go straight to the app by name or bundleId.
        - You can pass app names ("Photo Booth") — they auto-resolve to bundle IDs.
        - Example: "take photo" → accessibility_tool(action:"open_app", appBundleId:"Photo Booth") → accessibility_tool(action:"click_element", role:"AXButton", title:"take photo", appBundleId:"Photo Booth") → done_tool.

        CODING DISCIPLINE:
        - REQUIRED: ALWAYS create a plan_tool FIRST (plan_tool action:"create", name:..., steps:[...]) before editing ANY files. No exceptions. Saves tokens by avoiding regeneration.
        - Work on 1 file at a time. Make 1 change at a time. Build. Commit. Repeat.
        - Break tasks into small bites — a few lines per change.
        - Update each plan step as you go (plan_tool action:"update", step:N, status:"completed").
        - edit → xcode_tool(action:"build") → fix errors → rebuild → git_tool commit. Every time.
        - Do ONLY what was asked. No extra refactoring, no added comments, no "improvements" beyond scope.
        - If a build fails, read the error and fix that specific line. Don't start over.
        - If an approach fails, diagnose before switching. Don't retry blindly, don't abandon after one failure.
        - Don't re-read files already in context. Don't waste tokens on reads without edits.
        - edit for single-line changes. diff_apply for multi-line. One edit per call. Build after every edit.
        - If stuck after 3 attempts, call done_tool and explain what failed.

        LEAST PRIVILEGE:
        - user_shell_tool (Launch Agent) is primary — use for all shell commands.
        - shell_tool is fallback when Launch Agent is unavailable.
        - root_shell_tool (Launch Daemon) is for admin tasks only — never for everyday operations.
        - NEVER use sudo — use root_shell_tool instead.

        TCC (in-process): agent_script_tool(run), applescript_tool(execute), accessibility_tool. NO TCC: user_shell_tool, root_shell_tool, shell_tool.
        AGENT SCRIPTS: ~/Documents/AgentScript/agents/. Swift dylibs. Entry: @_cdecl("script_main") public func scriptMain() -> Int32. Args via AGENT_SCRIPT_ARGS env. Full Swift + ScriptingBridge + TCC.
        """
    }

    /// Minimal system prompt for coding mode iterations 2+. Saves ~2K tokens per iteration.
    public static func codingModePrompt(projectFolder: String) -> String {
        return """
        Continue coding. Project: \(projectFolder).
        WORKFLOW: edit → build → fix errors → build → commit. One file, one change at a time.
        EFFICIENCY: Don't re-read files already in context. Read once, edit, build. If the build fails, read the error (not the whole file again) and fix that specific line.
        TOOLS: diff_apply for multi-line changes. edit for single-line. One edit per call. xc(action:"build") after every edit.
        COMPLETION: Call task_complete when done. If stuck after 3 tries, call task_complete and explain.
        """
    }

    /// Condensed full system prompt — same rules and voice as systemPrompt(), fewer words.
    /// Use for iterations 2+ to keep all guidance present without burning tokens. Switch back to
    /// the full systemPrompt() if the LLM gets confused (broken record, repeated failures).
    public static func condensedSystemPrompt(userName: String, userHome: String, projectFolder: String = "") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        let shell = ProcessInfo.processInfo.environment["SHELL"]?.components(separatedBy: "/").last ?? "zsh"
        return """
        You are Agent! — autonomous macOS agent. NOT powered by Claude/GPT/any AI — you ARE Agent!. NEVER say "powered by". User: "\(userName)", home: "\(userHome)". Project: \(folder). Shell: \(shell).
        CRITICAL: Call done(summary:"...") as TOOL CALL when finished. ONLY do what user asked. Call done immediately when complete. NO unrelated actions. NO inventing work from history. Unsure → call done with question in summary.
        BROKEN RECORD: NEVER repeat the same tool call. Each step MUST progress.
        Anti-patterns — STOP if you catch yourself:
        - Re-reading same file without edit → edit or move on.
        - Re-building unchanged code → result won't change.
        - Re-searching same pattern → use what you found.
        - Re-trying rejected edit → try different approach.
        Stuck → call done, explain. Don't loop.
        Questions go in summary. Don't ask — act.
        Show full listing output. Code goes through file/agent tools, never as text.

        TOOLS: file_tool (read/write/edit/list/search/diff_apply/undo/mkdir/cd) | git_tool (status/diff/log/commit/branch/worktree) | xcode_tool (build/run/analyze/snippet/add_file/remove_file/get_version/bump_version/bump_build) | agent_script_tool (list/read/create/update/run/delete/combine) | plan_tool (create/update/read/list/delete) | directory_tool (get/set/home/documents/library/none) | mode_tool (coding_mode/workflow_mode/standard_mode)
        applescript_tool (execute/sdef/list/run/save/delete) | javascript_tool (execute/list/run/save/delete) | accessibility_tool (open_app/find_element/click_element/click/type_text/list_windows/get_properties + more) | safari_tool (open/click/type/read_content/execute_js/google_search + more)
        user_shell_tool (Launch Agent) | root_shell_tool (Launch Daemon) | shell_tool (fallback) | batch_shell_tool | multi_tool
        spawn_agent | send_message_to_agent | ask_user_question | web_fetch | invoke_skill | memory
        MCP: full Model Context Protocol support via AgentMCP. MCP tools prefixed mcp_.

        RULES:
        - Built-in tools over MCP. file_tool for files, git_tool for VCS, xcode_tool for builds.
        - accessibility_tool over screenshots — find_element reads text/roles/values instantly. Screenshots only for visual layout.
        - ALWAYS element-based clicks (click_element with role/title/appBundleId). NEVER coordinate clicks.
        - After UI clicks with animations/countdowns (Photo Booth), wait(seconds:5) before checking.
        - Browser content: find_element with AXWebArea/AXLink/AXButton/AXTextField/AXImage/AXHeading roles.
        - NEVER guess paths. file_tool(list) BEFORE read.
        - NEVER re-read same file in a row. Use what you have.
        - file_tool(list/search) instead of shell find/grep.
        - xcode_tool(build), never xcodebuild shell.
        - xcode_tool(analyze/snippet) for Swift code review.
        - xcode_tool(bump_version) for versions. NEVER grep/sed on pbxproj.
        - Safari JS via AppleScript: `tell application "Safari" to do JavaScript "..." in document 1`.
        - SPLITTING FILES: read → write new → xcode_tool add_file → edit original → xcode_tool build. One file at a time.
        - "run AgentName" / "run the agent X" → IMMEDIATELY agent_script_tool(action:"run", name:"X"). No list step. Then done_tool.

        ACCESSIBILITY — BE DIRECT:
        - open_app(appBundleId) opens/activates AND returns elements. Use FIRST if app may not be running.
        - click_element(role,title,appBundleId) finds AND clicks in ONE call. PREFERRED for clicking.
        - find_element(role,title,appBundleId) finds without clicking. Only when reading element properties.
        - NEVER perform_action with AXPress — use click_element (handles fallbacks).
        - NEVER list_windows or screenshot first. Go straight to app by name/bundleId.
        - App names auto-resolve ("Photo Booth" → bundle ID).
        - Example: "take photo" → open_app("Photo Booth") → click_element(AXButton,"take photo","Photo Booth") → done_tool.

        CODING DISCIPLINE:
        - REQUIRED: ALWAYS plan_tool(create) FIRST before ANY edits. No exceptions.
        - 1 file, 1 change at a time. Build. Commit. Repeat.
        - Small bites — few lines per change.
        - Update each plan step as you go (plan_tool update, status:"completed").
        - edit → xcode_tool(build) → fix errors → rebuild → git_tool(commit). Every time.
        - ONLY what was asked. No refactoring, comments, or "improvements" beyond scope.
        - Build fails → read error, fix that line. Don't start over.
        - Approach fails → diagnose before switching. No blind retries, no abandon-after-one.
        - Don't re-read files in context. No reads without edits.
        - edit=single-line. diff_apply=multi-line. One edit per call. Build after every edit.
        - Stuck after 3 attempts → done_tool + explain.

        LEAST PRIVILEGE:
        - user_shell_tool (Launch Agent) primary for all shell commands.
        - shell_tool fallback when Launch Agent unavailable.
        - root_shell_tool (Launch Daemon) for admin tasks only — never everyday.
        - NEVER sudo — use root_shell_tool.

        TCC (in-process): agent_script_tool(run), applescript_tool(execute), accessibility_tool. NO TCC: user_shell_tool, root_shell_tool, shell_tool.
        AGENT SCRIPTS: ~/Documents/AgentScript/agents/. Swift dylibs. Entry: @_cdecl("script_main") public func scriptMain() -> Int32. Args via AGENT_SCRIPT_ARGS env. Full Swift + ScriptingBridge + TCC.
        """
    }

    // MARK: - Tool List per Provider (for ToolsView)

    /// Returns the tools available for a given provider.
    /// Web search via Tavily is now available for all providers as a backup search option.
    /// Conversation tools for natural language tasks are also included.
    public static func tools(for provider: APIProvider) -> [ToolDef] {
        // All providers get web_search and conversation tools
        return commonTools + webSearchTools + conversationTools
    }
//TOOLS:
//\(enabledAppleAIToolLines())
    //\(Name.executeAgentCommand) {"command": "ls -la"}
    //\(Name.runApplescript) {"source": "tell app \\"Finder\\" to get name of home"}
    //\(Name.runOsascript) {"script": "display dialog \\"Hello\\""}
    //\(Name.taskComplete) {"summary": "Done"}
    
    // MARK: - Lite System Prompt (Apple Intelligence — small context window)
    @MainActor public static func compactSystemPrompt(userName: String, userHome: String, projectFolder: String = "") -> String {
        let folder = projectFolder.isEmpty ? userHome : projectFolder
        let n = Name.self
        return """
        macOS agent for \(userName). Project: \(folder). ALWAYS call \(n.taskComplete) when finished. If you need user input, put the question in the summary AND call \(n.taskComplete). Every response MUST end with \(n.taskComplete).
        TOOLS: \(n.fileManager) (action: read/write/edit/list/search), \(n.executeAgentCommand), \(n.agentScript) (list/read/create/update/run).
        Shell: \(n.executeAgentCommand) for rm/mv/cp/ls/grep. Don't repeat stdout.
        """
    }

    /// Concrete examples for each tool.
    public static let toolExamples: [String: String] = [
        Name.executeAgentCommand:  #"execute_agent_command {"command": "ls -la"}"#,
        Name.executeDaemonCommand: #"execute_daemon_command {"command": "whoami"}"#,
        Name.batchCommands:        #"batch_commands {"commands": "ls -la\ncat README.md\ngit status"}"#,
        Name.batchTools:           #"batch_tools {"description": "Read project files", "tasks": [{"tool": "file_manager", "input": {"action": "read", "file_path": "/path/a.swift"}}, {"tool": "file_manager", "input": {"action": "search", "pattern": "TODO", "path": "/path"}}]}"#,
        Name.runShellScript:       #"run_shell_script {"command": "ls -la"}"#,
        Name.runApplescript:       #"run_applescript {"source": "tell application \"Finder\" to get name of home"}"#,
        Name.runOsascript:         #"run_osascript {"script": "display dialog \"Hello\""}"#,
        Name.executeJavascript:    #"execute_javascript {"source": "var app = Application.currentApplication(); app.includeStandardAdditions = true; app.displayDialog('Hello')"}"#,
        Name.fileManager:          #"file_manager {"action": "read", "file_path": "/Users/toddbruss/Documents/example.txt"}"#,
        Name.taskComplete:         #"task_complete {"summary": "Done"}"#,
        Name.git:                  #"git {"action": "status", "path": "/Users/toddbruss/Documents/GitHub/MyRepo"}"#,
        Name.agentScript:          #"agent {"action": "run", "name": "MyScript"}"#,
        Name.lookupSdef:           #"lookup_sdef {"bundle_id": "com.apple.Music"}"#,
        Name.xcode:                #"xcode {"action": "build"}"#,
        Name.accessibility:        #"accessibility {"action": "find_element", "role": "AXButton", "title": "take photo", "appBundleId": "com.apple.PhotoBooth"}"#,
        Name.safari:               #"web {"action": "open", "url": "https://example.com"}"#,
        Name.appleScriptTool:      #"applescript_tool {"action": "execute", "source": "display dialog \"Hello\""}"#,
        Name.javascriptTool:       #"javascript_tool {"action": "execute", "source": "var app = Application.currentApplication(); app.displayDialog('Hello')"}"#,
        Name.projectFolderTool:    #"project_folder {"action": "set", "path": "/Users/me/Projects/MyApp"}"#,
        Name.webSearch:            #"web_search {"query": "latest Swift news"}"#,
        // Conversation (consolidated)
        Name.conversation:         #"conversation {"action": "write", "subject": "machine learning", "style": "informative", "length": "medium"}"#,
        Name.sendMessage:          #"send_message {"content": "Hello!", "recipient": "me", "channel": "imessage"}"#,
    ]

    @MainActor public static func enabledAppleAIToolLines(isEnabled: (String) -> Bool) -> String {
        return commonTools
            .filter { isEnabled($0.name) }
            .map { tool in toolExamples[tool.name] ?? "\(tool.name) {}" }
            .joined(separator: "\n")
    }

    // MARK: - Tool Definitions (internal, format-neutral)

    public struct ToolDef: @unchecked Sendable {
        public let name: String
        public let description: String
        public let properties: [String: [String: Any]]
        public let required: [String]

        public init(name: String, description: String, properties: [String: [String: Any]], required: [String]) {
            self.name = name
            self.description = description
            self.properties = properties
            self.required = required
        }
    }

    nonisolated(unsafe) public static let commonTools: [ToolDef] = [
        // --- File Manager (consolidated) ---
        ToolDef(
            name: Name.fileManager,
            description: "File ops. edit=replace string. diff_apply=replace line range (preferred for code). mkdir=create dir. cd=change project folder.",
            properties: [
                "action": ["type": "string", "description": "read|write|edit|create|apply|undo|diff_apply|list|search|read_dir|mkdir|cd|if_to_switch|extract_function"],
                "file_path": ["type": "string", "description": "File path (for read/write/edit/apply/undo/diff_apply)"],
                "path": ["type": "string", "description": "Directory path (for list/search/read_dir)"],
                "content": ["type": "string", "description": "For write: file content"],
                "old_string": ["type": "string", "description": "For edit: text to find"],
                "new_string": ["type": "string", "description": "For edit: replacement text"],
                "replace_all": ["type": "boolean", "description": "For edit: replace all (default false)"],
                "context": ["type": "string", "description": "For edit: surrounding lines to disambiguate multiple matches"],
                "source": ["type": "string", "description": "For create/diff_apply: original text (omit to read from file_path)"],
                "destination": ["type": "string", "description": "For create/diff_apply: the modified text"],
                "start_line": ["type": "integer", "description": "For create: 1-based start line for section editing"],
                "end_line": ["type": "integer", "description": "For create: 1-based end line for section editing"],
                "diff_id": ["type": "string", "description": "For apply: UUID from create"],
                "diff": ["type": "string", "description": "For apply: inline diff with =/-/+ prefixes"],
                "offset": ["type": "integer", "description": "For read: start line (default 1)"],
                "limit": ["type": "integer", "description": "For read: max lines (default 2000)"],
                "pattern": ["type": "string", "description": "For list: glob. For search: regex"],
                "include": ["type": "string", "description": "For search: file filter (e.g. *.swift)"],
                "detail": ["type": "string", "description": "For read_dir: 'slim' (default, names only) or 'more' (full ls -la with sizes/dates/permissions)"],
                "function_name": ["type": "string", "description": "For extract_function: name of function to extract"],
                "new_file": ["type": "string", "description": "For extract_function: destination filename"],
            ],
            required: ["action"]
        ),
        // --- Git (consolidated) ---
        ToolDef(
            name: Name.git,
            description: "Git ops. status, diff, log, commit, diff_patch, branch, worktree.",
            properties: [
                "action": ["type": "string", "description": "status|diff|log|commit|diff_patch|branch|worktree"],
                "path": ["type": "string", "description": "Repository path (REQUIRED)"],
                "staged": ["type": "boolean", "description": "For diff: staged changes only"],
                "target": ["type": "string", "description": "For diff: branch/commit to diff against"],
                "count": ["type": "integer", "description": "For log: number of commits (default 20)"],
                "message": ["type": "string", "description": "For commit: commit message"],
                "files": ["type": "array", "items": ["type": "string"] as [String: Any], "description": "For commit: specific files to stage"] as [String: Any],
                "patch": ["type": "string", "description": "For diff_patch: unified diff content"],
                "name": ["type": "string", "description": "For branch: branch name"],
                "checkout": ["type": "boolean", "description": "For branch: switch to new branch (default true)"],
            ],
            required: ["action"]
        ),
        // --- Xcode (consolidated) ---
        ToolDef(
            name: Name.xcode,
            description: "Xcode build/run, code review, version bumps, add/remove files.",
            properties: [
                "action": ["type": "string", "description": "build|run|list_projects|select_project|add_file|remove_file|grant_permission|analyze|snippet|code_review|get_version|bump_version|bump_build"],
                "project_path": ["type": "string", "description": "For build/run: path (auto-detected if empty)"],
                "file_path": ["type": "string", "description": "For add_file/remove_file/analyze/snippet: path to source file"],
                "number": ["type": "integer", "description": "For select_project: project number (1-based)"],
                "start_line": ["type": "integer", "description": "For analyze/snippet: start line number"],
                "end_line": ["type": "integer", "description": "For analyze/snippet: end line number"],
                "checks": ["type": "string", "description": "For analyze: check groups (all, syntax, style, safety, performance, bestPractices)"],
                "delta": ["type": "integer", "description": "For bump_version/bump_build: +1 (default) or -1 to decrement"],
            ],
            required: ["action"]
        ),
        // --- Coding: Shell ---
        ToolDef(
            name: Name.executeAgentCommand,
            description: "Shell as current user via Launch Agent. Primary shell tool.",
            properties: [
                "command": ["type": "string", "description": "Bash command"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.executeDaemonCommand,
            description: "Shell as ROOT via Launch Daemon. Admin tasks only — no sudo.",
            properties: [
                "command": ["type": "string", "description": "Bash command (runs as root)"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.runShellScript,
            description: "Shell fallback when Launch Agent is off.",
            properties: [
                "command": ["type": "string", "description": "Bash command"],
            ],
            required: ["command"]
        ),
        ToolDef(
            name: Name.batchCommands,
            description: "Multiple shell commands in one call (newline-separated).",
            properties: [
                "commands": ["type": "string", "description": "Newline-separated commands"],
            ],
            required: ["commands"]
        ),
        ToolDef(
            name: Name.batchTools,
            description: "Multiple tool calls in one batch.",
            properties: [
                "description": ["type": "string", "description": "Batch label"],
                "tasks": ["type": "array", "description": "Array of {tool, input} objects", "items": ["type": "object"] as [String: Any]] as [String: Any],
            ],
            required: ["description", "tasks"]
        ),
        ToolDef(
            name: Name.taskComplete,
            description: "Signal task complete. Call when done.",
            properties: [
                "summary": ["type": "string", "description": "Brief summary"],
            ],
            required: ["summary"]
        ),
        // --- Project Folder ---
        ToolDef(
            name: Name.projectFolderTool,
            description: "Get or change the project folder for this tab.",
            properties: [
                "action": ["type": "string", "description": "get|set|home|documents|library|none|cd"],
                "path": ["type": "string", "description": "For set/cd: absolute or relative path"],
            ],
            required: ["action"]
        ),
        // --- Mode Tool ---
        ToolDef(
            name: Name.codingMode,
            description: "Switch tool mode. coding=fewer tools, faster responses for code work. workflow=automation tools. standard=all tools.",
            properties: [
                "action": ["type": "string", "description": "coding_mode|workflow_mode|standard_mode"],
            ],
            required: ["action"]
        ),
        // --- Agent Scripts (reusable Swift scripts) ---
        // --- Agent Scripts (consolidated) ---
        ToolDef(
            name: Name.agentScript,
            description: "Swift dylibs (~/Documents/AgentScript/agents) with full TCC.",
            properties: [
                "action": ["type": "string", "description": "list|read|create|update|run|delete|combine"],
                "name": ["type": "string", "description": "Script name (for read/create/update/run/delete)"],
                "content": ["type": "string", "description": "Swift source code (for create/update)"],
                "arguments": ["type": "string", "description": "For run: string passed via AGENT_SCRIPT_ARGS env var"],
                "source_a": ["type": "string", "description": "For combine: first script name"],
                "source_b": ["type": "string", "description": "For combine: second script name"],
                "target": ["type": "string", "description": "For combine: output script name"],
            ],
            required: ["action"]
        ),
        // --- AppleScript (consolidated) ---
        ToolDef(
            name: Name.appleScriptTool,
            description: "AppleScript in-process with TCC.",
            properties: [
                "action": ["type": "string", "description": "execute|lookup_sdef|list|run|save|delete"],
                "name": ["type": "string", "description": "Script name (for run/save/delete)"],
                "source": ["type": "string", "description": "AppleScript source code (for execute/save)"],
                "bundle_id": ["type": "string", "description": "For lookup_sdef: app bundle ID (e.g. com.apple.Music). Use 'list' to see all SDEFs."],
                "class_name": ["type": "string", "description": "For lookup_sdef: specific class to inspect (e.g. 'track')"],
            ],
            required: ["action"]
        ),
        // --- JavaScript/JXA (consolidated) ---
        ToolDef(
            name: Name.javascriptTool,
            description: "JavaScript for Automation (JXA).",
            properties: [
                "action": ["type": "string", "description": "execute|list|run|save|delete"],
                "name": ["type": "string", "description": "Script name (for run/save/delete)"],
                "source": ["type": "string", "description": "JXA source code (for execute/save)"],
            ],
            required: ["action"]
        ),
        // --- Accessibility (consolidated) ---
        ToolDef(
            name: Name.accessibility,
            description: "macOS UI automation. Use open_app first, then click_element/find_element with role+title+appBundleId.",
            properties: [
                "action": ["type": "string", "description": "open_app|find_element|click_element|click|type_text|type_into_element|list_windows|inspect_element|get_properties|perform_action|scroll|scroll_to_element|press_key|screenshot|set_properties|get_focused_element|get_children|drag|wait|highlight_element|manage_app|show_menu|click_menu_item|check_permission|request_permission"],
                "role": ["type": "string", "description": "AX role (e.g. AXButton, AXTextField)"],
                "title": ["type": "string", "description": "Title/name to match (partial)"],
                "value": ["type": "string", "description": "Value to match (partial)"],
                "appBundleId": ["type": "string", "description": "App bundle ID to search within"],
                "x": ["type": "number", "description": "Screen X coordinate"],
                "y": ["type": "number", "description": "Screen Y coordinate"],
                "text": ["type": "string", "description": "For type_text: text to type"],
                "button": ["type": "string", "description": "For click: left/right/middle (default left)"],
                "clicks": ["type": "integer", "description": "For click: 1 or 2 (default 1)"],
                "keyCode": ["type": "integer", "description": "For press_key: macOS virtual key code"],
                "modifiers": ["type": "array", "description": "For press_key: command/option/control/shift", "items": ["type": "string"]],
                "width": ["type": "number", "description": "For screenshot: region width"],
                "height": ["type": "number", "description": "For screenshot: region height"],
                "windowId": ["type": "integer", "description": "For screenshot/list_windows: window ID"],
                "limit": ["type": "integer", "description": "For list_windows: max windows (default 50)"],
                "ax_action": ["type": "string", "description": "For perform_action: AXPress, AXConfirm, AXActivate, AXCancel, AXShowMenu, AXDismiss, AXIncrement, AXDecrement, AXExpand, AXCollapse, AXOpen, AXRaise, AXZoom, AXMinimize, AXCopy, AXCut, AXPaste, AXSelect, AXSelectAll, AXScrollToVisible, AXScrollPageUp/Down/Left/Right, AXFocus, AXShowDefaultUI, AXShowAlternateUI, AXDelete, AXPick"],
                "properties": ["type": "object", "description": "For set_properties: key-value pairs to set"],
                "timeout": ["type": "number", "description": "For find_element: max seconds to wait (default 5)"],
                "depth": ["type": "integer", "description": "For get_children: traversal depth (default 3)"],
            ],
            required: ["action"]
        ),
        // --- Tool Discovery ---
        ToolDef(
            name: Name.listNativeTools,
            description: "List all enabled tools (built-in and MCP).",
            properties: [:],
            required: []
        ),
        // --- Web (consolidated) ---
        ToolDef(
            name: Name.safari,
            description: "Safari automation. Open URLs, click, type, read content, search, manage tabs/windows.",
            properties: [
                "action": ["type": "string", "description": "open|find|click|type|execute_js|get_url|get_title|read_content|google_search|scroll_to|select|submit|navigate|list_tabs|switch_tab|list_windows|scan|search"],
                "url": ["type": "string", "description": "URL to open"],
                "selector": ["type": "string", "description": "CSS selector for click/type/submit"],
                "text": ["type": "string", "description": "Text to type"],
                "query": ["type": "string", "description": "Search query"],
                "script": ["type": "string", "description": "JavaScript code"],
            ],
            required: ["action"]
        ),
        // --- Selenium (consolidated) ---
        ToolDef(
            name: Name.seleniumTool,
            description: "Selenium WebDriver session. Use safari_tool for normal Safari automation.",
            properties: [
                "action": ["type": "string", "description": "start|stop|navigate|find|click|type|execute|screenshot|wait"],
                "browser": ["type": "string", "description": "For start: safari (default), chrome, firefox"],
                "port": ["type": "integer", "description": "WebDriver port (default 7055)"],
                "url": ["type": "string", "description": "For navigate: URL"],
                "strategy": ["type": "string", "description": "For find/click/type/wait: css, xpath, id, name"],
                "value": ["type": "string", "description": "For find/click/type/wait: selector value"],
                "text": ["type": "string", "description": "For type: text to enter"],
                "script": ["type": "string", "description": "For execute: JavaScript code"],
                "filename": ["type": "string", "description": "For screenshot: filename"],
                "timeout": ["type": "number", "description": "For wait: max seconds (default 10)"],
                "capabilities": ["type": "object", "description": "For start: WebDriver capabilities"],
            ],
            required: ["action"]
        ),
        // --- Agent Tools (sub-agents, messaging, questions) ---
        ToolDef(
            name: "spawn_agent",
            description: "Spawn isolated sub-agent. Max 3 concurrent.",
            properties: [
                "name": ["type": "string", "description": "Agent name"],
                "prompt": ["type": "string", "description": "Complete task (agent has no parent context)"],
                "tools": ["type": "string", "description": "all|coding|automation|<groups>"],
                "max_iterations": ["type": "integer", "description": "Max LLM turns (default 15)"],
            ],
            required: ["prompt"]
        ),
        ToolDef(
            name: "send_message_to_agent",
            description: "Message a running sub-agent.",
            properties: [
                "to": ["type": "string", "description": "Agent name or ID"],
                "message": ["type": "string", "description": "Message content"],
            ],
            required: ["to", "message"]
        ),
        ToolDef(
            name: "ask_user_question",
            description: "Mid-task user dialog. Waits up to 5min.",
            properties: [
                "question": ["type": "string", "description": "Question"],
            ],
            required: ["question"]
        ),
        ToolDef(
            name: "web_fetch",
            description: "Fetch URL, strip HTML, cap 8K chars.",
            properties: [
                "url": ["type": "string", "description": "URL"],
            ],
            required: ["url"]
        ),
        ToolDef(
            name: "invoke_skill",
            description: "Reusable prompt template.",
            properties: [
                "action": ["type": "string", "description": "list|invoke|save|delete"],
                "name": ["type": "string", "description": "Skill name"],
                "id": ["type": "string", "description": "Skill ID (save/delete)"],
                "description": ["type": "string", "description": "save: skill description"],
                "when_to_use": ["type": "string", "description": "save: when to invoke"],
                "content": ["type": "string", "description": "save: prompt content"],
            ],
            required: ["action"]
        ),
    ]

    // MARK: - Plain-Text Format (for Foundation Models / text-based providers)

    /// All tool names derived from commonTools + conversationTools. Use instead of hardcoded lists.
    nonisolated public static var toolNames: [String] {
        (commonTools + conversationTools).map { $0.name }
    }

    /// Compact tool reference for inclusion in plain-text model prompts.
    /// Format: toolName {"param": type, "optParam"?: type} — short description
    nonisolated public static var textFormat: String {
        var lines: [String] = ["TOOLS — call as: toolName {\"param\": value, ...}"]
        for tool in (commonTools + conversationTools) {
            let reqParams = tool.required
            let allKeys = tool.properties.keys.sorted { a, b in
                let aReq = reqParams.contains(a)
                let bReq = reqParams.contains(b)
                if aReq != bReq { return aReq }
                return a < b
            }
            var paramParts: [String] = []
            for key in allKeys {
                guard let schema = tool.properties[key] else { continue }
                let typeStr = (schema["type"] as? String) ?? "any"
                let opt = reqParams.contains(key) ? "" : "?"
                paramParts.append("\"\(key)\"\(opt): \(typeStr)")
            }
            let params = paramParts.isEmpty ? "{}" : "{\(paramParts.joined(separator: ", "))}"
            let shortDesc = tool.description.components(separatedBy: ". ").first ?? tool.description
            lines.append("\(tool.name) \(params) — \(shortDesc)")
        }
        return lines.joined(separator: "\n")
    }

    // MARK: - Claude (Anthropic) Format

    /// Convert a ToolDef to Anthropic's tool schema.
    public static func claudeTool(name: String, description: String, properties: [String: Any], required: [String]) -> [String: Any] {
        [
            "name": name,
            "description": description,
            "input_schema": [
                "type": "object",
                "properties": properties,
                "required": required,
            ] as [String: Any],
        ]
    }

    /// Sanitize an MCP tool name to alphanumeric, underscore, and hyphen only.
    private static func sanitizeToolName(_ name: String) -> String {
        String(name.unicodeScalars.filter { CharacterSet.alphanumerics.contains($0) || $0 == "_" || $0 == "-" }.prefix(128))
    }

    /// Sanitize an MCP tool description: collapse newlines, cap length.
    private static func sanitizeDescription(_ desc: String, maxLength: Int = 1024) -> String {
        let cleaned = desc
            .replacingOccurrences(of: "\r\n", with: " ")
            .replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\r", with: " ")
        return String(cleaned.prefix(maxLength))
    }

    /// Recursively remove NSNull values and ensure schema validity
    private static func sanitizeSchema(_ value: Any) -> Any {
        if let dict = value as? [String: Any] {
            // Filter out NSNull values and sanitize recursively
            var result: [String: Any] = [:]
            for (key, val) in dict {
                if !(val is NSNull) {
                    result[key] = sanitizeSchema(val)
                }
            }
            // Ensure "properties" is always an object for object-type schemas
            if (result["type"] as? String) == "object" && result["properties"] == nil {
                result["properties"] = [:] as [String: Any]
            }
            // Fix OpenAI array schema: ensure "items" field exists for array types
            if result["type"] as? String == "array" && result["items"] == nil {
                // OpenAI requires "items" for array types - use empty object schema as default
                result["items"] = ["type": "object"] as [String: Any]
            }
            return result
        } else if let arr = value as? [Any] {
            return arr.map { sanitizeSchema($0) }
        } else if value is NSNull {
            // Replace NSNull with empty object for schema fields, or empty string for others
            return "" as Any
        }
        return value
    }

    /// Strip property descriptions to just type for compact mode.
    private static func compactProperties(_ properties: [String: Any]) -> [String: Any] {
        var result: [String: Any] = [:]
        for (key, value) in properties {
            if var dict = value as? [String: Any] {
                // Keep type, remove verbose description
                if let desc = dict["description"] as? String {
                    // Shorten to first phrase only
                    let short = desc.components(separatedBy: ".").first ?? desc
                    dict["description"] = String(short.prefix(40))
                }
                result[key] = dict
            } else {
                result[key] = value
            }
        }
        return result
    }

    /// All common tools + MCP tools in Claude/Anthropic format.
    /// When activeGroups is set, only tools in those groups are included.
    /// When compact is true, property descriptions are shortened for coding mode.
    /// MCP tool descriptor for format functions.
    public struct MCPToolInfo: Sendable {
        public let serverName: String
        public let name: String
        public let description: String
        public let inputSchemaJSON: String
        public init(serverName: String, name: String, description: String, inputSchemaJSON: String) {
            self.serverName = serverName; self.name = name; self.description = description; self.inputSchemaJSON = inputSchemaJSON
        }
    }

    /// Strip `_tool` suffix for condensed mode (saves tokens after first turn).
    public static func condenseName(_ name: String) -> String {
        name.hasSuffix("_tool") ? String(name.dropLast(5)) : name
    }

    @MainActor public static func claudeFormat(isEnabled: (String) -> Bool, mcpTools: [MCPToolInfo] = [], compact: Bool = false, condensed: Bool = false) -> [[String: Any]] {
        var tools = (commonTools + webSearchTools + conversationTools)
            .filter { isEnabled($0.name) }
            .map { tool in
                let props = compact ? compactProperties(tool.properties) : tool.properties
                let displayName = condensed ? condenseName(tool.name) : tool.name
                return claudeTool(name: displayName, description: compact ? String(tool.description.prefix(60)) : tool.description,
                           properties: props, required: tool.required)
            }
        for tool in mcpTools {
            let safeName = sanitizeToolName("mcp_\(tool.serverName)_\(tool.name)")
            let safeDesc = sanitizeDescription("[MCP:\(tool.serverName)] \(tool.description)")
            let rawSchema = (try? JSONSerialization.jsonObject(with: Data(tool.inputSchemaJSON.utf8))) as? [String: Any]
            let schema = rawSchema.map { sanitizeSchema($0) as? [String: Any] } ?? nil
            let validSchema: [String: Any]
            if let s = schema, !s.isEmpty {
                validSchema = s
            } else {
                validSchema = ["type": "object", "properties": [:] as [String: Any]]
            }
            tools.append([
                "name": safeName,
                "description": safeDesc,
                "input_schema": validSchema,
            ] as [String: Any])
        }
        return tools
    }

    // MARK: - Ollama (OpenAI) Format

    /// Convert a ToolDef to OpenAI/Ollama tool schema.
    /// Applies schema sanitization to fix OpenAI-specific issues (e.g., array items requirement).
    public static func ollamaTool(name: String, description: String, properties: [String: Any], required: [String]) -> [String: Any] {
        // Sanitize properties to ensure OpenAI schema compliance
        let sanitizedProperties = sanitizeSchema(properties) as? [String: Any] ?? properties
        
        return [
            "type": "function",
            "function": [
                "name": name,
                "description": description,
                "parameters": [
                    "type": "object",
                    "properties": sanitizedProperties,
                    "required": required,
                ] as [String: Any],
            ] as [String: Any],
        ]
    }

    /// Web search tool available for all providers (client-side via Tavily).
    nonisolated(unsafe) public static let webSearchTools: [ToolDef] = [
        ToolDef(
            name: Name.webSearch, // Tavily web search — still uses web_search internally
            description: "Web search via Tavily.",
            properties: [
                "query": ["type": "string", "description": "Search query"],
            ],
            required: ["query"]
        ),
    ]

    /// Conversation tool definitions for writing, text transformation, self-description, and corrections.
    nonisolated(unsafe) public static let conversationTools: [ToolDef] = [
        // --- Conversation (consolidated) ---
        ToolDef(
            name: Name.conversation,
            description: "Write prose, transform text, fix spelling/grammar, describe Agent capabilities.",
            properties: [
                "action": ["type": "string", "description": "write|transform|fix|about"],
                "subject": ["type": "string", "description": "write: topic"],
                "style": ["type": "string", "description": "write: informative|creative|technical|casual|formal"],
                "length": ["type": "string", "description": "write: short|medium|long|<words>"],
                "context": ["type": "string", "description": "write: extra context"],
                "text": ["type": "string", "description": "transform/fix: input text"],
                "transform": ["type": "string", "description": "transform: grocery_list|todo_list|outline|summary|bullet_points|numbered_list|table|qa"],
                "fixes": ["type": "string", "description": "fix: all|spelling|grammar|punctuation|capitalization"],
                "topic": ["type": "string", "description": "about: tools|features|scripting|automation|coding|all"],
                "detail": ["type": "string", "description": "about: brief|standard|detailed"],
            ],
            required: ["action"]
        ),
        ToolDef(
            name: Name.planMode,
            description: "Plans with status tracking. REQUIRED for tasks touching 3+ files.",
            properties: [
                "action": ["type": "string", "description": "create|update|read|list|delete"],
                "name": ["type": "string", "description": "Plan name slug"],
                "steps": ["type": "string", "description": "create: newline-separated steps"],
                "step": ["type": "integer", "description": "update: zero-based step index"],
                "status": ["type": "string", "description": "update: in_progress|completed|failed"],
            ],
            required: ["action"]
        ),
        ToolDef(
            name: "memory",
            description: "Persistent user preferences. 'remember X' → append.",
            properties: [
                "action": ["type": "string", "description": "read|write|append|clear"],
                "text": ["type": "string", "description": "write/append: text"],
            ],
            required: ["action"]
        ),
    ]

    /// Provider-aware Ollama/OpenAI format — filters tools by per-provider preferences.
    /// When activeGroups is set, only tools in those groups are included.
    @MainActor public static func ollamaTools(isEnabled: (String) -> Bool, mcpTools: [MCPToolInfo] = [], compact: Bool = false, condensed: Bool = false) -> [[String: Any]] {
        // All providers get web_search and conversation tools
        var tools = (commonTools + webSearchTools + conversationTools)
            .filter { isEnabled($0.name) }
            .map { tool in
                let props = compact ? compactProperties(tool.properties) : tool.properties
                let displayName = condensed ? condenseName(tool.name) : tool.name
                return ollamaTool(name: displayName, description: compact ? String(tool.description.prefix(60)) : tool.description,
                           properties: props, required: tool.required)
            }
        for tool in mcpTools {
            let safeName = sanitizeToolName("mcp_\(tool.serverName)_\(tool.name)")
            let safeDesc = sanitizeDescription("[MCP:\(tool.serverName)] \(tool.description)")
            let rawSchema = (try? JSONSerialization.jsonObject(with: Data(tool.inputSchemaJSON.utf8))) as? [String: Any]
            let schema = rawSchema.map { sanitizeSchema($0) as? [String: Any] } ?? nil
            let validSchema: [String: Any]
            if let s = schema, !s.isEmpty {
                validSchema = s
            } else {
                validSchema = ["type": "object", "properties": [:] as [String: Any]]
            }
            tools.append([
                "type": "function",
                "function": [
                    "name": safeName,
                    "description": safeDesc,
                    "parameters": validSchema,
                ] as [String: Any],
            ] as [String: Any])
        }
        return tools
    }
}

