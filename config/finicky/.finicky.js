/**
 * .finicky.js
 *
 */

module.exports = {
    defaultBrowser: "Safari",
    handlers: [
        {
            match: ({ sourceBundleIdentifier }) =>
            ["com.apple.mail", "com.microsoft.Outlook"].includes(sourceBundleIdentifier),
            browser: "Safari"
        }
        /*{
            match: finicky.matchHostnames(["*"]),
            browser: ["Firefox"]
        }*/
    ]
}
