void main(string[] args) {
    int[] intArgs = new int[args.length];
    for (int i = 0; i < args.length;i++) {
        intArgs[i] = int.parse(args[i]);
    }
    if (args[1] == "0") { generateRandomNumbers(int.parse(args[2]),int.parse(args[3])); }
    if (args[1] == "1.1") { findMaxElement(intArgs[1:intArgs.length]);}
}
// ----------------------------------
// 0. LCG example
void generateRandomNumbers(int seed, int number) {
    initRandom(seed);
    for (int i = 0; i < number; i++) { stdout.printf("%d\n", randInt()); }
}

const int m = 1 << 31;
const int a = 1103515245;
const int c = 12345;
int prev = 0;
void initRandom(int seed) {
    prev = seed;
}
int randInt() {

    if (prev == 0) {
        stdout.printf("ERROR: random not initiated\n");
        return -1;
    } else {
        prev = (a * prev + c) % m;
    }
    return prev;
}

// ----------------------------------
// 1.1 Find max element function expample
int findMaxElement(int[] arr) {
    int max = arr[0];
    for (int i = 1; i < arr.length;i++) {
        if (max < arr[i]) { max = arr[i];}
    }
    stdout.printf("Max element: %d\n", max);
    return max;
}

// ----------------------------------
// 1.2 Merge sort example
int* merge_sort(int[] arr)
{
    int left = 0;
    int right = arr.length;
    int[] bufArr = new int[arr.length];

    if (left == right)
    {
        bufArr[left] = up[left];
        return bufArr;
    }

    int middle = left + (right - left) / 2;

    // разделяй и сортируй
    int[] l_buff = merge_sort(up, down, left, middle);
    int[] r_buff = merge_sort(up, down, middle + 1, right);

    // слияние двух отсортированных половин
    int[] target = l_buff == up ? down : up;

    int l_cur = left, r_cur = middle + 1;
    for (unsigned int i = left; i <= right; i++)
    {
        if (l_cur <= middle && r_cur <= right)
        {
            if (l_buff[l_cur] < r_buff[r_cur])
            {
                target[i] = l_buff[l_cur];
                l_cur++;
            }
            else
            {
                target[i] = r_buff[r_cur];
                r_cur++;
            }
        }
        else if (l_cur <= middle)
        {
            target[i] = l_buff[l_cur];
            l_cur++;
        }
        else
        {
            target[i] = r_buff[r_cur];
            r_cur++;
        }
    }
    return target;
}
