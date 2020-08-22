package io;

class KeyConverter 
{
    public static function getKeyName(code:Int):Null<String>
    {
        return switch code
        {
            case 48: "NUMBER_0";
            case 49: "NUMBER_1";
            case 50: "NUMBER_2";
            case 51: "NUMBER_3";
            case 52: "NUMBER_4";
            case 53: "NUMBER_5";
            case 54: "NUMBER_6";
            case 55: "NUMBER_7";
            case 56: "NUMBER_8";
            case 57: "NUMBER_9";
            case 65: "A";
            case 66: "B";
            case 67: "C";
            case 68: "D";
            case 69: "E";
            case 70: "F";
            case 71: "G";
            case 72: "H";
            case 73: "I";
            case 74: "J";
            case 75: "K";
            case 76: "L";
            case 77: "M";
            case 78: "N";
            case 79: "O";
            case 80: "P";
            case 81: "Q";
            case 82: "R";
            case 83: "S";
            case 84: "T";
            case 85: "U";
            case 86: "V";
            case 87: "W";
            case 88: "X";
            case 89: "Y";
            case 90: "Z";
            case 96: "NUMPAD_0";
            case 97: "NUMPAD_1";
            case 98: "NUMPAD_2";
            case 99: "NUMPAD_3";
            case 100: "NUMPAD_4";
            case 101: "NUMPAD_5";
            case 102: "NUMPAD_6";
            case 103: "NUMPAD_7";
            case 104: "NUMPAD_8";
            case 105: "NUMPAD_9";
            case 106: "NUMPAD_MULTIPLY";
            case 107: "NUMPAD_ADD";
            case 108: "NUMPAD_ENTER";
            case 109: "NUMPAD_SUBTRACT";
            case 110: "NUMPAD_DECIMAL";
            case 111: "NUMPAD_DIVIDE";
            case 112: "F1";
            case 113: "F2";
            case 114: "F3";
            case 115: "F4";
            case 116: "F5";
            case 117: "F6";
            case 118: "F7";
            case 119: "F8";
            case 120: "F9";
            case 121: "F10"; //  F10 is used by browser.
            case 122: "F11";
            case 123: "F12";
            case 124: "F13";
            case 125: "F14";
            case 126: "F15";
            case 8: "BACKSPACE";
            case 9: "TAB";
            case 18: "ALTERNATE";
            case 13: "ENTER";
            case 15: "COMMAND";
            case 16: "SHIFT";
            case 17: "CONTROL";
            case 20: "CAPS_LOCK";
            case 21: "NUMPAD";
            case 27: "ESCAPE";
            case 32: "SPACE";
            case 33: "PAGE_UP";
            case 34: "PAGE_DOWN";
            case 35: "END";
            case 36: "HOME";
            case 37: "LEFT";
            case 39: "RIGHT";
            case 38: "UP";
            case 40: "DOWN";
            case 45: "INSERT";
            case 46: "DELETE";
            case 186: "SEMICOLON";
            case 187: "EQUAL";
            case 188: "COMMA";
            case 189: "MINUS";
            case 190: "PERIOD";
            case 191: "SLASH";
            case 192: "BACKQUOTE";
            case 219: "LEFTBRACKET";
            case 220: "BACKSLASH";
            case 221: "RIGHTBRACKET";
            case 222: "QUOTE";
            default: null;
        }
    }    
}