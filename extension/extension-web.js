// Keys array
const keyIdArray = [
    "KeyA",
    "KeyB",
    "KeyC",
    "KeyD",
    "KeyE",
    "KeyF",
    "KeyG",
    "KeyH",
    "KeyI",
    "KeyJ",
    "KeyK",
    "KeyL",
    "KeyM",
    "KeyN",
    "KeyO",
    "KeyP",
    "KeyQ",
    "KeyR",
    "KeyS",
    "KeyT",
    "KeyU",
    "KeyV",
    "KeyW",
    "KeyX",
    "KeyY",
    "KeyZ",
    "Digit0",
    "Digit1",
    "Digit2",
    "Digit3",
    "Digit4",
    "Digit5",
    "Digit6",
    "Digit7",
    "Digit8",
    "Digit9",
    "Backquote",
    "Minus",
    "Equal",
    "BracketLeft",
    "BracketRight",
    "Backslash",
    "IntlBackslash",
    "Semicolon",
    "Quote",
    "Comma",
    "Period",
    "Slash",
    "ControlLeft",
    "ControlRight",
    "ShiftLeft",
    "ShiftRight",
    "AltLeft",
    "AltRight",
    "MetaLeft",
    "MetaRight",
    "CapsLock",
    "NumLock",
    "ScrollLock",
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "F7",
    "F8",
    "F9",
    "F10",
    "F11",
    "F12",
    "ArrowUp",
    "ArrowDown",
    "ArrowLeft",
    "ArrowRight",
    "Home",
    "End",
    "PageUp",
    "PageDown",
    "Insert",
    "Delete",
    "Numpad0",
    "Numpad1",
    "Numpad2",
    "Numpad3",
    "Numpad4",
    "Numpad5",
    "Numpad6",
    "Numpad7",
    "Numpad8",
    "Numpad9",
    "NumpadAdd",
    "NumpadSubtract",
    "NumpadMultiply",
    "NumpadDivide",
    "NumpadDecimal",
    "NumpadEnter",
    "Backspace",
    "Tab",
    "Enter",
    "Space",
    "Escape",
    "ContextMenu"
]

// States array initialization
const keyStateArray = new Array(keyIdArray.length).fill(false);
//console.table(keyStateArray);

// Keydown Detection
window.addEventListener("keydown", function (event) {
    for (let i = 0; i < keyIdArray.length; i++) {
        if (event.code === keyIdArray[i]) {
            keyStateArray[i] = true;
            //console.log(keyIdArray[i] + " PRESSED");
        }
    }
});

// Keyup detection
window.addEventListener("keyup", function (event) {
    for (let i = 0; i < keyIdArray.length; i++) {
        if (event.code === keyIdArray[i]) {
            keyStateArray[i] = false;
            //console.log(keyIdArray[i] + " RELEASED");
        }
    }
});

// Reset inputs when window is unfocused
function checkFocus() {
    if (!document.hasFocus()) {
        keyStateArray.fill(false);
    }
}
const checkFocusIntervalId = setInterval(checkFocus, 16) // 16ms = 1 frame at 60 FPS

// Expose keyStateArray to GML
function get_key_state_array() {
    return JSON.stringify(keyStateArray);
}