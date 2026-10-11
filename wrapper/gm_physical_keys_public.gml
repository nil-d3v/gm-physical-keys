enum PhysicalKey {
	KeyA,
	KeyB,
	KeyC,
	KeyD,
	KeyE,
	KeyF,
	KeyG,
	KeyH,
	KeyI,
	KeyJ,
	KeyK,
	KeyL,
	KeyM,
	KeyN,
	KeyO,
	KeyP,
	KeyQ,
	KeyR,
	KeyS,
	KeyT,
	KeyU,
	KeyV,
	KeyW,
	KeyX,
	KeyY,
	KeyZ,
	Digit0,
	Digit1,
	Digit2,
	Digit3,
	Digit4,
	Digit5,
	Digit6,
	Digit7,
	Digit8,
	Digit9,
	Backquote,
	Minus,
	Equal,
	BracketLeft,
	BracketRight,
	Backslash,
	IntlBackslash,
	Semicolon,
	Quote,
	Comma,
	Period,
	Slash,
	ControlLeft,
	ControlRight,
	ShiftLeft,
	ShiftRight,
	AltLeft,
	AltRight,
	MetaLeft,
	MetaRight,
	CapsLock,
	NumLock,
	ScrollLock,
	F1,
	F2,
	F3,
	F4,
	F5,
	F6,
	F7,
	F8,
	F9,
	F10,
	F11,
	F12,
	ArrowUp,
	ArrowDown,
	ArrowLeft,
	ArrowRight,
	Home,
	End,
	PageUp,
	PageDown,
	Insert,
	Delete,
	Numpad0,
	Numpad1,
	Numpad2,
	Numpad3,
	Numpad4,
	Numpad5,
	Numpad6,
	Numpad7,
	Numpad8,
	Numpad9,
	NumpadAdd,
	NumpadSubtract,
	NumpadMultiply,
	NumpadDivide,
	NumpadDecimal,
	NumpadEnter,
	Backspace,
	Tab,
	Enter,
	Space,
	Escape,
	ContextMenu
}

function physical_keyboard_init() {
	if instance_number(oGMPhysicalKeys) < 1 {
		instance_create_depth(0, 0, 0, oGMPhysicalKeys);
	}
}

function physical_keyboard_check(_key) {
	if instance_number(oGMPhysicalKeys) != 1 {
		show_error("physical_keyboard_check(): GM Physical Keys do not appear to be correctly initialized.", true);
	} else if _key >= oGMPhysicalKeys.PHYSICAL_KEY_COUNT {
		show_error("physical_keyboard_check(): Unvalid physical key ID.", true);
	}
	return oGMPhysicalKeys.currentKeyStateArray[_key];
}

function physical_keyboard_check_pressed(_key) {
	if instance_number(oGMPhysicalKeys) != 1 {
		show_error("physical_keyboard_check(): GM Physical Keys do not appear to be correctly initialized.", true);
	} else if _key >= oGMPhysicalKeys.PHYSICAL_KEY_COUNT {
		show_error("physical_keyboard_check(): Unvalid physical key ID.", true);
	}
	return (oGMPhysicalKeys.currentKeyStateArray[_key] && !oGMPhysicalKeys.previousKeyStateArray[_key]);
}

function physical_keyboard_check_released(_key) {
	if instance_number(oGMPhysicalKeys) != 1 {
		show_error("physical_keyboard_check(): GM Physical Keys do not appear to be correctly initialized.", true);
	} else if _key >= oGMPhysicalKeys.PHYSICAL_KEY_COUNT {
		show_error("physical_keyboard_check(): Unvalid physical key ID.", true);
	}
	return (!oGMPhysicalKeys.currentKeyStateArray[_key] && oGMPhysicalKeys.previousKeyStateArray[_key]);
}