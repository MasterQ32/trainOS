#include <kstdlib.h>
#include <kernel.h>

void exit(int errorCode)
{
	static char buffer[128];
	static char tmp[10];
	strcpy(buffer, "Program exited with error code ");
	strcat(buffer, itoa(errorCode, tmp, 10));
	strcat(buffer, ".\n");
	die(buffer);
}

static void reverse(char *str, int length)
{
    int start = 0;
    int end = length -1;
    while (start < end)
    {
		char tmp = *(str+start);
		*(str+start) = *(str+end);
		*(str+end) = tmp;
        start++;
        end--;
    }
}

char *itoa(int num, char *str, int base)
{
    int i = 0;
    int isNegative = 0;

	if(str == nullptr) {
		static char tmp[64];
		str = tmp;
	}

    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }

    // In standard itoa(), negative numbers are handled only with
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = 1;
        num = -num;
    }

    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'A' : rem + '0';
        num = num/base;
    }

    // If number is negative, append '-'
    if (isNegative)
	{
		str[i++] = '-';
	}
    str[i] = '\0'; // Append string terminator

    // Reverse the string
    reverse(str, i);

    return str;
}

int atoi(const char *str)
{
	int res = 0;
	for (int i = 0; str[i] != '\0'; ++i)
	{
		res = res * 10 + str[i] - '0';
	}
	return res;
}

float atof(const char *str)
{
    // HACK: Implement
    return 42.0f;
}

double atod(const char *str)
{
    // HACK: Implement
    return 42.0;
}

void *memmove( void *destination, const void *source, size_t num)
{
	// TODO: Implement memmove
	return nullptr;
}

int sprintf(char *target, const char *format, ...)
{
	va_list vl;
	va_start(vl, format);
	int len = vsprintf(target, format, vl);
	va_end(vl);

	return len;
}

int vsprintf(char *target, const char *format, va_list vl)
{
	int length = 0;
	char buffer[32];
	while(*format != 0)
	{
		char c = *(format++);
		if(c == '%')
		{
			c = *(format++);
			int i;
			char *tmp;
			size_t len;
			switch(c)
			{
				case 'd':
				case 'i':
					i = va_arg(vl, int);
					tmp = itoa(i, buffer, 10);
					len = strlen(tmp);
					if(target != nullptr) {
						strcat(target, tmp);
						target += len;
					}
					length += len;
					break;
				case 'b':
					i = va_arg(vl, int);
					tmp = itoa(i, buffer, 2);
					len = strlen(tmp);
					if(target != nullptr) {
						strcat(target, tmp);
						target += len;
					}
					length += len;
					break;
				case 'x':
				case 'X':
					i = va_arg(vl, int);
					tmp = itoa(i, buffer, 16);
					len = strlen(tmp);
					if(target != nullptr) {
						strcat(target, tmp);
						target += len;
					}
					length += len;
					break;
				case 's':
					tmp = va_arg(vl, char*);
					len = strlen(tmp);
					if(target != nullptr) {
						strcat(target, tmp);
						target += len;
					}
					length += len;
					break;
				case 'c':
					c = va_arg(vl, int);
				default:
					if(target != nullptr) {
						*target++ = c;
					}
					length += 1;
					break;
			}
		}
		else
		{
			if(target != nullptr) *target++ = c;
			length += 1;
		}
	}
	if(target != nullptr) {
		target[length] = 0;
	}
	return length;
}
