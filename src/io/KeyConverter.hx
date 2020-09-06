package io;

class KeyConverter 
{
    public static function getKeyName(code:Int):Null<String>
    {
        return switch code
        {
            case 48: "0";
            case 49: "1";
            case 50: "2";
            case 51: "3";
            case 52: "4";
            case 53: "5";
            case 54: "6";
            case 55: "7";
            case 56: "8";
            case 57: "9";
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
            case 106: "NUMPAD_*";
            case 107: "NUMPAD_+";
            case 108: "NUMPAD_ENTER";
            case 109: "NUMPAD_-";
            case 110: "NUMPAD_.";
            case 111: "NUMPAD_/";
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
            case 18: "ALT";
            case 13: "ENTER";
            case 15: "CMD";
            case 16: "SHIFT";
            case 17: "CTRL";
            case 20: "CAPS";
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
            case 186: ";";
            case 187: "=";
            case 188: ",";
            case 189: "-";
            case 190: "~";
            case 191: "/";
            case 192: "`";
            case 219: "{";
            case 220: "\\";
            case 221: "}";
            case 222: "QUOTE";
            default: null;
        }
    }    
}