/*
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
Example 3:

Input: path = "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
Example 4:

Input: path = "/a/./b/../../c/"
Output: "/c"
 

Constraints:

1 <= path.length <= 3000
path consists of English letters, digits, period '.', slash '/' or '_'.
path is a valid absolute Unix path.
*/
class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        var result = ""
        for dir in path.components(separatedBy: "/") {
            if dir == ".." && !stack.isEmpty {
                stack.removeLast()
            } else if !["..", ".", ""].contains(dir) {
                stack.append(dir)
            }
        }
        for dir in stack {
            result += "/" + dir
        }
        return result.isEmpty ? "/" : result
    }
}