#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <bitset>
#include <iomanip>

using namespace std;

vector<string> substring;
vector<int> machinecode;

int opcode = 0;
int rd = 0, rs1 = 0, rs2 = 0, imm = 0;
int result = 0;

void RdTrans(void)
{

    if (substring[1] == "AX")
    {
        rd = 0b00;
    }
    else if (substring[1] == "BX")
    {
        rd = 0b01;
    }
    else if (substring[1] == "CX")
    {
        rd = 0b10;
    }
    else if (substring[1] == "DX")
    {
        rd = 0b11;
    }
    else
    {
        abort();
    }
    rd = rd << 5;
    result |= rd;
}

void Rs1Trans(void)
{

    if (substring[2] == "AX")
    {
        rs1 = 0b00;
    }
    else if (substring[2] == "BX")
    {
        rs1 = 0b01;
    }
    else if (substring[2] == "CX")
    {
        rs1 = 0b10;
    }
    else if (substring[2] == "DX")
    {
        rs1 = 0b11;
    }
    else
    {
        abort();
    }
    rs1 = rs1 << 7;
    result |= rs1;
}

void Rs2Trans(void)
{

    if (substring[3] == "AX")
    {
        rs2 = 0b00;
    }
    else if (substring[3] == "BX")
    {
        rs2 = 0b01;
    }
    else if (substring[3] == "CX")
    {
        rs2 = 0b10;
    }
    else if (substring[3] == "DX")
    {
        rs2 = 0b11;
    }
    else
    {
        abort();
    }
    rs2 = rs2 << 9;
    result |= rs2;
}

int main()
{
    std::ifstream inputFile("code.txt");
    std::ofstream outputFile("machinecode.txt");

    while (true)
    {
        string input;
        input.clear();
        getline(inputFile, input);

        if (input == "END")
        {
            break;
        }

        int pos = 0, lpos = 0;
        substring.clear();
        opcode = 0;
        rd = 0, rs1 = 0, rs2 = 0, imm = 0;
        result = 0;
        while (input.find(" ", pos) != string::npos)
        {
            pos = input.find(" ", pos);
            substring.emplace_back(input.substr(lpos, pos - lpos));
            lpos = ++pos;
            //pos++;
        }
        substring.emplace_back(input.substr(pos));
        if (substring[0] == "ADDI")
        {
            opcode = 0b00000;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
        }
        else if (substring[0] == "ADD")
        {
            opcode = 0b10000;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "ADDC")
        {
            opcode = 0b10000;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
            result |= 1 << 11;
        }
        else if (substring[0] == "ANDI")
        {
            opcode = 0b01000;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
        }
        else if (substring[0] == "AND")
        {
            opcode = 0b11000;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "ORI")
        {
            opcode = 0b00100;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
        }
        else if (substring[0] == "OR")
        {
            opcode = 0b10100;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "XORI")
        {
            opcode = 0b01100;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
        }
        else if (substring[0] == "XOR")
        {
            opcode = 0b11100;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "SUB")
        {
            opcode = 0b11110;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "SUBB")
        {
            opcode = 0b11110;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
            result |= 1 << 11;
        }
        else if (substring[0] == "XORI")
        {
            opcode = 0b01100;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
        }
        else if (substring[0] == "XOR")
        {
            opcode = 0b11100;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "SLLI")
        {
            opcode = 0b01010;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
            }
        else if (substring[0] == "SLL")
        {
            opcode = 0b11010;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
            }
        else if (substring[0] == "SRLI")
        {
            opcode = 0b00010;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
            }
        else if (substring[0] == "SRL")
        {
            opcode = 0b10010;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
        }
        else if (substring[0] == "SRAI")
        {
            opcode = 0b00110;
            RdTrans();
            Rs1Trans();
            result |= stoi(substring[3]) << 9;
            result |= opcode;
            }
        else if (substring[0] == "SRA")
        {
            opcode = 0b10110;
            RdTrans();
            Rs1Trans();
            Rs2Trans();
            result |= opcode;
            }
        else
        {
            abort();
        }

        machinecode.emplace_back(result);
    }

    outputFile << setiosflags(ios::uppercase) << hex;

    for (auto temp : machinecode)
    {
        outputFile << setfill('0') << setw(4) << temp << " ";
    }

    outputFile << endl << endl;

    for (auto temp : machinecode)
    {
        outputFile << bitset<16>(temp) << endl;
    }

    printf("Assemble complete...\n");
    system("PAUSE");
}