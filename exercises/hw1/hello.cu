#include <stdio.h>

__global__ void hello(){

  printf("Hello from block: %u, thread: %u\n", blockIdx.x,threadIdx.x);
}

int main(){

  hello<<<10,2>>>();
  //host不会等待device执行状态，会直接执行下一条host code。所以为了防止内核打印出其消息前终止，我们需要使用下面的同步函数
  cudaDeviceSynchronize();
}

